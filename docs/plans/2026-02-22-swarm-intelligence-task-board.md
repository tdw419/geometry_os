# Swarm Intelligence Task Board Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a decentralized MapReduce-style swarm intelligence system where agents coordinate through a shared task board to perform code analysis, parallel search, solution exploration, and distributed review.

**Architecture:** Each worktree hosts a TaskBoard instance accessible via TelepathyProtocol. Agents claim tasks, execute work, and post results. The system is fully decentralized with no single point of failure. Results are merged using configurable reduction strategies.

**Tech Stack:** Python 3.11+, asyncio, dataclasses, file-based task storage, TelepathyProtocol for P2P communication

---

## Components Overview

| Component | Purpose | Location |
|-----------|---------|----------|
| Task | Data structure for work items | `systems/swarm/task.py` |
| TaskBoard | Shared task storage/claiming | `systems/swarm/task_board.py` |
| SwarmAgent | Agent that executes tasks | `systems/swarm/swarm_agent.py` |
| ReductionStrategies | Result merging logic | `systems/swarm/reduction.py` |
| SwarmCoordinator | High-level orchestration | `systems/swarm/swarm_coordinator.py` |

---

## Task 1: Task Data Structure

**Files:**
- Create: `systems/swarm/task.py`
- Test: `tests/swarm/test_task.py`

**Step 1: Write the failing test**

Create `tests/swarm/test_task.py`:

```python
"""
Tests for Task data structure.
"""

import pytest
import time
from systems.swarm.task import Task, TaskStatus, TaskType


class TestTaskCreation:
    """Test task creation and initialization."""

    def test_create_task_with_defaults(self):
        """Task can be created with minimal arguments."""
        task = Task(
            task_id="task-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze auth module"
        )
        assert task.task_id == "task-001"
        assert task.status == TaskStatus.PENDING
        assert task.priority == 5

    def test_task_has_required_fields(self):
        """Task includes all required fields."""
        task = Task(
            task_id="task-002",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search for TODOs",
            payload={"pattern": "TODO", "paths": ["src/"]}
        )
        assert task.payload["pattern"] == "TODO"
        assert task.created_at > 0

    def test_task_serialization(self):
        """Task can be serialized to JSON."""
        task = Task(
            task_id="task-003",
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Find best sorting approach"
        )
        json_str = task.to_json()
        assert '"task_id": "task-003"' in json_str
        assert 'SOLUTION_EXPLORATION' in json_str

    def test_task_deserialization(self):
        """Task can be deserialized from JSON."""
        json_str = '{"task_id": "task-004", "task_type": "DISTRIBUTED_REVIEW", "description": "Review PR", "status": "PENDING", "priority": 5, "created_at": 1234567890, "claimed_by": null, "claimed_at": null, "result": null, "payload": {}}'
        task = Task.from_json(json_str)
        assert task.task_id == "task-004"
        assert task.task_type == TaskType.DISTRIBUTED_REVIEW
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_task.py -v`
Expected: FAIL with "No module named 'systems.swarm.task'"

**Step 3: Create test directory and implement Task**

```bash
mkdir -p tests/swarm
touch tests/swarm/__init__.py
```

Create `systems/swarm/task.py`:

```python
"""
Task data structure for swarm intelligence.

Represents a unit of work that can be claimed and executed by agents.
"""

import json
import time
from dataclasses import dataclass, field, asdict
from enum import Enum
from typing import Optional, Dict, Any


class TaskStatus(Enum):
    """Lifecycle states for a task."""
    PENDING = "PENDING"
    CLAIMED = "CLAIMED"
    IN_PROGRESS = "IN_PROGRESS"
    COMPLETED = "COMPLETED"
    FAILED = "FAILED"
    CANCELLED = "CANCELLED"


class TaskType(Enum):
    """Types of tasks the swarm can handle."""
    CODE_ANALYSIS = "CODE_ANALYSIS"
    PARALLEL_SEARCH = "PARALLEL_SEARCH"
    SOLUTION_EXPLORATION = "SOLUTION_EXPLORATION"
    DISTRIBUTED_REVIEW = "DISTRIBUTED_REVIEW"


@dataclass
class Task:
    """
    A unit of work for the swarm.

    Tasks flow through states:
    PENDING -> CLAIMED -> IN_PROGRESS -> COMPLETED/FAILED
    """
    task_id: str
    task_type: TaskType
    description: str
    status: TaskStatus = TaskStatus.PENDING
    priority: int = 5  # 1=highest, 10=lowest
    created_at: float = field(default_factory=time.time)
    claimed_by: Optional[str] = None
    claimed_at: Optional[float] = None
    result: Optional[Dict[str, Any]] = None
    payload: Dict[str, Any] = field(default_factory=dict)

    def claim(self, agent_id: str) -> bool:
        """
        Atomically claim this task for an agent.

        Returns True if claim successful, False if already claimed.
        """
        if self.status != TaskStatus.PENDING:
            return False
        self.status = TaskStatus.CLAIMED
        self.claimed_by = agent_id
        self.claimed_at = time.time()
        return True

    def start(self) -> bool:
        """Mark task as in progress."""
        if self.status != TaskStatus.CLAIMED:
            return False
        self.status = TaskStatus.IN_PROGRESS
        return True

    def complete(self, result: Dict[str, Any]) -> bool:
        """Mark task as completed with result."""
        if self.status != TaskStatus.IN_PROGRESS:
            return False
        self.status = TaskStatus.COMPLETED
        self.result = result
        return True

    def fail(self, error: str) -> bool:
        """Mark task as failed with error message."""
        if self.status not in (TaskStatus.CLAIMED, TaskStatus.IN_PROGRESS):
            return False
        self.status = TaskStatus.FAILED
        self.result = {"error": error}
        return True

    def to_json(self) -> str:
        """Serialize task to JSON string."""
        data = asdict(self)
        data["task_type"] = self.task_type.value
        data["status"] = self.status.value
        return json.dumps(data)

    @staticmethod
    def from_json(json_str: str) -> 'Task':
        """Deserialize task from JSON string."""
        data = json.loads(json_str)
        data["task_type"] = TaskType(data["task_type"])
        data["status"] = TaskStatus(data["status"])
        return Task(**data)
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_task.py -v`
Expected: 4 tests PASS

