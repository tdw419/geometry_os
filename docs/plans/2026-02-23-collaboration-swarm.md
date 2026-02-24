# Collaboration Swarm Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable multi-agent collaboration through a Workflow Orchestrator that bridges TaskBoard (state) with NEBBus (events).

**Architecture:** Three core components — Workflow (immutable definition), WorkflowInstance (mutable state), WorkflowRunner (state machine). Orchestrator creates instances and emits events to NEBBus. Agents subscribe to workflow events and execute steps.

**Tech Stack:** Python 3.12, dataclasses, asyncio, pytest, existing NEBBus infrastructure

---

## Phase 1: Core Data Structures

### Task 1: Workflow Dataclasses

**Files:**
- Create: `systems/swarm/workflow/__init__.py`
- Create: `systems/swarm/workflow/workflow.py`
- Create: `systems/swarm/workflow/test_workflow.py`

**Step 1: Create module structure**

```bash
mkdir -p systems/swarm/workflow
touch systems/swarm/workflow/__init__.py
```

**Step 2: Write failing tests**

Create `systems/swarm/workflow/test_workflow.py`:

```python
"""Unit tests for Workflow dataclasses."""

import pytest
from systems.swarm.workflow.workflow import Workflow, WorkflowStep


class TestWorkflowStep:
    """Tests for WorkflowStep dataclass."""

    def test_create_step_with_required_fields(self):
        """Step can be created with name and agent_type."""
        step = WorkflowStep(name="design", agent_type="architect")
        assert step.name == "design"
        assert step.agent_type == "architect"

    def test_step_has_optional_schemas(self):
        """Step can have input and output schemas."""
        step = WorkflowStep(
            name="implement",
            agent_type="engineer",
            input_schema={"design": "dict"},
            output_schema={"code": "str"}
        )
        assert step.input_schema == {"design": "dict"}
        assert step.output_schema == {"code": "str"}


class TestWorkflow:
    """Tests for Workflow dataclass."""

    def test_create_workflow_with_steps(self):
        """Workflow can be created with name and steps."""
        steps = [
            WorkflowStep(name="design", agent_type="architect"),
            WorkflowStep(name="implement", agent_type="engineer"),
        ]
        workflow = Workflow(name="golden-path", steps=steps)
        assert workflow.name == "golden-path"
        assert len(workflow.steps) == 2

    def test_workflow_has_transitions(self):
        """Workflow can define conditional transitions."""
        workflow = Workflow(
            name="golden-path",
            steps=[WorkflowStep(name="review", agent_type="reviewer")],
            transitions={"review.approved": "complete", "review.rejected": "fix"}
        )
        assert workflow.transitions["review.approved"] == "complete"

    def test_get_step_by_name(self):
        """Workflow can retrieve step by name."""
        steps = [
            WorkflowStep(name="design", agent_type="architect"),
            WorkflowStep(name="implement", agent_type="engineer"),
        ]
        workflow = Workflow(name="test", steps=steps)
        step = workflow.get_step("implement")
        assert step.agent_type == "engineer"

    def test_get_next_step(self):
        """Workflow can get next step in sequence."""
        steps = [
            WorkflowStep(name="design", agent_type="architect"),
            WorkflowStep(name="implement", agent_type="engineer"),
        ]
        workflow = Workflow(name="test", steps=steps)
        next_step = workflow.get_next_step("design")
        assert next_step.name == "implement"
```

**Step 3: Run tests to verify they fail**

Run: `pytest systems/swarm/workflow/test_workflow.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 4: Implement Workflow dataclasses**

Create `systems/swarm/workflow/workflow.py`:

```python
"""
Workflow - Immutable pipeline definition for multi-agent collaboration.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any


@dataclass
class WorkflowStep:
    """
    A single step in a workflow pipeline.

    Attributes:
        name: Unique step identifier (e.g., "design", "implement")
        agent_type: Type of agent to execute this step
        input_schema: Expected input fields (optional)
        output_schema: Promised output fields (optional)
    """
    name: str
    agent_type: str
    input_schema: Dict[str, str] = field(default_factory=dict)
    output_schema: Dict[str, str] = field(default_factory=dict)


@dataclass
class Workflow:
    """
    Immutable workflow definition.

    A workflow is a directed acyclic graph of steps with conditional transitions.
    """
    name: str
    steps: List[WorkflowStep]
    transitions: Dict[str, str] = field(default_factory=dict)

    def get_step(self, name: str) -> Optional[WorkflowStep]:
        """Get a step by name."""
        for step in self.steps:
            if step.name == name:
                return step
        return None

    def get_next_step(self, current_name: str) -> Optional[WorkflowStep]:
        """Get the next step after the named step."""
        for i, step in enumerate(self.steps):
            if step.name == current_name and i + 1 < len(self.steps):
                return self.steps[i + 1]
        return None

    def get_step_by_index(self, index: int) -> Optional[WorkflowStep]:
        """Get step by index."""
        if 0 <= index < len(self.steps):
            return self.steps[index]
        return None
```

**Step 5: Update __init__.py**

```python
"""
Workflow module for multi-agent collaboration.

