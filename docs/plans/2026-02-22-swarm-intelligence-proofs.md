# Swarm Intelligence Proofs Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Prove the swarm intelligence system works under real-world conditions: parallel isolation, cross-process coordination, fault tolerance, and scalability.

**Architecture:** Extend existing test suite with 4 new test modules: parallel isolation tests (in-memory concurrency), cross-process tests (subprocess coordination), fault tolerance tests (crash recovery), and scalability tests (100+ tasks). Tests use multiprocessing module for true parallelism and tempfile for isolated storage.

**Tech Stack:** Python 3.12, pytest, multiprocessing, tempfile, threading

---

## Task 1: Parallel Isolation Tests

**Files:**
- Create: `tests/swarm/test_parallel_isolation.py`

**Step 1: Write the failing test for concurrent claiming**

```python
"""
Parallel isolation tests - prove multiple agents can work simultaneously
without interference or race conditions.
"""

import pytest
import threading
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


class TestParallelIsolation:
    """Tests proving parallel agent isolation."""

    def test_concurrent_claiming_no_double_claims(self, tmp_path):
        """Multiple agents claiming tasks concurrently - no double claims."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create 10 tasks
        for i in range(10):
            task = Task(
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                payload={"index": i}
            )
            board.post(task)

        claimed_ids = []
        claimed_lock = threading.Lock()

        def claim_task(agent_id):
            agent = SwarmAgent(agent_id=agent_id, task_board=board)
            task = agent.claim_next_task()
            if task:
                with claimed_lock:
                    claimed_ids.append(task.task_id)
                agent.complete_task(task, {"done": True})
            return task

        # 5 agents claim concurrently via threads
        with ThreadPoolExecutor(max_workers=5) as executor:
            futures = [executor.submit(claim_task, f"agent-{i}") for i in range(5)]
            for f in futures:
                f.result()  # Wait for completion

        # Each task claimed exactly once
        assert len(claimed_ids) == 5
        assert len(set(claimed_ids)) == 5  # No duplicates
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_parallel_isolation.py::TestParallelIsolation::test_concurrent_claiming_no_double_claims -v`
Expected: FAIL (file doesn't exist yet)

**Step 3: Add remaining isolation tests**

```python
    def test_concurrent_results_no_mixing(self, tmp_path):
        """Results from different agents don't get mixed up."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create tasks with agent-specific payloads
        for i in range(3):
            task = Task(
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                payload={"agent_should_write": f"result-{i}"}
            )
            board.post(task)

        def claim_and_complete(agent_id):
            agent = SwarmAgent(agent_id=agent_id, task_board=board)
            task = agent.claim_next_task()
            if task:
                expected = task.payload["agent_should_write"]
                agent.complete_task(task, {"result": expected})
                return task.task_id, expected
            return None, None

        results = []
        with ThreadPoolExecutor(max_workers=3) as executor:
            futures = [executor.submit(claim_and_complete, f"agent-{i}") for i in range(3)]
            for f in futures:
                task_id, result = f.result()
                if task_id:
                    results.append((task_id, result))

        # Verify each task has correct result
        for task_id, expected in results:
            task = board.get(task_id)
            assert task.result["result"] == expected

    def test_file_locking_prevents_race_conditions(self, tmp_path):
        """flock prevents simultaneous writes from corrupting data."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create single task
        task = Task(
            task_type=TaskType.CODE_ANALYSIS,
            description="Contended task",
            payload={}
        )
        board.post(task)

        winners = []
        lock = threading.Lock()

        def try_claim(agent_id):
            agent = SwarmAgent(agent_id=agent_id, task_board=board)
            task = agent.claim_next_task()
            if task:
                with lock:
                    winners.append(agent_id)
                agent.complete_task(task, {"winner": agent_id})

        # 10 agents race for same task
        with ThreadPoolExecutor(max_workers=10) as executor:
            futures = [executor.submit(try_claim, f"agent-{i}") for i in range(10)]
            for f in futures:
                f.result()

        # Exactly one winner
        assert len(winners) == 1
```

**Step 4: Run parallel isolation tests**

Run: `pytest tests/swarm/test_parallel_isolation.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add tests/swarm/test_parallel_isolation.py
git commit -m "test(swarm): add parallel isolation tests for concurrent claiming"
```

---

## Task 2: Cross-Process Coordination Tests

**Files:**
- Create: `tests/swarm/test_cross_process.py`

**Step 1: Write the failing test for subprocess coordination**

```python
"""
Cross-process coordination tests - prove agents in separate processes
can coordinate through shared TaskBoard.
"""

import pytest
import subprocess
import sys
import tempfile
import json
from pathlib import Path

from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard


class TestCrossProcessCoordination:
    """Tests proving cross-process coordination works."""

    def test_subprocess_agents_coordinate_via_shared_taskboard(self, tmp_path):
        """Agents in separate processes coordinate through TaskBoard."""
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create 3 tasks
        for i in range(3):
            task = Task(
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                payload={"index": i}
            )
            board.post(task)

        # Worker script that claims and completes one task
        worker_script = f'''
import sys
sys.path.insert(0, "{Path.cwd()}")
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent

board = TaskBoard(storage_path="{storage_path}")
agent = SwarmAgent(agent_id="subprocess-agent", task_board=board)
task = agent.claim_next_task()
if task:
    agent.complete_task(task, {{"completed_by": "subprocess", "index": task.payload.get("index")}})
    print(f"COMPLETED: {{task.task_id}}")
else:
    print("NO_TASK")
'''

        # Run 3 subprocesses
        processes = []
        for _ in range(3):
            p = subprocess.Popen(
                [sys.executable, "-c", worker_script],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                cwd=Path.cwd()
            )
            processes.append(p)

        # Wait for all to complete
        outputs = []
        for p in processes:
            stdout, stderr = p.communicate(timeout=30)
            outputs.append(stdout.decode().strip())

        # All 3 should have completed a task
        completed = [o for o in outputs if o.startswith("COMPLETED:")]
        assert len(completed) == 3

        # Verify all tasks are completed
        pending = board.get_pending()
        assert len(pending) == 0
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_cross_process.py::TestCrossProcessCoordination::test_subprocess_agents_coordinate_via_shared_taskboard -v`
Expected: FAIL (file doesn't exist yet)

**Step 3: Add remaining cross-process tests**

```python
    def test_no_communication_except_taskboard(self, tmp_path):
        """Agents have no shared state except TaskBoard files."""
        storage_path = str(tmp_path / "tasks")

        # Worker that verifies isolation
        worker_script = f'''
import sys
import os
sys.path.insert(0, "{Path.cwd()}")
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent

# Verify no shared environment variables
assert "SHARED_STATE" not in os.environ, "Should not have shared env"

board = TaskBoard(storage_path="{storage_path}")
agent = SwarmAgent(agent_id="isolated-agent", task_board=board)

# The ONLY shared state should be the storage directory
# No shared memory, no shared variables
print("ISOLATION_VERIFIED")
'''

        p = subprocess.Popen(
            [sys.executable, "-c", worker_script],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            cwd=Path.cwd()
        )
        stdout, _ = p.communicate(timeout=10)
        assert "ISOLATION_VERIFIED" in stdout.decode()

    def test_multiple_workers_one_taskboard(self, tmp_path):
        """Multiple worker processes share one TaskBoard efficiently."""
        storage_path = str(tmp_path / "tasks")
        board = TaskBoard(storage_path=storage_path)

        # Create 9 tasks (divisible by 3 workers)
        for i in range(9):
            task = Task(
                task_type=TaskType.PARALLEL_SEARCH,
                description=f"Search {i}",
                payload={"query": f"pattern-{i}"}
            )
            board.post(task)

        worker_script = f'''
import sys
sys.path.insert(0, "{Path.cwd()}")
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent

board = TaskBoard(storage_path="{storage_path}")
agent = SwarmAgent(agent_id="worker", task_board=board)

completed = 0
while True:
    task = agent.claim_next_task()
    if not task:
        break
    agent.complete_task(task, {{"found": True}})
    completed += 1

print(f"COMPLETED:{{completed}}")
'''

        # Run 3 workers
        processes = []
        for _ in range(3):
            p = subprocess.Popen(
                [sys.executable, "-c", worker_script],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                cwd=Path.cwd()
            )
            processes.append(p)

        outputs = []
        for p in processes:
            stdout, _ = p.communicate(timeout=30)
            outputs.append(stdout.decode().strip())

        # Parse completion counts
        total_completed = sum(
            int(o.split(":")[1]) for o in outputs if o.startswith("COMPLETED:")
        )
        assert total_completed == 9
```

**Step 4: Run cross-process tests**

Run: `pytest tests/swarm/test_cross_process.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add tests/swarm/test_cross_process.py
git commit -m "test(swarm): add cross-process coordination tests with subprocesses"
```

---

## Task 3: Fault Tolerance Tests

**Files:**
- Create: `tests/swarm/test_fault_tolerance.py`

**Step 1: Write the failing test for crash recovery**

```python
"""
Fault tolerance tests - prove the system handles failures gracefully.
"""

import pytest
import time
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


class TestFaultTolerance:
    """Tests proving fault tolerance."""

    def test_claimed_task_becomes_reclaimable_after_timeout(self, tmp_path):
        """If agent crashes after claiming, task becomes reclaimable."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create task
        task = Task(
            task_type=TaskType.CODE_ANALYSIS,
            description="Crash-prone task",
            payload={}
        )
        board.post(task)

        # Agent 1 claims but "crashes" (doesn't complete)
        agent1 = SwarmAgent(agent_id="crashy-agent", task_board=board)
        claimed_task = agent1.claim_next_task()
        assert claimed_task is not None

        # Manually set claim to old timestamp (simulating crash)
        import json
        task_file = Path(tmp_path / "tasks" / f"{claimed_task.task_id}.json")
        with open(task_file, 'r') as f:
            data = json.load(f)

        # Set claimed_at to 1 hour ago
        data['claimed_at'] = time.time() - 3600
        with open(task_file, 'w') as f:
            json.dump(data, f)

        # Agent 2 should be able to claim the "stale" task
        agent2 = SwarmAgent(agent_id="recovery-agent", task_board=board)
        recovered_task = agent2.claim_next_task()
        assert recovered_task is not None
        assert recovered_task.task_id == claimed_task.task_id
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_fault_tolerance.py::TestFaultTolerance::test_claimed_task_becomes_reclaimable_after_timeout -v`
Expected: FAIL (file doesn't exist yet)

**Step 3: Add remaining fault tolerance tests**

```python
    def test_corrupted_task_file_quarantined(self, tmp_path):
        """Corrupted task files are detected and don't crash the system."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create valid task
        task = Task(
            task_type=TaskType.CODE_ANALYSIS,
            description="Good task",
            payload={}
        )
        board.post(task)

        # Create corrupted task file
        corrupted_path = Path(tmp_path / "tasks" / "corrupted-task-id.json")
        corrupted_path.write_text("not valid json {{{")

        # Getting pending should skip corrupted file, not crash
        pending = board.get_pending()
        assert len(pending) == 1
        assert pending[0].task_id == task.task_id

    def test_agent_fail_task_marks_failed(self, tmp_path):
        """Agent can mark task as failed and it's tracked properly."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        task = Task(
            task_type=TaskType.CODE_ANALYSIS,
            description="Will fail",
            payload={}
        )
        board.post(task)

        agent = SwarmAgent(agent_id="failing-agent", task_board=board)
        claimed = agent.claim_next_task()
        assert claimed is not None

        # Agent fails the task
        agent.fail_task(claimed, error="Something went wrong")

        # Task should be marked as failed
        updated = board.get(claimed.task_id)
        assert updated.status == TaskStatus.FAILED
        assert "error" in updated.result
        assert "Something went wrong" in updated.result["error"]

    def test_graceful_handling_of_missing_storage(self, tmp_path):
        """TaskBoard handles missing storage directory gracefully."""
        nonexistent_path = str(tmp_path / "nonexistent" / "tasks")

        # Should create directory automatically
        board = TaskBoard(storage_path=nonexistent_path)

        # Should work fine
        task = Task(
            task_type=TaskType.CODE_ANALYSIS,
            description="First task",
            payload={}
        )
        board.post(task)

        pending = board.get_pending()
        assert len(pending) == 1
```

**Step 4: Run fault tolerance tests**

Run: `pytest tests/swarm/test_fault_tolerance.py -v`
Expected: 4 passed

**Step 5: Commit**

```bash
git add tests/swarm/test_fault_tolerance.py
git commit -m "test(swarm): add fault tolerance tests for crash recovery"
```

---

## Task 4: Scalability Tests

**Files:**
- Create: `tests/swarm/test_scalability.py`

**Step 1: Write the failing test for 100 tasks**

```python
"""
Scalability tests - prove the system handles load efficiently.
"""

import pytest
import time
from pathlib import Path

from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.swarm_coordinator import SwarmCoordinator


class TestScalability:
    """Tests proving scalability."""

    def test_100_tasks_distributed_across_10_agents(self, tmp_path):
        """100 tasks distributed evenly across 10 agents."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create 100 tasks via map
        parent_id = coord.map(
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search tasks",
            subtask_payloads=[{"index": i, "query": f"pattern-{i}"} for i in range(100)]
        )

        # 10 agents claim and complete
        agents = [SwarmAgent(agent_id=f"agent-{i}", task_board=board) for i in range(10)]
        completed_by = {f"agent-{i}": 0 for i in range(10)}

        for agent in agents:
            for _ in range(15):  # Each can do up to 15
                task = agent.claim_next_task()
                if task:
                    agent.complete_task(task, {"found": True})
                    completed_by[agent.agent_id] += 1

        total = sum(completed_by.values())
        assert total == 100

        # Check distribution is reasonably balanced
        counts = list(completed_by.values())
        assert max(counts) - min(counts) <= 2  # Within 2 tasks of each other
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_scalability.py::TestScalability::test_100_tasks_distributed_across_10_agents -v`
Expected: FAIL (file doesn't exist yet)

**Step 3: Add remaining scalability tests**

```python
    def test_1000_tasks_with_progress_tracking(self, tmp_path):
        """1000 tasks with progress tracking stays efficient."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create 1000 tasks
        parent_id = coord.map(
            task_type=TaskType.PARALLEL_SEARCH,
            description="Many tasks",
            subtask_payloads=[{"i": i} for i in range(1000)]
        )

        # Check initial progress
        progress = coord.get_progress(parent_id)
        assert progress["total"] == 1000
        assert progress["completed"] == 0

        # Complete half
        agent = SwarmAgent(agent_id="bulk-agent", task_board=board)
        for _ in range(500):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {"done": True})

        progress = coord.get_progress(parent_id)
        assert progress["completed"] == 500
        assert progress["progress_pct"] == 50.0

    def test_claim_latency_under_10ms(self, tmp_path):
        """Task claim latency is under 10ms for 100 tasks."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create 100 tasks
        for i in range(100):
            task = Task(
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                payload={}
            )
            board.post(task)

        agent = SwarmAgent(agent_id="latency-test", task_board=board)

        latencies = []
        for _ in range(50):
            start = time.perf_counter()
            task = agent.claim_next_task()
            elapsed = time.perf_counter() - start

            if task:
                latencies.append(elapsed * 1000)  # Convert to ms
                agent.complete_task(task, {"done": True})

        avg_latency = sum(latencies) / len(latencies)
        assert avg_latency < 10, f"Average claim latency {avg_latency:.2f}ms exceeds 10ms"

    def test_memory_usage_stays_bounded(self, tmp_path):
        """Memory usage stays bounded with many tasks."""
        import tracemalloc

        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        tracemalloc.start()
        baseline = tracemalloc.get_traced_memory()[0]

        # Create 500 tasks
        for i in range(500):
            task = Task(
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}",
                payload={"data": "x" * 100}  # Some payload
            )
            board.post(task)

        peak = tracemalloc.get_traced_memory()[1]
        tracemalloc.stop()

        # Memory growth should be under 10MB for 500 tasks
        growth = peak - baseline
        assert growth < 10 * 1024 * 1024, f"Memory growth {growth / 1024 / 1024:.1f}MB exceeds 10MB"
```

**Step 4: Run scalability tests**

Run: `pytest tests/swarm/test_scalability.py -v`
Expected: 4 passed

**Step 5: Commit**

```bash
git add tests/swarm/test_scalability.py
git commit -m "test(swarm): add scalability tests for 100+ tasks"
```

---

## Task 5: Verify All Proofs Pass

**Step 1: Run all swarm tests**

Run: `pytest tests/swarm/ -v`
Expected: All tests pass (32 original + 14 new = 46 total)

**Step 2: Run with timing info**

Run: `pytest tests/swarm/ --durations=20`
Expected: All tests complete, slowest tests shown

**Step 3: Final commit**

```bash
git add docs/plans/2026-02-22-swarm-intelligence-proofs.md
git commit -m "docs(swarm): add proof-of-concept test plan"
```

---

## Summary

| Task | Tests | Description |
|------|-------|-------------|
| 1. Parallel Isolation | 3 | Concurrent claiming, no mixing, file locking |
| 2. Cross-Process | 3 | Subprocess coordination, isolation, shared board |
| 3. Fault Tolerance | 4 | Crash recovery, corruption, failure handling |
| 4. Scalability | 4 | 100/1000 tasks, latency < 10ms, bounded memory |
| **Total New** | **14** | |
| **Original** | **32** | |
| **Grand Total** | **46** | |
