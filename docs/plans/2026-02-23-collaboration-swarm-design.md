# Design: Collaboration Swarm - Multi-Agent Workflows

**Date**: 2026-02-23
**Status**: Approved
**Phase**: Post-Agency Era
**North Star**: Golden Path (Architect → Engineer → Reviewer)

## Overview

Enable multi-agent collaboration through a Workflow Orchestrator that bridges TaskBoard (state) with NEBBus (events). Supports three collaboration patterns:

1. **Sequential pipelines** — Directed workflows where output of one agent feeds into the next
2. **Event-driven handoffs** — Agents subscribe to events and react autonomously
3. **Negotiation workflows** — Consensus-based decision making with approval gates

## Architecture

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Architect  │───▶│  Engineer   │───▶│  Reviewer   │
│  (Design)   │    │  (Code)     │    │  (Approve)  │
└─────────────┘    └─────────────┘    └─────────────┘
      │                  │                  │
      ▼                  ▼                  ▼
  design.json      code.patch         review.json
      │                  │                  │
      └──────────────────┴──────────────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │   WorkflowRunner    │
              │   (state machine)   │
              └─────────────────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │     NEBBus          │
              │ (workflow.* events) │
              └─────────────────────┘
```

## Core Components

### Workflow (Immutable Definition)

```python
@dataclass
class WorkflowStep:
    name: str                    # "design", "implement", "review"
    agent_type: str              # "architect", "engineer", "reviewer"
    input_schema: dict           # Expected input fields
    output_schema: dict          # Promised output fields

@dataclass
class Workflow:
    name: str                    # "golden-path"
    steps: List[WorkflowStep]    # Ordered pipeline
    transitions: Dict[str, str]  # "review.approved" -> "complete"
```

### WorkflowInstance (Mutable State)

```python
@dataclass
class WorkflowInstance:
    workflow_name: str
    instance_id: str
    current_step: int
    context: Dict[str, Any]      # Accumulated outputs
    status: str                  # "running", "blocked", "complete", "failed"
    retry_count: int
    created_at: datetime
    last_activity: datetime
```

### WorkflowRunner (State Machine)

Executes workflow instances, invoking agents and handling transitions.

### WorkflowOrchestrator

Creates workflows, tracks active instances, emits NEBBus events.

## Data Flow

**Step-by-step execution:**

1. **USER REQUEST**: `Orchestrator.create_instance("golden-path", {"feature": "auth"})`
2. **RUNNER STARTS**: Executes step 0 (Architect), subscribes to completion event
3. **STEP COMPLETES**: Agent publishes `workflow.*.step.design.complete`, Runner advances
4. **CONTEXT ACCUMULATES**: Each step output merged into context
5. **REVIEW GATE**: Conditional transition based on `review.approved` or `review.rejected`
6. **WORKFLOW COMPLETE**: Final context returned, `workflow.*.complete` emitted

**Context accumulation:**

```python
# Step 0: Architect
context = {"feature": "auth", "design": {"components": ["AuthService"]}}

# Step 1: Engineer (merged)
context = {"feature": "auth", "design": {...}, "code": "def AuthService..."}

# Step 2: Reviewer (merged)
context = {..., "review": {"approved": True}}
```

## State Machine

```
                    ┌──────────────┐
                    │   CREATED    │
                    └──────┬───────┘
                           │ start()
                           ▼
                    ┌──────────────┐
              ┌────▶│   RUNNING    │◀────┐
              │     └──────┬───────┘     │
              │            │             │
              │     ┌──────┴───────┐     │
              │     │              │     │
              │     ▼              ▼     │
        ┌─────┴───────┐   ┌────────────┐ │
        │  BLOCKED    │   │  COMPLETE  │ │
        │ (waiting)   │   └────────────┘ │
        └─────┬───────┘                  │
              │ resume()                 │
              └──────────────────────────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   FAILED     │
                    └──────────────┘
```

### Transition Triggers

| Event | Action |
|-------|--------|
| `step.{name}.complete` | Advance to next step |
| `step.{name}.failed` | Mark instance FAILED |
| `step.{name}.blocked` | Wait for external input |
| `review.approved` | Continue to COMPLETE |
| `review.rejected` | Loop back to fix step |
| `review.rejected_max` | Mark FAILED after 3 retries |

## NEBBus Integration

### Event Namespaces

```
workflow.{workflow_name}.{instance_id}.{event}