Provides Workflow, WorkflowStep, WorkflowInstance, WorkflowRunner, and WorkflowOrchestrator.
"""

from systems.swarm.workflow.workflow import Workflow, WorkflowStep

__all__ = [
    "Workflow",
    "WorkflowStep",
]
```

**Step 6: Run tests to verify they pass**

Run: `pytest systems/swarm/workflow/test_workflow.py -v`
Expected: 7 PASS

**Step 7: Commit**

```bash
git add systems/swarm/workflow/
git commit -m "feat(workflow): add Workflow and WorkflowStep dataclasses"
```

---

### Task 2: WorkflowInstance State

**Files:**
- Create: `systems/swarm/workflow/workflow_instance.py`
- Modify: `systems/swarm/workflow/test_workflow.py` (add tests)
- Modify: `systems/swarm/workflow/__init__.py`

**Step 1: Write failing tests**

Add to `systems/swarm/workflow/test_workflow.py`:

```python
from systems.swarm.workflow.workflow_instance import WorkflowInstance, WorkflowStatus
import uuid


class TestWorkflowInstance:
    """Tests for WorkflowInstance state."""

    def test_create_instance(self):
        """Instance can be created with workflow reference."""
        instance = WorkflowInstance(workflow_name="golden-path")
        assert instance.workflow_name == "golden-path"
        assert instance.status == WorkflowStatus.CREATED

    def test_instance_has_unique_id(self):
        """Each instance gets a unique ID."""
        instance1 = WorkflowInstance(workflow_name="test")
        instance2 = WorkflowInstance(workflow_name="test")
        assert instance1.instance_id != instance2.instance_id

    def test_instance_starts_at_step_zero(self):
        """Instance starts at step 0."""
        instance = WorkflowInstance(workflow_name="test")
        assert instance.current_step == 0

    def test_instance_context_accumulates(self):
        """Instance context can store step outputs."""
        instance = WorkflowInstance(workflow_name="test")
        instance.context["design"] = {"components": ["Auth"]}
        instance.context["code"] = "def Auth(): pass"
        assert "design" in instance.context
        assert "code" in instance.context

    def test_instance_status_transitions(self):
        """Instance status can transition."""
        instance = WorkflowInstance(workflow_name="test")
        instance.status = WorkflowStatus.RUNNING
        assert instance.status == WorkflowStatus.RUNNING

    def test_retry_count_tracking(self):
        """Instance tracks retry count per step."""
        instance = WorkflowInstance(workflow_name="test")
        instance.retry_count = 2
        assert instance.retry_count == 2
```

**Step 2: Run tests to verify they fail**

Run: `pytest systems/swarm/workflow/test_workflow.py::TestWorkflowInstance -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Implement WorkflowInstance**

Create `systems/swarm/workflow/workflow_instance.py`:

```python
"""
WorkflowInstance - Mutable state for a workflow execution.
"""

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Dict, Any
import uuid


class WorkflowStatus(Enum):
    """Status of a workflow instance."""
    CREATED = "created"
    RUNNING = "running"
    BLOCKED = "blocked"
    COMPLETE = "complete"
    FAILED = "failed"


@dataclass
class WorkflowInstance:
    """
    Mutable state for a workflow execution.

    Tracks current step, accumulated context, and execution status.
    """
    workflow_name: str
    instance_id: str = field(default_factory=lambda: f"inst-{uuid.uuid4().hex[:8]}")
    current_step: int = 0
    context: Dict[str, Any] = field(default_factory=dict)
    status: WorkflowStatus = WorkflowStatus.CREATED
    retry_count: int = 0
    created_at: datetime = field(default_factory=datetime.utcnow)
    last_activity: datetime = field(default_factory=datetime.utcnow)

    def touch(self):
        """Update last_activity timestamp."""
        self.last_activity = datetime.utcnow()

    def advance_step(self):
        """Move to next step."""
        self.current_step += 1
        self.touch()

    def is_complete(self, workflow: "Workflow") -> bool:
        """Check if all steps are complete."""
        return self.current_step >= len(workflow.steps)
```

**Step 4: Update __init__.py**

```python
from systems.swarm.workflow.workflow import Workflow, WorkflowStep
from systems.swarm.workflow.workflow_instance import WorkflowInstance, WorkflowStatus

__all__ = [
    "Workflow",
    "WorkflowStep",
    "WorkflowInstance",
    "WorkflowStatus",
]
```

**Step 5: Run tests to verify they pass**

Run: `pytest systems/swarm/workflow/test_workflow.py::TestWorkflowInstance -v`
Expected: 6 PASS

**Step 6: Commit**

```bash
git add systems/swarm/workflow/
git commit -m "feat(workflow): add WorkflowInstance state management"
```

---

### Task 3: WorkflowRunner State Machine

**Files:**
- Create: `systems/swarm/workflow/workflow_runner.py`
- Create: `systems/swarm/workflow/test_runner.py`

**Step 1: Write failing tests**

Create `systems/swarm/workflow/test_runner.py`:

```python
"""Unit tests for WorkflowRunner."""

import pytest
from systems.swarm.workflow.workflow import Workflow, WorkflowStep
from systems.swarm.workflow.workflow_instance import WorkflowInstance, WorkflowStatus
from systems.swarm.workflow.workflow_runner import WorkflowRunner


class TestWorkflowRunner:
    """Tests for WorkflowRunner state machine."""

    @pytest.fixture
    def simple_workflow(self):
        """Create a simple 2-step workflow."""
        return Workflow(
            name="simple",
            steps=[
                WorkflowStep(name="step1", agent_type="agent_a"),
                WorkflowStep(name="step2", agent_type="agent_b"),
            ]
        )

    def test_create_runner(self, simple_workflow):
        """Runner can be created with a workflow."""
        runner = WorkflowRunner(workflow=simple_workflow)
        assert runner.workflow == simple_workflow

    def test_start_instance(self, simple_workflow):
        """Runner can start a workflow instance."""
        runner = WorkflowRunner(workflow=simple_workflow)
        instance = WorkflowInstance(workflow_name="simple")
        runner.start(instance)
        assert instance.status == WorkflowStatus.RUNNING

    def test_advance_on_step_complete(self, simple_workflow):
        """Runner advances to next step on completion."""
        runner = WorkflowRunner(workflow=simple_workflow)
        instance = WorkflowInstance(workflow_name="simple", current_step=0)
        instance.status = WorkflowStatus.RUNNING

        runner.advance(instance)

        assert instance.current_step == 1

    def test_complete_workflow(self, simple_workflow):
        """Runner marks complete when all steps done."""
        runner = WorkflowRunner(workflow=simple_workflow)
        instance = WorkflowInstance(workflow_name="simple", current_step=2)
        instance.status = WorkflowStatus.RUNNING

        result = runner.check_complete(instance)

        assert result is True

    def test_handle_transition(self, simple_workflow):
        """Runner handles conditional transitions."""
        workflow = Workflow(
            name="with-review",
            steps=[
                WorkflowStep(name="review", agent_type="reviewer"),
            ],
            transitions={"review.approved": "complete", "review.rejected": "fix"}
        )
        runner = WorkflowRunner(workflow=workflow)
        instance = WorkflowInstance(workflow_name="with-review")

        action = runner.get_transition(instance, "review.approved")
        assert action == "complete"
```

**Step 2: Run tests to verify they fail**

Run: `pytest systems/swarm/workflow/test_runner.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Implement WorkflowRunner**

Create `systems/swarm/workflow/workflow_runner.py`:

```python
"""
WorkflowRunner - State machine for workflow execution.
"""

from dataclasses import dataclass
from typing import Optional
import logging

from systems.swarm.workflow.workflow import Workflow
from systems.swarm.workflow.workflow_instance import WorkflowInstance, WorkflowStatus


logger = logging.getLogger("WorkflowRunner")


@dataclass
class WorkflowRunner:
    """
    Executes workflow instances as a state machine.

    Handles step transitions, completion checks, and conditional routing.
    """
    workflow: Workflow

    def start(self, instance: WorkflowInstance) -> None:
        """Start a workflow instance."""
        instance.status = WorkflowStatus.RUNNING
        instance.current_step = 0
        instance.touch()
        logger.info(f"Started workflow {instance.instance_id}")

    def advance(self, instance: WorkflowInstance) -> None:
        """Advance instance to next step."""
        instance.advance_step()
        logger.info(f"Advanced {instance.instance_id} to step {instance.current_step}")

    def check_complete(self, instance: WorkflowInstance) -> bool:
        """Check if workflow is complete."""
        return instance.current_step >= len(self.workflow.steps)

    def get_transition(self, instance: WorkflowInstance, event: str) -> Optional[str]:
        """Get action for a transition event."""
        return self.workflow.transitions.get(event)

    def apply_transition(self, instance: WorkflowInstance, event: str) -> str:
        """
        Apply a transition event to the instance.

        Returns the action taken: "advance", "complete", "loop", or "none".
        """
        action = self.get_transition(instance, event)
        if action is None:
            # Default: advance to next step
            self.advance(instance)
            return "advance"

        if action == "complete":
            instance.status = WorkflowStatus.COMPLETE
            return "complete"

        if action.startswith("step."):
            # Loop back to a specific step
            step_name = action.split(".", 1)[1]
            for i, step in enumerate(self.workflow.steps):
                if step.name == step_name:
                    instance.current_step = i
                    instance.retry_count += 1
                    return "loop"

        return "none"
```

**Step 4: Update __init__.py**

```python
from systems.swarm.workflow.workflow import Workflow, WorkflowStep
from systems.swarm.workflow.workflow_instance import WorkflowInstance, WorkflowStatus
from systems.swarm.workflow.workflow_runner import WorkflowRunner

__all__ = [
    "Workflow",
    "WorkflowStep",
    "WorkflowInstance",
    "WorkflowStatus",
    "WorkflowRunner",
]
```

**Step 5: Run tests to verify they pass**

Run: `pytest systems/swarm/workflow/test_runner.py -v`
Expected: 5 PASS

**Step 6: Commit**

```bash
git add systems/swarm/workflow/
git commit -m "feat(workflow): add WorkflowRunner state machine"
```

---

## Phase 2: NEBBus Integration

### Task 4: WorkflowOrchestrator

**Files:**
- Create: `systems/swarm/workflow/workflow_orchestrator.py`
- Create: `systems/swarm/workflow/test_orchestrator.py`

**Step 1: Write failing tests**

Create `systems/swarm/workflow/test_orchestrator.py`:

```python
"""Tests for WorkflowOrchestrator."""

import pytest
from unittest.mock import MagicMock
from systems.swarm.workflow.workflow import Workflow, WorkflowStep
from systems.swarm.workflow.workflow_orchestrator import WorkflowOrchestrator


class TestWorkflowOrchestrator:
    """Tests for orchestrator."""

    @pytest.fixture
    def mock_bus(self):
        """Create mock NEBBus."""
        return MagicMock()

    @pytest.fixture
    def workflow(self):
        """Create test workflow."""
        return Workflow(
            name="test-flow",
            steps=[
                WorkflowStep(name="step1", agent_type="agent_a"),
            ]
        )

    def test_create_orchestrator(self, mock_bus):
        """Orchestrator can be created with NEBBus."""
        orch = WorkflowOrchestrator(event_bus=mock_bus)
        assert orch.event_bus == mock_bus

    def test_register_workflow(self, mock_bus, workflow):
        """Orchestrator can register workflows."""
        orch = WorkflowOrchestrator(event_bus=mock_bus)
        orch.register(workflow)
        assert "test-flow" in orch.workflows

    def test_create_instance(self, mock_bus, workflow):
        """Orchestrator can create workflow instance."""
        orch = WorkflowOrchestrator(event_bus=mock_bus)
        orch.register(workflow)

        instance = orch.create_instance("test-flow", {"input": "data"})

        assert instance.workflow_name == "test-flow"
        assert instance.context["input"] == "data"

    def test_emit_event(self, mock_bus, workflow):
        """Orchestrator emits events to NEBBus."""
        mock_bus.publish = MagicMock()
        orch = WorkflowOrchestrator(event_bus=mock_bus)
        orch.register(workflow)

        instance = orch.create_instance("test-flow", {})
        orch.emit(instance, "started", {"step": 0})

        # Should have called publish with topic pattern
        mock_bus.publish.assert_called_once()
        call_args = mock_bus.publish.call_args
        assert "workflow.test-flow" in call_args[0][0]
```

**Step 2: Run tests to verify they fail**

Run: `pytest systems/swarm/workflow/test_orchestrator.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Implement WorkflowOrchestrator**

Create `systems/swarm/workflow/workflow_orchestrator.py`:

```python
"""
WorkflowOrchestrator - Instance management and NEBBus event emission.
"""

from dataclasses import dataclass, field
from datetime import datetime, timedelta
from typing import Dict, List, Optional, Any
import logging

from systems.swarm.neb_bus import NEBBus
from systems.swarm.workflow.workflow import Workflow
from systems.swarm.workflow.workflow_instance import WorkflowInstance, WorkflowStatus
from systems.swarm.workflow.workflow_runner import WorkflowRunner


logger = logging.getLogger("WorkflowOrchestrator")


@dataclass
class WorkflowOrchestrator:
    """
    Manages workflow instances and emits events to NEBBus.

    Responsibilities:
    - Register workflow definitions
    - Create and track instances
    - Emit workflow events
    - Detect stale workflows
    """
    event_bus: NEBBus
    workflows: Dict[str, Workflow] = field(default_factory=dict)
    instances: Dict[str, WorkflowInstance] = field(default_factory=dict)
    runners: Dict[str, WorkflowRunner] = field(default_factory=dict)

    def register(self, workflow: Workflow) -> None:
        """Register a workflow definition."""
        self.workflows[workflow.name] = workflow
        self.runners[workflow.name] = WorkflowRunner(workflow=workflow)
        logger.info(f"Registered workflow: {workflow.name}")

    def create_instance(
        self,
        workflow_name: str,
        initial_context: Optional[Dict[str, Any]] = None
    ) -> WorkflowInstance:
        """Create a new workflow instance."""
        if workflow_name not in self.workflows:
            raise ValueError(f"Unknown workflow: {workflow_name}")

        instance = WorkflowInstance(
            workflow_name=workflow_name,
            context=dict(initial_context or {})
        )
        self.instances[instance.instance_id] = instance
        logger.info(f"Created instance {instance.instance_id} for {workflow_name}")
        return instance

    def start(self, instance: WorkflowInstance) -> None:
        """Start a workflow instance."""
        runner = self.runners[instance.workflow_name]
        runner.start(instance)
        self.emit(instance, "started", {"step": instance.current_step})

    def emit(self, instance: WorkflowInstance, event: str, payload: Dict[str, Any]) -> None:
        """Emit a workflow event to NEBBus."""
        topic = f"workflow.{instance.workflow_name}.{instance.instance_id}.{event}"
        full_payload = {
            "workflow_name": instance.workflow_name,
            "instance_id": instance.instance_id,
            "event": event,
            "timestamp": datetime.utcnow().isoformat(),
            **payload
        }
        self.event_bus.publish(topic, full_payload)
        logger.debug(f"Emitted {topic}")

    def get_instance(self, instance_id: str) -> Optional[WorkflowInstance]:
        """Get an instance by ID."""
        return self.instances.get(instance_id)

    def check_stale(self, timeout_minutes: int = 30) -> List[WorkflowInstance]:
        """Find stale workflow instances."""
        threshold = datetime.utcnow() - timedelta(minutes=timeout_minutes)
        stale = []
        for instance in self.instances.values():
            if instance.status == WorkflowStatus.RUNNING:
                if instance.last_activity < threshold:
                    stale.append(instance)
        return stale
```

**Step 4: Update __init__.py**

```python
from systems.swarm.workflow.workflow import Workflow, WorkflowStep
from systems.swarm.workflow.workflow_instance import WorkflowInstance, WorkflowStatus
from systems.swarm.workflow.workflow_runner import WorkflowRunner
from systems.swarm.workflow.workflow_orchestrator import WorkflowOrchestrator

__all__ = [
    "Workflow",
    "WorkflowStep",
    "WorkflowInstance",
    "WorkflowStatus",
    "WorkflowRunner",
    "WorkflowOrchestrator",
]
```

**Step 5: Run tests to verify they pass**

Run: `pytest systems/swarm/workflow/test_orchestrator.py -v`
Expected: 5 PASS

**Step 6: Commit**

```bash
git add systems/swarm/workflow/
git commit -m "feat(workflow): add WorkflowOrchestrator with NEBBus integration"
```

---

## Phase 3: Golden Path Definition

### Task 5: Define Golden Path Workflow

**Files:**
- Create: `systems/swarm/workflow/presets/golden_path.py`
- Create: `systems/swarm/workflow/presets/__init__.py`

**Step 1: Create presets module**

```bash
mkdir -p systems/swarm/workflow/presets
touch systems/swarm/workflow/presets/__init__.py
```

**Step 2: Implement Golden Path**

Create `systems/swarm/workflow/presets/golden_path.py`:

```python
"""
Golden Path Workflow - Architect → Engineer → Reviewer.
"""

from systems.swarm.workflow.workflow import Workflow, WorkflowStep


def create_golden_path() -> Workflow:
    """
    Create the Golden Path workflow.

    Steps:
    1. Architect designs the component
    2. Engineer implements the code
    3. Reviewer approves or rejects

    Transitions:
    - review.approved -> complete
    - review.rejected -> back to implement (max 3 retries)
    """
    return Workflow(
        name="golden-path",
        steps=[
            WorkflowStep(
                name="design",
                agent_type="architect",
                input_schema={"feature": "str", "requirements": "dict"},
                output_schema={"design": "dict"}
            ),
            WorkflowStep(
                name="implement",
                agent_type="engineer",
                input_schema={"design": "dict"},
                output_schema={"code": "str"}
            ),
            WorkflowStep(
                name="review",
                agent_type="reviewer",
                input_schema={"code": "str", "design": "dict"},
                output_schema={"approved": "bool", "feedback": "str"}
            ),
        ],
        transitions={
            "review.approved": "complete",
            "review.rejected": "step.implement",
        }
    )
```

**Step 3: Update presets __init__.py**

```python
"""
Preset workflow definitions.
"""

from systems.swarm.workflow.presets.golden_path import create_golden_path

__all__ = ["create_golden_path"]
```

**Step 4: Write test**

Add to `systems/swarm/workflow/test_workflow.py`:

```python
from systems.swarm.workflow.presets import create_golden_path


class TestGoldenPath:
    """Tests for Golden Path preset."""

    def test_create_golden_path(self):
        """Golden path has 3 steps."""
        workflow = create_golden_path()
        assert workflow.name == "golden-path"
        assert len(workflow.steps) == 3

    def test_golden_path_order(self):
        """Steps are in correct order."""
        workflow = create_golden_path()
        assert workflow.steps[0].name == "design"
        assert workflow.steps[1].name == "implement"
        assert workflow.steps[2].name == "review"

    def test_golden_path_transitions(self):
        """Has review transitions."""
        workflow = create_golden_path()
        assert workflow.transitions["review.approved"] == "complete"
        assert workflow.transitions["review.rejected"] == "step.implement"
```

**Step 5: Run tests**

Run: `pytest systems/swarm/workflow/ -v`
Expected: All PASS

**Step 6: Commit**

```bash
git add systems/swarm/workflow/
git commit -m "feat(workflow): add Golden Path preset workflow"
```

---

## Phase 4: Integration Tests

### Task 6: Integration with NEBBus

**Files:**
- Create: `systems/swarm/workflow/test_integration.py`

**Step 1: Write integration test**

Create `systems/swarm/workflow/test_integration.py`:

```python
"""Integration tests for workflow system."""

import pytest
from systems.swarm.neb_bus import NEBBus
from systems.swarm.workflow import WorkflowOrchestrator, WorkflowInstance
from systems.swarm.workflow.presets import create_golden_path


class TestWorkflowIntegration:
    """Integration tests with real NEBBus."""

    @pytest.fixture
    def event_bus(self):
        """Create real NEBBus for testing."""
        return NEBBus(node_id="test-orchestrator")

    @pytest.fixture
    def orchestrator(self, event_bus):
        """Create orchestrator with golden path registered."""
        orch = WorkflowOrchestrator(event_bus=event_bus)
        orch.register(create_golden_path())
        return orch

    def test_create_and_start_instance(self, orchestrator):
        """Can create and start a workflow instance."""
        instance = orchestrator.create_instance(
            "golden-path",
            {"feature": "auth", "requirements": {"methods": ["login", "logout"]}}
        )

        orchestrator.start(instance)

        assert instance.status.value == "running"
        assert instance.current_step == 0
        assert instance.context["feature"] == "auth"

    def test_event_emission(self, orchestrator, event_bus):
        """Events are emitted to NEBBus."""
        received = []

        def capture(signal):
            received.append(signal.topic)

        event_bus.subscribe("workflow.golden-path.*", capture)

        instance = orchestrator.create_instance("golden-path", {"feature": "test"})
        orchestrator.start(instance)

        assert any("started" in r for r in received)

    def test_advance_workflow(self, orchestrator):
        """Workflow can advance through steps."""
        instance = orchestrator.create_instance("golden-path", {"feature": "auth"})
        orchestrator.start(instance)

        runner = orchestrator.runners["golden-path"]
        runner.advance(instance)

        assert instance.current_step == 1

    def test_complete_workflow(self, orchestrator):
        """Workflow reaches complete status."""
        instance = orchestrator.create_instance("golden-path", {"feature": "auth"})
        orchestrator.start(instance)

        runner = orchestrator.runners["golden-path"]

        # Simulate completing all steps
        runner.advance(instance)  # design -> implement
        runner.advance(instance)  # implement -> review
        runner.advance(instance)  # review -> done

        assert runner.check_complete(instance)
```

**Step 2: Run tests**

Run: `pytest systems/swarm/workflow/test_integration.py -v`
Expected: 4 PASS

**Step 3: Run all workflow tests**

Run: `pytest systems/swarm/workflow/ -v`
Expected: ~25 tests PASS

**Step 4: Commit**

```bash
git add systems/swarm/workflow/
git commit -m "test(workflow): add integration tests with NEBBus"
```

---

## Phase 5: Module Exports & Quality

### Task 7: Update Main Swarm Exports

**Files:**
- Modify: `systems/swarm/__init__.py`

**Step 1: Add workflow exports**

Add to `systems/swarm/__init__.py`:

```python
# Workflow orchestration
from systems.swarm.workflow import (
    Workflow,
    WorkflowStep,
    WorkflowInstance,
    WorkflowStatus,
    WorkflowRunner,
    WorkflowOrchestrator,
)

# Add to __all__
__all__ = [
    # ... existing exports ...
    # Workflow
    "Workflow",
    "WorkflowStep",
    "WorkflowInstance",
    "WorkflowStatus",
    "WorkflowRunner",
    "WorkflowOrchestrator",
]
```

**Step 2: Verify import works**

```bash
python3 -c "from systems.swarm import WorkflowOrchestrator; print('OK')"
```

**Step 3: Run full swarm test suite**

Run: `pytest tests/swarm/ systems/swarm/workflow/ -q`
Expected: All PASS (180+ tests)

**Step 4: Commit**

```bash
git add systems/swarm/__init__.py
git commit -m "feat(swarm): export workflow components"
```

---

### Task 8: Quality Check

**Step 1: Run linting**

Run: `ruff check systems/swarm/workflow/`
Fix any issues.

**Step 2: Run type check (if configured)**

Run: `mypy systems/swarm/workflow/ --ignore-missing-imports`
Fix any issues.

**Step 3: Final test count**

Run: `pytest tests/swarm/ systems/swarm/workflow/ -q`
Expected: All PASS

**Step 4: Final commit**

```bash
git add -A
git commit -m "chore(workflow): quality check passed"
```

---

## Summary

| Phase | Tasks | Tests |
|-------|-------|-------|
| Phase 1: Core Data | 3 | ~18 |
| Phase 2: NEBBus | 1 | ~5 |
| Phase 3: Presets | 1 | ~3 |
| Phase 4: Integration | 1 | ~4 |
| Phase 5: Quality | 2 | - |
| **Total** | **8** | **~30** |

**Files Created:**
- `systems/swarm/workflow/__init__.py`
- `systems/swarm/workflow/workflow.py`
- `systems/swarm/workflow/workflow_instance.py`
- `systems/swarm/workflow/workflow_runner.py`
- `systems/swarm/workflow/workflow_orchestrator.py`
- `systems/swarm/workflow/test_workflow.py`
- `systems/swarm/workflow/test_runner.py`
- `systems/swarm/workflow/test_orchestrator.py`
- `systems/swarm/workflow/test_integration.py`
- `systems/swarm/workflow/presets/__init__.py`
- `systems/swarm/workflow/presets/golden_path.py`
