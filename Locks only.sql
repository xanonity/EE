CREATE EVENT SESSION [Locks_only] ON SERVER 
ADD EVENT sqlserver.blocked_process_report,
ADD EVENT sqlserver.lock_acquired(
    ACTION(sqlserver.database_id,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([duration]>(0))),
ADD EVENT sqlserver.lock_deadlock(
    ACTION(sqlserver.database_id,sqlserver.session_id,sqlserver.sql_text)),
ADD EVENT sqlserver.lock_deadlock_chain(
    ACTION(sqlserver.database_id,sqlserver.session_id,sqlserver.sql_text)),
ADD EVENT sqlserver.lock_escalation(
    ACTION(sqlserver.database_id,sqlserver.session_id,sqlserver.sql_text)),
ADD EVENT sqlserver.lock_timeout_greater_than_0(
    ACTION(sqlserver.database_id,sqlserver.session_id,sqlserver.sql_text)),
ADD EVENT sqlserver.xml_deadlock_report(
    ACTION(sqlserver.database_id,sqlserver.session_id,sqlserver.sql_text))
ADD TARGET package0.event_file(SET filename=N'E:\Locks_only.xel')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=4 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