Examples:
├── workflow.golden-path.inst-abc123.started
├── workflow.golden-path.inst-abc123.step.design.complete
├── workflow.golden-path.inst-abc123.step.review.approved
└── workflow.golden-path.inst-abc123.complete
```

### Event Payload

```python
{
    "workflow_name": "golden-path",
    "instance_id": "inst-abc123",
    "step": "implement",
    "status": "complete",
    "context": {...},
    "timestamp": "2026-02-23T14:00:00Z",
    "agent_id": "engineer-001"
}
```

### Agent Subscriptions

```python
# Automatic when agent joins workflow
engineer.subscribe_to_workflow("golden-path", step="implement")

# Subscribes to:
# "workflow.golden-path.*.step.design.complete"  <- trigger to start
```

## Error Handling

### Failure Scenarios

| Scenario | Detection | Recovery |
|----------|-----------|----------|
| Agent crashes | Timeout (no `step.complete`) | Retry or reassign |
| Agent error | `step.failed` event | Log, notify, FAIL |
| Review rejected | `review.rejected` | Loop back (max 3) |
| Workflow stuck | No progress for N min | Emit `stale`, retry/fail |
| Invalid context | Schema validation | Block, request human input |

### Retry Policy

```python
@dataclass
class RetryPolicy:
    max_retries: int = 3
    retry_delay_seconds: float = 5.0
    backoff_multiplier: float = 2.0
    on_max_retries: str = "fail"
```

### Human Escalation

```python
def escalate(instance: WorkflowInstance, reason: str):
    instance.status = "blocked"
    emit(instance, "escalation.required", {
        "reason": reason,
        "context": instance.context,
        "suggested_action": "review_and_approve"
    })
```

## Testing Strategy

### Test Pyramid

```
                    ┌─────────────────┐
                    │   E2E Tests     │  2-3 tests
                    └────────┬────────┘
                             │
               ┌─────────────┴─────────────┐
               │    Integration Tests      │  8-10 tests
               └─────────────┬─────────────┘
                             │
        ┌────────────────────┴────────────────────┐
        │              Unit Tests                  │  20-25 tests
        └─────────────────────────────────────────┘
```

### Unit Tests

| Component | Tests |
|-----------|-------|
| `Workflow` | 4 (ordering, validation, schema) |
| `WorkflowInstance` | 5 (transitions, context, retry) |
| `WorkflowRunner` | 6 (execution, events, errors) |
| `WorkflowOrchestrator` | 5 (creation, stale, escalation) |

### Integration Test Example

```python
def test_engineer_triggered_by_architect_complete():
    bus = NEBBus(node_id="test")
    engineer = EngineerAgent(event_bus=bus)
    engineer.subscribe_to_workflow("golden-path", step="implement")

    bus.publish("workflow.golden-path.inst-001.step.design.complete", {...})

    assert engineer.current_task is not None
```

### E2E Test Example

```python
def test_golden_path_happy_path():
    orchestrator = WorkflowOrchestrator(event_bus=bus)
    instance = orchestrator.create_instance("golden-path", {"feature": "auth"})
    orchestrator.start(instance)

    result = orchestrator.wait_for_completion(instance, timeout=60)

    assert result.status == "complete"
    assert "design" in result.context
    assert "code" in result.context
```

## Files to Create

| File | Purpose |
|------|---------|
| `systems/swarm/workflow/workflow.py` | Workflow, WorkflowStep dataclasses |
| `systems/swarm/workflow/workflow_instance.py` | WorkflowInstance state |
| `systems/swarm/workflow/workflow_runner.py` | State machine execution |
| `systems/swarm/workflow/workflow_orchestrator.py` | Instance management, events |
| `systems/swarm/workflow/__init__.py` | Module exports |
| `systems/swarm/workflow/test_workflow.py` | Unit tests |
| `systems/swarm/workflow/test_integration.py` | Integration tests |

## Integration Points

- **GuildAgents**: Subscribe to workflow events, receive context
- **NEBBus**: Event publishing for all workflow state changes
- **TaskBoard**: Optional persistence of workflow instances
- **EpisodicMemory**: Agents can recall past workflow experiences
- **RecursiveGrowth**: Analyze workflow performance metrics

## Future Extensions

1. **Parallel steps** — Multiple agents working simultaneously (MapReduce style)
2. **Dynamic workflows** — Steps determined at runtime based on context
3. **Workflow templates** — User-defined pipelines via config
4. **Visual HUD** — Real-time workflow visualization on Infinite Map