**Step 5: Commit**

```bash
git add systems/swarm/task.py tests/swarm/__init__.py tests/swarm/test_task.py
git commit -m "feat(swarm): add Task data structure for swarm intelligence"
```

---

## Task 2: TaskBoard Implementation

**Files:**
- Create: `systems/swarm/task_board.py`
- Test: `tests/swarm/test_task_board.py`

**Step 1: Write the failing test**

Create `tests/swarm/test_task_board.py`:

```python
"""
Tests for TaskBoard - shared task storage and claiming.
"""

import pytest
import tempfile
import os
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard


class TestTaskBoard:
    """Test task board operations."""

    def test_create_task_board(self, tmp_path):
        """TaskBoard can be created with a storage path."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        assert board.storage_path.exists()

    def test_post_task(self, tmp_path):
        """Tasks can be posted to the board."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        task = Task(
            task_id="post-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze module"
        )
        board.post(task)
        assert board.get("post-001") is not None

    def test_claim_task(self, tmp_path):
        """Tasks can be claimed atomically."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        task = Task(
            task_id="claim-001",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search code"
        )
        board.post(task)

        # First claim succeeds
        claimed = board.claim("claim-001", "agent-alpha")
        assert claimed is True

        # Second claim fails
        claimed2 = board.claim("claim-001", "agent-beta")
        assert claimed2 is False

    def test_get_pending_tasks(self, tmp_path):
        """Can retrieve all pending tasks."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        for i in range(3):
            board.post(Task(
                task_id=f"pending-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}"
            ))

        pending = board.get_pending()
        assert len(pending) == 3

    def test_complete_task(self, tmp_path):
        """Tasks can be completed with results."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        task = Task(
            task_id="complete-001",
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Find solution"
        )
        board.post(task)
        board.claim("complete-001", "agent-1")

        board.complete("complete-001", {"answer": 42})
        completed = board.get("complete-001")
        assert completed.status == TaskStatus.COMPLETED
        assert completed.result["answer"] == 42

    def test_get_by_type(self, tmp_path):
        """Can filter tasks by type."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="type-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze"
        ))
        board.post(Task(
            task_id="type-002",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search"
        ))

        analysis_tasks = board.get_by_type(TaskType.CODE_ANALYSIS)
        assert len(analysis_tasks) == 1
        assert analysis_tasks[0].task_id == "type-001"

    def test_get_results_for_parent(self, tmp_path):
        """Can get all results for a parent task (MapReduce reduce phase)."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Simulate subtasks from a parent
        parent_id = "parent-001"
        for i in range(3):
            task = Task(
                task_id=f"sub-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Subtask {i}",
                payload={"parent_id": parent_id}
            )
            board.post(task)
            board.claim(f"sub-{i}", f"agent-{i}")
            board.complete(f"sub-{i}", {"found": i * 10})

        results = board.get_results_by_parent(parent_id)
        assert len(results) == 3
        assert results[0]["found"] == 0
        assert results[2]["found"] == 20
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_task_board.py -v`
Expected: FAIL with "No module named 'systems.swarm.task_board'"

**Step 3: Implement TaskBoard**

Create `systems/swarm/task_board.py`:

```python
"""
TaskBoard - Shared task storage and claiming mechanism.

Provides a file-based task board that can be accessed by multiple
agents across worktrees.
"""

import json
import os
import fcntl
from pathlib import Path
from typing import List, Optional, Dict, Any

from systems.swarm.task import Task, TaskType, TaskStatus


class TaskBoard:
    """
    A shared task board for swarm coordination.

    Uses file-based storage with locking for cross-process safety.
    Each task is stored as a separate JSON file for atomic operations.
    """

    def __init__(self, storage_path: str):
        """
        Initialize task board.

        Args:
            storage_path: Directory path for task storage
        """
        self.storage_path = Path(storage_path)
        self.storage_path.mkdir(parents=True, exist_ok=True)
        self._lock_path = self.storage_path / ".board.lock"

    def _acquire_lock(self):
        """Acquire exclusive lock for board operations."""
        lock_file = open(self._lock_path, 'w')
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_EX)
        return lock_file

    def _release_lock(self, lock_file):
        """Release the board lock."""
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_UN)
        lock_file.close()

    def _task_path(self, task_id: str) -> Path:
        """Get file path for a task."""
        return self.storage_path / f"{task_id}.json"

    def post(self, task: Task) -> None:
        """
        Post a new task to the board.

        Args:
            task: Task to post
        """
        lock = self._acquire_lock()
        try:
            path = self._task_path(task.task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
        finally:
            self._release_lock(lock)

    def get(self, task_id: str) -> Optional[Task]:
        """
        Get a task by ID.

        Args:
            task_id: Task identifier

        Returns:
            Task if found, None otherwise
        """
        path = self._task_path(task_id)
        if not path.exists():
            return None
        with open(path, 'r') as f:
            return Task.from_json(f.read())

    def claim(self, task_id: str, agent_id: str) -> bool:
        """
        Atomically claim a task for an agent.

        Args:
            task_id: Task to claim
            agent_id: Agent claiming the task

        Returns:
            True if claim successful, False if already claimed
        """
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None:
                return False
            if not task.claim(agent_id):
                return False
            # Write updated task
            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def start(self, task_id: str) -> bool:
        """Mark task as in progress."""
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None or not task.start():
                return False
            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def complete(self, task_id: str, result: Dict[str, Any]) -> bool:
        """
        Mark task as completed with result.

        Args:
            task_id: Task to complete
            result: Result data

        Returns:
            True if successful
        """
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None or not task.complete(result):
                return False
            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def fail(self, task_id: str, error: str) -> bool:
        """Mark task as failed."""
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None or not task.fail(error):
                return False
            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def get_pending(self) -> List[Task]:
        """Get all pending (unclaimed) tasks."""
        tasks = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                task = Task.from_json(f.read())
                if task.status == TaskStatus.PENDING:
                    tasks.append(task)
        return sorted(tasks, key=lambda t: t.priority)

    def get_by_type(self, task_type: TaskType) -> List[Task]:
        """Get all tasks of a specific type."""
        tasks = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                task = Task.from_json(f.read())
                if task.task_type == task_type:
                    tasks.append(task)
        return tasks

    def get_results_by_parent(self, parent_id: str) -> List[Dict[str, Any]]:
        """
        Get all results for subtasks of a parent task.

        Used in MapReduce reduce phase to aggregate results.
        """
        results = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                task = Task.from_json(f.read())
                if (task.payload.get("parent_id") == parent_id
                    and task.status == TaskStatus.COMPLETED
                    and task.result is not None):
                    results.append(task.result)
        return results

    def list_all(self) -> List[Task]:
        """Get all tasks on the board."""
        tasks = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                tasks.append(Task.from_json(f.read()))
        return tasks
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_task_board.py -v`
Expected: 7 tests PASS

**Step 5: Commit**

```bash
git add systems/swarm/task_board.py tests/swarm/test_task_board.py
git commit -m "feat(swarm): add TaskBoard for shared task storage and claiming"
```

---

## Task 3: Reduction Strategies

**Files:**
- Create: `systems/swarm/reduction.py`
- Test: `tests/swarm/test_reduction.py`

**Step 1: Write the failing test**

Create `tests/swarm/test_reduction.py`:

```python
"""
Tests for reduction strategies - merging results from parallel agents.
"""

import pytest
from systems.swarm.reduction import (
    ReductionStrategy,
    FirstResultStrategy,
    BestScoreStrategy,
    MergeAllStrategy,
    MajorityVoteStrategy,
    reduce_results
)


class TestReductionStrategies:
    """Test result reduction strategies."""

    def test_first_result_strategy(self):
        """FirstResult returns the first completed result."""
        strategy = FirstResultStrategy()
        results = [
            {"value": 1},
            {"value": 2},
            {"value": 3}
        ]
        reduced = strategy.reduce(results)
        assert reduced["value"] == 1

    def test_best_score_strategy(self):
        """BestScore picks result with highest score."""
        strategy = BestScoreStrategy(score_key="confidence")
        results = [
            {"answer": "A", "confidence": 0.7},
            {"answer": "B", "confidence": 0.9},
            {"answer": "C", "confidence": 0.5}
        ]
        reduced = strategy.reduce(results)
        assert reduced["answer"] == "B"

    def test_merge_all_strategy(self):
        """MergeAll combines all results into list."""
        strategy = MergeAllStrategy()
        results = [
            {"files": ["a.py"]},
            {"files": ["b.py"]},
            {"files": ["c.py"]}
        ]
        reduced = strategy.reduce(results)
        assert "a.py" in reduced["files"]
        assert "b.py" in reduced["files"]
        assert "c.py" in reduced["files"]

    def test_majority_vote_strategy(self):
        """MajorityVote picks most common answer."""
        strategy = MajorityVoteStrategy(vote_key="decision")
        results = [
            {"decision": "approve"},
            {"decision": "approve"},
            {"decision": "reject"},
            {"decision": "approve"}
        ]
        reduced = strategy.reduce(results)
        assert reduced["decision"] == "approve"

    def test_reduce_results_factory(self):
        """reduce_results picks correct strategy by name."""
        results = [{"score": 0.8, "id": 1}, {"score": 0.9, "id": 2}]

        # Best score
        reduced = reduce_results(results, strategy="best_score", score_key="score")
        assert reduced["id"] == 2

        # First result
        reduced = reduce_results(results, strategy="first")
        assert reduced["id"] == 1

    def test_empty_results_returns_none(self):
        """Reducing empty results returns None."""
        strategy = FirstResultStrategy()
        assert strategy.reduce([]) is None
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_reduction.py -v`
Expected: FAIL with "No module named 'systems.swarm.reduction'"

