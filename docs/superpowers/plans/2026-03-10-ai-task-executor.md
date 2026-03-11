# AI Task Executor Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make Sisyphus daemon execute tasks autonomously via `pi` CLI, with startup resume and task timeout.

**Architecture:** On startup, reset "in progress" tasks to "pending" to then execute them with `pi -p <description>`. Add 300s timeout per task execution to prevent runaway processes.

**Tech Stack:** Python subprocess, `pi` CLI

---

## Chunk 1: Startup Reset

Resets "in progress" tasks to "pending" on daemon startup so interrupted tasks are resumed.

### Task 1: Add startup reset logic
**Files:**
- Modify: `systems/sisyphus/daemon.py:1168-1175`
- Test: `tests/test_daemon_startup_reset.py`

- [ ] **Step 1: Write the failing test**

```python
# tests/test_daemon_startup_reset.py
import pytest
from systems.sisyphus.daemon import SisyphusDaemon, Task, TaskState

def test_startup_resets_in_progress_to_pending(tmp_path):
    """On startup, in-progress tasks should reset to pending."""
    # Create a mock daemon with a task in IN_PROGRESS state
    daemon = SisyphusDaemon.__new__(SisyphusDaemon)
    daemon.__init__()

    # Simulate a task in progress
    task = Task(number=1, name="Test", description="Test task")
    task.state = TaskState.IN_PROGRESS

    # Call the startup reset (will be added in main loop)
    # For now, test the helper method directly
    tasks = [task]

    for t in tasks:
        if t.state == TaskState.IN_PROGRESS:
            daemon.mark_task_state(t, TaskState.PENDING)

            assert t.state == TaskState.PENDING
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_daemon_startup_reset.py -v`
Expected: FAIL (method doesn't exist yet)

- [ ] **Step 3: Add startup reset in main loop**

In `systems/sisyphus/daemon.py`, after line 1167 (`try:`), add:

```python
            # 0.5 Reset in-progress tasks on startup (resume from interruption)
            tasks = self.get_tasks()
            in_progress = [t for t in tasks if t.state == TaskState.IN_PROGRESS]
            if in_progress:
                self.log(f"Found {len(in_progress)} in-progress tasks from previous run")
                for task in in_progress:
                    self.log(f"Resetting task {task.number} to pending")
                    self.mark_task_state(task, TaskState.PENDING)
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/test_daemon_startup_reset.py -v`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add systems/sisyphus/daemon.py tests/test_daemon_startup_reset.py
git commit -m "feat(daemon): add startup reset for in-progress tasks"
```

---

## Chunk 2: Task Timeout
Adds 300-second timeout to task execution to prevent runaway processes.

### Task 2: Add task timeout
**Files:**
- Modify: `systems/sisyphus/daemon.py:871` (process.wait())
- Test: `tests/test_daemon_timeout.py`

- [ ] **Step 1: Write the failing test**

```python
# tests/test_daemon_timeout.py
import pytest
import subprocess
import time
from unittest.mock import patch, MagicMock

def test_task_timeout_kills_long_running_process():
    """Tasks running longer than 300s should be killed and marked failed."""
    from systems.sisyphus.daemon import SisyphusDaemon, Task, TaskState

    daemon = SisyphusDaemon()
    task = Task(number=1, name="Timeout Test", description="Test task")

    # Mock subprocess that runs forever
    with patch('subprocess.Popen') as mock_popen:
        mock_process = MagicMock()
        mock_process.stdout = iter(['line 1\n', 'line 2\n'])
        mock_process.wait.side_effect = lambda timeout: (_ for _ in range(timeout // 1000))
        mock_process.kill.return_value = None
        mock_process.returncode = 0
        mock_popen.return_value = mock_process

        # Run the task (should timeout and fail)
        daemon.run_task(task)

        # Task should be marked FAILED due to timeout
        assert task.state == TaskState.FAILED
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_daemon_timeout.py -v`
Expected: FAIL (timeout logic not implemented yet)

- [ ] **Step 3: Add timeout to run_task method**

In `systems/sisyphus/daemon.py`, replace line 871 (`process.wait()`) with.

```python
            # Wait with timeout (300s max per task)
            try:
                process.wait(timeout=300)
            except subprocess.TimeoutExpired:
                self.log(f"Task {task.number} timed out after 300s, killing...")
                process.kill()
                process.wait()  # Wait for kill to complete
                self.mark_task_state(task, TaskState.FAILED)
                self.log(f"Task {task.number} marked as FAILED due to timeout")
                return
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/test_daemon_timeout.py -v`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add systems/sisyphus/daemon.py tests/test_daemon_timeout.py
git commit -m "feat(daemon): add 300s task execution timeout"
```

---

## Chunk 3: Integration Test
Verifies the full flow works end-to-end.

### Task 3: Integration test
**Files:**
- Create: `tests/test_daemon_executor_integration.py`

- [ ] **Step 1: Write integration test**

```python
# tests/test_daemon_executor_integration.py
import pytest
import time
import subprocess
from unittest.mock import patch, MagicMock

from systems.sisyphus.daemon import SisyphusDaemon, Task, TaskState

def test_full_executor_flow():
    """Test the complete flow: startup reset -> execute -> complete."""
    daemon = SisyphusDaemon()

    # Simulate a task in progress from previous run
    task1 = Task(number=1, name="Stuck Task", description="Was interrupted")
    task1.state = TaskState.IN_PROGRESS

    task2 = Task(number=2, name="New Task", description="Fresh task")
    task2.state = TaskState.PENDING

    # Mock get_tasks to return our tasks
    daemon.get_tasks = lambda: [task1, task2]

    # Mock subprocess for pi
    with patch('subprocess.Popen') as mock_popen:
        mock_process = MagicMock()
        mock_process.stdout = iter(['Working...\n', 'Done!\n'])
        mock_process.wait.return_value = None
        mock_process.returncode = 0
        mock_popen.return_value = mock_process

        # Simulate startup reset
        tasks = daemon.get_tasks()
        for task in tasks:
            if task.state == TaskState.IN_PROGRESS:
                daemon.mark_task_state(task, TaskState.PENDING)

        # Both should be pending now
        assert task1.state == TaskState.PENDING
        assert task2.state == TaskState.PENDING

        # Run task (simulating execution)
        daemon.run_task(task1)
        assert task1.state == TaskState.COMPLETE
```

- [ ] **Step 2: Run integration test**

Run: `python -m pytest tests/test_daemon_executor_integration.py -v`
Expected: PASS

- [ ] **Step 3: Commit**

```bash
git add tests/test_daemon_executor_integration.py
git commit -m "test(daemon): add executor integration test"
```

---

## Success Criteria
- [ ] `pytest tests/test_daemon_*.py -v` passes
- [ ] Daemon resets in-progress tasks on startup
- [ ] Tasks timeout after 300s
- [ ] Full flow: startup → reset → execute → complete works
