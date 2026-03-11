# AI Task Executor for Sisyphus Daemon

## Problem
The Sisyphus daemon marks tasks as "in progress" but on restart it waits forever instead of resuming execution. The daemon has task execution logic (`run_task()` calls `pi -p <prompt>`) but doesn't handle the restart case.

## Solution
On daemon startup, reset all "in progress" tasks to "pending", then execute them with `pi`. Add task timeout to prevent runaway processes.

## Changes

### 1. Startup Reset (daemon.py ~line 1170)
In the main loop, before task processing, reset any in-progress tasks:

```python
# Reset in-progress tasks on startup (resume from interruption)
for task in tasks:
    if task.state == TaskState.IN_PROGRESS:
        self.log(f"Resetting in-progress task {task.number} to pending")
        self.mark_task_state(task, TaskState.PENDING)
```

### 2. Task Timeout (daemon.py run_task method)
Add timeout to subprocess to prevent runaway execution:

```python
# In run_task(), wrap process.wait() with timeout:
try:
    process.wait(timeout=300)  # 5 minute max per task
except subprocess.TimeoutExpired:
    process.kill()
    self.mark_task_state(task, TaskState.FAILED)
    self.log(f"Task {task.number} timed out after 300s")
```

## Flow
```
Daemon starts
    ↓
Reset in-progress → pending
    ↓
Pick first pending task
    ↓
Mark "in progress", run `pi -p <description>`
    ↓
On success → mark complete, commit
On failure → mark failed, log error
On timeout → mark failed, kill process
    ↓
Loop to next task
```

## Success Criteria
- Daemon resumes after restart without hanging
- Tasks execute via `pi` subprocess
- Runaway tasks are killed after 300s timeout
- State persists through git commits