**Step 3: Implement Reduction Strategies**

Create `systems/swarm/reduction.py`:

```python
"""
Reduction strategies for merging results from parallel agents.

Different strategies for combining results based on task type.
"""

from abc import ABC, abstractmethod
from typing import List, Dict, Any, Optional
from collections import Counter


class ReductionStrategy(ABC):
    """Base class for reduction strategies."""

    @abstractmethod
    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        """
        Reduce multiple results into a single result.

        Args:
            results: List of result dictionaries from agents

        Returns:
            Reduced/merged result, or None if no results
        """
        pass


class FirstResultStrategy(ReductionStrategy):
    """Returns the first completed result."""

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None
        return results[0]


class BestScoreStrategy(ReductionStrategy):
    """Picks result with highest score on a given key."""

    def __init__(self, score_key: str = "score"):
        self.score_key = score_key

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None
        return max(results, key=lambda r: r.get(self.score_key, 0))


class MergeAllStrategy(ReductionStrategy):
    """Merges all results by combining lists."""

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None

        merged = {}
        for result in results:
            for key, value in result.items():
                if key not in merged:
                    merged[key] = []
                if isinstance(value, list):
                    merged[key].extend(value)
                else:
                    merged[key].append(value)
        return merged


class MajorityVoteStrategy(ReductionStrategy):
    """Picks the most common value for a vote key."""

    def __init__(self, vote_key: str = "decision"):
        self.vote_key = vote_key

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None

        votes = [r.get(self.vote_key) for r in results if self.vote_key in r]
        if not votes:
            return results[0]

        counter = Counter(votes)
        winner = counter.most_common(1)[0][0]

        # Return first result that has the winning vote
        for result in results:
            if result.get(self.vote_key) == winner:
                return result
        return results[0]


# Strategy registry
STRATEGIES = {
    "first": FirstResultStrategy,
    "best_score": BestScoreStrategy,
    "merge_all": MergeAllStrategy,
    "majority_vote": MajorityVoteStrategy,
}


def reduce_results(
    results: List[Dict[str, Any]],
    strategy: str = "first",
    **strategy_kwargs
) -> Optional[Dict[str, Any]]:
    """
    Reduce results using a named strategy.

    Args:
        results: List of result dictionaries
        strategy: Strategy name ("first", "best_score", "merge_all", "majority_vote")
        **strategy_kwargs: Additional arguments for the strategy

    Returns:
        Reduced result
    """
    strategy_class = STRATEGIES.get(strategy, FirstResultStrategy)
    instance = strategy_class(**strategy_kwargs)
    return instance.reduce(results)
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_reduction.py -v`
Expected: 6 tests PASS

**Step 5: Commit**

```bash
git add systems/swarm/reduction.py tests/swarm/test_reduction.py
git commit -m "feat(swarm): add reduction strategies for result merging"
```

---

## Task 4: SwarmAgent Implementation

**Files:**
- Create: `systems/swarm/swarm_agent.py`
- Test: `tests/swarm/test_swarm_agent.py`

**Step 1: Write the failing test**

Create `tests/swarm/test_swarm_agent.py`:

```python
"""
Tests for SwarmAgent - agent that executes tasks from the board.
"""

import pytest
import tempfile
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


class TestSwarmAgent:
    """Test swarm agent behavior."""

    def test_create_agent(self, tmp_path):
        """Agent can be created with ID and task board."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        agent = SwarmAgent(agent_id="test-agent", task_board=board)
        assert agent.agent_id == "test-agent"

    def test_claim_next_task(self, tmp_path):
        """Agent can claim the next pending task."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="claim-test",
            task_type=TaskType.CODE_ANALYSIS,
            description="Test task"
        ))

        agent = SwarmAgent(agent_id="claimer", task_board=board)
        task = agent.claim_next_task()
        assert task is not None
        assert task.task_id == "claim-test"
        assert task.claimed_by == "claimer"

    def test_claim_respects_capabilities(self, tmp_path):
        """Agent only claims tasks matching its capabilities."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="search-task",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search task"
        ))

        # Agent without search capability
        agent = SwarmAgent(
            agent_id="no-search",
            task_board=board,
            capabilities=["CODE_ANALYSIS"]
        )
        task = agent.claim_next_task()
        assert task is None  # Cannot claim

        # Agent with search capability
        agent2 = SwarmAgent(
            agent_id="has-search",
            task_board=board,
            capabilities=["PARALLEL_SEARCH"]
        )
        task = agent2.claim_next_task()
        assert task is not None

    def test_complete_claimed_task(self, tmp_path):
        """Agent can complete a claimed task."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="complete-test",
            task_type=TaskType.CODE_ANALYSIS,
            description="Complete me"
        ))

        agent = SwarmAgent(agent_id="completer", task_board=board)
        task = agent.claim_next_task()
        agent.complete_task(task, {"lines_analyzed": 100})

        completed = board.get("complete-test")
        assert completed.status == TaskStatus.COMPLETED
        assert completed.result["lines_analyzed"] == 100

    def test_fail_task(self, tmp_path):
        """Agent can fail a task with error."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="fail-test",
            task_type=TaskType.CODE_ANALYSIS,
            description="Will fail"
        ))

        agent = SwarmAgent(agent_id="failer", task_board=board)
        task = agent.claim_next_task()
        agent.fail_task(task, "Something went wrong")

        failed = board.get("fail-test")
        assert failed.status == TaskStatus.FAILED
        assert "Something went wrong" in failed.result["error"]

    def test_no_pending_tasks_returns_none(self, tmp_path):
        """claim_next_task returns None when no tasks available."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        agent = SwarmAgent(agent_id="idle", task_board=board)
        task = agent.claim_next_task()
        assert task is None
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_swarm_agent.py -v`
Expected: FAIL with "No module named 'systems.swarm.swarm_agent'"

**Step 3: Implement SwarmAgent**

Create `systems/swarm/swarm_agent.py`:

```python
"""
SwarmAgent - An agent that executes tasks from a shared task board.

Agents claim tasks, execute work, and post results.
"""

import logging
from typing import Optional, List, Dict, Any, Callable

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard


logger = logging.getLogger("SwarmAgent")


class SwarmAgent:
    """
    An agent in the swarm that executes tasks.

    Agents have:
    - An ID for identification
    - A task board to pull work from
    - Capabilities that determine what tasks they can handle
    - Optional handlers for specific task types
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        capabilities: Optional[List[str]] = None,
        handlers: Optional[Dict[TaskType, Callable]] = None
    ):
        """
        Initialize swarm agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            capabilities: List of task types this agent can handle
            handlers: Optional mapping of task types to handler functions
        """
        self.agent_id = agent_id
        self.task_board = task_board
        self.capabilities = capabilities or self._default_capabilities()
        self.handlers = handlers or {}
        self.current_task: Optional[Task] = None

    def _default_capabilities(self) -> List[str]:
        """Default capabilities - all task types."""
        return [t.value for t in TaskType]

    def can_handle(self, task_type: TaskType) -> bool:
        """Check if agent can handle a task type."""
        return task_type.value in self.capabilities

    def claim_next_task(self) -> Optional[Task]:
        """
        Claim the next available pending task.

        Returns:
            Claimed task, or None if no suitable tasks available
        """
        pending = self.task_board.get_pending()

        for task in pending:
            if not self.can_handle(task.task_type):
                continue

            if self.task_board.claim(task.task_id, self.agent_id):
                self.current_task = self.task_board.get(task.task_id)
                logger.info(f"Agent {self.agent_id} claimed task {task.task_id}")
                return self.current_task

        return None

    def execute_task(self, task: Task) -> Dict[str, Any]:
        """
        Execute a task using registered handler or default.

        Args:
            task: Task to execute

        Returns:
            Result dictionary
        """
        self.task_board.start(task.task_id)

        handler = self.handlers.get(task.task_type)
        if handler:
            result = handler(task)
        else:
            result = self._default_handler(task)

        return result

    def _default_handler(self, task: Task) -> Dict[str, Any]:
        """Default task handler - just marks as processed."""
        return {
            "processed_by": self.agent_id,
            "task_type": task.task_type.value,
            "description": task.description
        }

    def complete_task(self, task: Task, result: Dict[str, Any]) -> bool:
        """
        Mark a task as completed with result.

        Args:
            task: Task to complete
            result: Result data

        Returns:
            True if successful
        """
        success = self.task_board.complete(task.task_id, result)
        if success:
            logger.info(f"Agent {self.agent_id} completed task {task.task_id}")
            if self.current_task and self.current_task.task_id == task.task_id:
                self.current_task = None
        return success

    def fail_task(self, task: Task, error: str) -> bool:
        """
        Mark a task as failed.

        Args:
            task: Task that failed
            error: Error message

        Returns:
            True if successful
        """
        success = self.task_board.fail(task.task_id, error)
        if success:
            logger.warning(f"Agent {self.agent_id} failed task {task.task_id}: {error}")
            if self.current_task and self.current_task.task_id == task.task_id:
                self.current_task = None
        return success

    def work_cycle(self) -> Optional[Task]:
        """
        Perform one work cycle: claim, execute, complete.

        Returns:
            Completed task, or None if no work available
        """
        task = self.claim_next_task()
        if task is None:
            return None

        try:
            result = self.execute_task(task)
            self.complete_task(task, result)
            return task
        except Exception as e:
            self.fail_task(task, str(e))
            raise
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_swarm_agent.py -v`
Expected: 6 tests PASS

**Step 5: Commit**

```bash
git add systems/swarm/swarm_agent.py tests/swarm/test_swarm_agent.py
git commit -m "feat(swarm): add SwarmAgent for task execution"
```

---

## Task 5: SwarmCoordinator - MapReduce Orchestration

**Files:**
- Create: `systems/swarm/swarm_coordinator.py`
- Test: `tests/swarm/test_swarm_coordinator.py`

**Step 1: Write the failing test**

Create `tests/swarm/test_swarm_coordinator.py`:

```python
"""
Tests for SwarmCoordinator - MapReduce-style orchestration.
"""

import pytest
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_coordinator import SwarmCoordinator


class TestSwarmCoordinator:
    """Test MapReduce orchestration."""

    def test_create_coordinator(self, tmp_path):
        """Coordinator can be created with task board."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)
        assert coord.task_board == board

    def test_map_creates_subtasks(self, tmp_path):
        """map() creates subtasks from a parent task."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        parent_id = coord.map(
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze all modules",
            subtask_payloads=[
                {"module": "auth"},
                {"module": "api"},
                {"module": "db"}
            ]
        )

        # Should have 3 subtasks
        all_tasks = board.list_all()
        subtasks = [t for t in all_tasks if t.payload.get("parent_id") == parent_id]
        assert len(subtasks) == 3

    def test_reduce_aggregates_results(self, tmp_path):
        """reduce() aggregates results from completed subtasks."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create and complete subtasks
        parent_id = "parent-reduce-test"
        for i in range(3):
            task = Task(
                task_id=f"reduce-sub-{i}",
                task_type=TaskType.PARALLEL_SEARCH,
                description=f"Search {i}",
                payload={"parent_id": parent_id}
            )
            board.post(task)
            board.claim(f"reduce-sub-{i}", f"agent-{i}")
            board.complete(f"reduce-sub-{i}", {"found": i * 10})

        # Reduce
        result = coord.reduce(parent_id, strategy="merge_all")
        assert result is not None
        assert 0 in result["found"]
        assert 10 in result["found"]
        assert 20 in result["found"]

    def test_mapreduce_full_workflow(self, tmp_path):
        """Full MapReduce workflow: map -> work -> reduce."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Map: create subtasks
        parent_id = coord.map(
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Explore sorting algorithms",
            subtask_payloads=[
                {"approach": "quicksort"},
                {"approach": "mergesort"},
                {"approach": "heapsort"}
            ]
        )

        # Simulate agents completing work
        subtasks = [t for t in board.list_all() if t.payload.get("parent_id") == parent_id]
        for i, task in enumerate(subtasks):
            board.claim(task.task_id, f"agent-{i}")
            board.complete(task.task_id, {
                "approach": task.payload["approach"],
                "score": (3 - i) * 10  # Different scores
            })

        # Reduce: pick best solution
        result = coord.reduce(parent_id, strategy="best_score", score_key="score")
        assert result["approach"] == "quicksort"  # Highest score
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_swarm_coordinator.py -v`
Expected: FAIL with "No module named 'systems.swarm.swarm_coordinator'"

**Step 3: Implement SwarmCoordinator**

Create `systems/swarm/swarm_coordinator.py`:

```python
"""
SwarmCoordinator - MapReduce-style orchestration for swarm intelligence.

Coordinates task distribution (map) and result aggregation (reduce).
"""

import uuid
import logging
from typing import List, Dict, Any, Optional

from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.reduction import reduce_results


logger = logging.getLogger("SwarmCoordinator")


class SwarmCoordinator:
    """
    Coordinates MapReduce-style swarm operations.

    Map: Split work into subtasks
    Reduce: Aggregate results from completed subtasks
    """

    def __init__(self, task_board: TaskBoard):
        """
        Initialize coordinator.

        Args:
            task_board: Shared task board for the swarm
        """
        self.task_board = task_board

    def map(
        self,
        task_type: TaskType,
        description: str,
        subtask_payloads: List[Dict[str, Any]],
        priority: int = 5
    ) -> str:
        """
        Create subtasks from a parent task (Map phase).

        Args:
            task_type: Type of tasks to create
            description: Description for all subtasks
            subtask_payloads: List of payloads, one per subtask
            priority: Task priority (1=highest)

        Returns:
            Parent task ID for reduce phase
        """
        parent_id = f"parent-{uuid.uuid4().hex[:8]}"

        for i, payload in enumerate(subtask_payloads):
            payload["parent_id"] = parent_id
            task = Task(
                task_id=f"{parent_id}-sub-{i}",
                task_type=task_type,
                description=f"{description} (part {i+1}/{len(subtask_payloads)})",
                priority=priority,
                payload=payload
            )
            self.task_board.post(task)
            logger.info(f"Posted subtask {task.task_id} for parent {parent_id}")

        logger.info(f"Map complete: {len(subtask_payloads)} subtasks for {parent_id}")
        return parent_id

    def reduce(
        self,
        parent_id: str,
        strategy: str = "merge_all",
        **strategy_kwargs
    ) -> Optional[Dict[str, Any]]:
        """
        Aggregate results from completed subtasks (Reduce phase).

        Args:
            parent_id: Parent task ID from map phase
            strategy: Reduction strategy name
            **strategy_kwargs: Additional args for strategy

        Returns:
            Reduced result, or None if no results
        """
        results = self.task_board.get_results_by_parent(parent_id)

        if not results:
            logger.warning(f"No results found for parent {parent_id}")
            return None

        reduced = reduce_results(results, strategy=strategy, **strategy_kwargs)
        logger.info(f"Reduce complete: {len(results)} results for {parent_id}")
        return reduced

    def mapreduce(
        self,
        task_type: TaskType,
        description: str,
        subtask_payloads: List[Dict[str, Any]],
        reduce_strategy: str = "merge_all",
        **reduce_kwargs
    ) -> str:
        """
        Start a MapReduce job.

        Returns immediately with parent_id.
        Call reduce() later when subtasks complete.

        Args:
            task_type: Type of tasks
            description: Task description
            subtask_payloads: Payloads for each subtask
            reduce_strategy: Strategy for reduce phase
            **reduce_kwargs: Args for reduce strategy

        Returns:
            Parent task ID
        """
        return self.map(task_type, description, subtask_payloads)

    def get_progress(self, parent_id: str) -> Dict[str, Any]:
        """
        Get progress for a MapReduce job.

        Args:
            parent_id: Parent task ID

        Returns:
            Progress dict with counts and status
        """
        all_tasks = self.task_board.list_all()
        subtasks = [t for t in all_tasks if t.payload.get("parent_id") == parent_id]

        total = len(subtasks)
        completed = sum(1 for t in subtasks if t.status == TaskStatus.COMPLETED)
        failed = sum(1 for t in subtasks if t.status == TaskStatus.FAILED)
        pending = sum(1 for t in subtasks if t.status == TaskStatus.PENDING)
        in_progress = sum(1 for t in subtasks if t.status in (TaskStatus.CLAIMED, TaskStatus.IN_PROGRESS))

        return {
            "parent_id": parent_id,
            "total": total,
            "completed": completed,
            "failed": failed,
            "pending": pending,
            "in_progress": in_progress,
            "progress_pct": (completed / total * 100) if total > 0 else 0,
            "is_complete": completed == total
        }
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_swarm_coordinator.py -v`
Expected: 4 tests PASS

**Step 5: Commit**

```bash
git add systems/swarm/swarm_coordinator.py tests/swarm/test_swarm_coordinator.py
git commit -m "feat(swarm): add SwarmCoordinator for MapReduce orchestration"
```

---

## Task 6: Integration Tests

**Files:**
- Create: `tests/swarm/test_swarm_integration.py`

**Step 1: Write the integration test**

Create `tests/swarm/test_swarm_integration.py`:

```python
"""
Integration tests for swarm intelligence system.

Tests the full flow: map -> agents work -> reduce
"""

import pytest
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.swarm_coordinator import SwarmCoordinator


class TestSwarmIntegration:
    """End-to-end swarm intelligence tests."""

    def test_parallel_code_analysis(self, tmp_path):
        """Multiple agents analyze different modules in parallel."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create agents with different capabilities
        agents = [
            SwarmAgent(agent_id=f"agent-{i}", task_board=board)
            for i in range(3)
        ]

        # Map: split analysis into modules
        parent_id = coord.map(
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze codebase modules",
            subtask_payloads=[
                {"module": "auth", "path": "src/auth/"},
                {"module": "api", "path": "src/api/"},
                {"module": "db", "path": "src/db/"}
            ]
        )

        # Agents claim and complete tasks
        for agent in agents:
            task = agent.claim_next_task()
            if task:
                result = {
                    "module": task.payload["module"],
                    "lines": 100,
                    "issues": [],
                    "score": 0.9
                }
                agent.complete_task(task, result)

        # Reduce: merge all results
        final = coord.reduce(parent_id, strategy="merge_all")
        assert final is not None
        assert "auth" in final["module"]
        assert "api" in final["module"]
        assert "db" in final["module"]

    def test_competitive_solution_exploration(self, tmp_path):
        """Agents compete to find best solution, best wins."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        agents = [
            SwarmAgent(agent_id=f"solver-{i}", task_board=board)
            for i in range(3)
        ]

        # Map: try different approaches
        parent_id = coord.map(
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Find optimal sorting",
            subtask_payloads=[
                {"approach": "quicksort"},
                {"approach": "mergesort"},
                {"approach": "heapsort"}
            ]
        )

        # Agents work with different scores
        scores = [0.7, 0.95, 0.6]
        for i, agent in enumerate(agents):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {
                    "approach": task.payload["approach"],
                    "score": scores[i]
                })

        # Reduce: pick best score
        best = coord.reduce(parent_id, strategy="best_score", score_key="score")
        assert best["approach"] == "mergesort"
        assert best["score"] == 0.95

    def test_distributed_review_voting(self, tmp_path):
        """Multiple reviewers vote on a decision."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create 5 reviewers
        agents = [
            SwarmAgent(agent_id=f"reviewer-{i}", task_board=board)
            for i in range(5)
        ]

        # Map: review the same PR
        parent_id = coord.map(
            task_type=TaskType.DISTRIBUTED_REVIEW,
            description="Review PR #123",
            subtask_payloads=[{"pr": 123} for _ in range(5)]
        )

        # Reviewers vote (3 approve, 2 reject)
        votes = ["approve", "approve", "reject", "approve", "reject"]
        for i, agent in enumerate(agents):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {
                    "pr": 123,
                    "decision": votes[i]
                })

        # Reduce: majority vote
        result = coord.reduce(parent_id, strategy="majority_vote", vote_key="decision")
        assert result["decision"] == "approve"

    def test_work_distribution_is_balanced(self, tmp_path):
        """Work is distributed across available agents."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # 2 agents, 6 tasks
        agents = [
            SwarmAgent(agent_id=f"worker-{i}", task_board=board)
            for i in range(2)
        ]

        parent_id = coord.map(
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search for patterns",
            subtask_payloads=[{"pattern": f"TODO-{i}"} for i in range(6)]
        )

        # Each agent claims up to 3 tasks
        completed_by = []
        for agent in agents:
            for _ in range(3):  # Each agent can do 3 tasks
                task = agent.claim_next_task()
                if task:
                    agent.complete_task(task, {"found": True})
                    completed_by.append(agent.agent_id)

        # Verify distribution
        assert len(completed_by) == 6
        worker0_count = completed_by.count("worker-0")
        worker1_count = completed_by.count("worker-1")
        assert abs(worker0_count - worker1_count) <= 1  # Balanced

    def test_progress_tracking(self, tmp_path):
        """Can track progress of MapReduce job."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        parent_id = coord.map(
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze",
            subtask_payloads=[{"i": i} for i in range(4)]
        )

        # Initial progress
        progress = coord.get_progress(parent_id)
        assert progress["total"] == 4
        assert progress["completed"] == 0
        assert progress["pending"] == 4

        # Complete some tasks
        agent = SwarmAgent(agent_id="worker", task_board=board)
        for _ in range(2):
            task = agent.claim_next_task()
            if task:
                agent.complete_task(task, {"done": True})

        # Check progress
        progress = coord.get_progress(parent_id)
        assert progress["completed"] == 2
        assert progress["progress_pct"] == 50.0
```

**Step 2: Run test to verify it passes**

Run: `pytest tests/swarm/test_swarm_integration.py -v`
Expected: 5 tests PASS

**Step 3: Commit**

```bash
git add tests/swarm/test_swarm_integration.py
git commit -m "test(swarm): add integration tests for MapReduce swarm intelligence"
```

---

## Task 7: Documentation

**Files:**
- Create: `systems/swarm/README.md`

**Step 1: Create README**

Create `systems/swarm/README.md`:

```markdown
# Swarm Intelligence System

Decentralized MapReduce-style swarm coordination for parallel agent work.

## Components

| Component | Purpose |
|-----------|---------|
| Task | Unit of work with lifecycle states |
| TaskBoard | Shared task storage with atomic claiming |
| SwarmAgent | Worker that executes tasks |
| SwarmCoordinator | MapReduce orchestration |
| ReductionStrategy | Result merging strategies |

## Quick Start

```python
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.swarm_coordinator import SwarmCoordinator
from systems.swarm.task import TaskType

# Create shared task board
board = TaskBoard(storage_path=".swarm/tasks")

# Create coordinator for MapReduce
coord = SwarmCoordinator(task_board=board)

# Map: split work into subtasks
parent_id = coord.map(
    task_type=TaskType.CODE_ANALYSIS,
    description="Analyze modules",
    subtask_payloads=[
        {"module": "auth"},
        {"module": "api"},
        {"module": "db"}
    ]
)

# Create agents to do work
agents = [SwarmAgent(agent_id=f"agent-{i}", task_board=board) for i in range(3)]

# Agents claim and complete tasks
for agent in agents:
    task = agent.claim_next_task()
    if task:
        result = agent.execute_task(task)
        agent.complete_task(task, result)

# Reduce: aggregate results
final = coord.reduce(parent_id, strategy="merge_all")
```

## Task Types

| Type | Use Case |
|------|----------|
| CODE_ANALYSIS | Analyze code quality, patterns |
| PARALLEL_SEARCH | Search codebase with different patterns |
| SOLUTION_EXPLORATION | Try multiple approaches, pick best |
| DISTRIBUTED_REVIEW | Multiple reviewers on same artifact |

## Reduction Strategies

| Strategy | When to Use |
|----------|-------------|
| first | Any result is fine |
| best_score | Pick highest-scoring result |
| merge_all | Combine all results (dedupe lists) |
| majority_vote | Democratic decision making |

## Running Tests

```bash
# All swarm tests
pytest tests/swarm/ -v

# Specific component
pytest tests/swarm/test_task_board.py -v

# Integration tests
pytest tests/swarm/test_swarm_integration.py -v
```
```

**Step 2: Commit**

```bash
git add systems/swarm/README.md
git commit -m "docs(swarm): add README for swarm intelligence system"
```

---

## Summary

| Task | Description | Tests |
|------|-------------|-------|
| 1 | Task data structure | 4 |
| 2 | TaskBoard implementation | 7 |
| 3 | Reduction strategies | 6 |
| 4 | SwarmAgent | 6 |
| 5 | SwarmCoordinator | 4 |
| 6 | Integration tests | 5 |
| 7 | Documentation | - |
| **Total** | | **32** |

## Verification

```bash
# Run all swarm tests
pytest tests/swarm/ -v

# Expected: 32 tests passing
```
