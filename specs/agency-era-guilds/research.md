---
spec: agency-era-guilds
phase: research
created: 2026-02-22T12:00:00Z
generated: auto
---

# Research: Agency Era Phase 1 - The Guilds

## Executive Summary
Feasibility HIGH. Guild agents extend existing SwarmAgent with specialized handlers. No new infrastructure needed - leverage TaskBoard, NEBBus, and handler pattern already in place.

## Codebase Analysis

### Existing Patterns

| Pattern | Location | Notes |
|---------|----------|-------|
| SwarmAgent base class | `systems/swarm/swarm_agent.py` | claim/execute/complete cycle, handlers dict |
| TaskType enum | `systems/swarm/task.py` | CODE_ANALYSIS, PARALLEL_SEARCH, etc. |
| Handler pattern | `swarm_agent.py:86-104` | `handlers: Dict[TaskType, Callable]` |
| NEB integration | `swarm_agent.py:169-195` | `subscribe_to_events()` for reactive claiming |
| TaskBoard coordination | `systems/swarm/task_board.py` | File-based with fcntl locking |
| NEBBus pub/sub | `systems/swarm/neb_bus.py` | Topic + semantic matching |

### Key Implementation Details

**SwarmAgent constructor** (`swarm_agent.py:32-55`):
```python
def __init__(
    self,
    agent_id: str,
    task_board: TaskBoard,
    capabilities: Optional[List[str]] = None,
    handlers: Optional[Dict[TaskType, Callable]] = None,
    auto_claim: bool = False
)
```

**Handler execution** (`swarm_agent.py:86-104`):
```python
def execute_task(self, task: Task) -> Dict[str, Any]:
    handler = self.handlers.get(task.task_type)
    if handler:
        result = handler(task)
    else:
        result = self._default_handler(task)
    return result
```

**Work cycle** (`swarm_agent.py:150-167`):
```python
def work_cycle(self) -> Optional[Task]:
    task = self.claim_next_task()
    result = self.execute_task(task)
    self.complete_task(task, result)
    return task
```

### Dependencies
- `systems.swarm.swarm_agent.SwarmAgent` - Base class
- `systems.swarm.task.TaskType` - Task routing
- `systems.swarm.neb_bus.NEBBus` - Event publishing

### Constraints
- Must extend TaskType enum for new task types
- Handlers must return `Dict[str, Any]`
- File-based TaskBoard limits throughput (acceptable for guild tasks)
- No semantic matching needed (explicit task types)

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Direct extension of SwarmAgent |
| Effort Estimate | S | 3 specialized classes + base |
| Risk Level | Low | No infrastructure changes |

## New Task Types Required

```python
class TaskType(Enum):
    # Existing
    CODE_ANALYSIS = "CODE_ANALYSIS"
    PARALLEL_SEARCH = "PARALLEL_SEARCH"
    SOLUTION_EXPLORATION = "SOLUTION_EXPLORATION"
    DISTRIBUTED_REVIEW = "DISTRIBUTED_REVIEW"

    # Guild-specific (NEW)
    CODE_GENERATION = "CODE_GENERATION"      # EngineerAgent
    CODE_TESTING = "CODE_TESTING"            # EngineerAgent
    CODE_REVIEW = "CODE_REVIEW"              # ReviewerAgent
    SECURITY_SCAN = "SECURITY_SCAN"          # ReviewerAgent
    ARCHITECTURE_DESIGN = "ARCHITECTURE_DESIGN"  # ArchitectAgent
    SYSTEM_PLANNING = "SYSTEM_PLANNING"      # ArchitectAgent
```

## Recommendations

1. **Create GuildAgent abstract base** - Common guild functionality (role, publish results to NEB)
2. **Extend TaskType enum** - Add 6 new task types for guilds
3. **Factory pattern** - `GuildFactory.create(role)` for easy instantiation
4. **Keep handlers stateless** - All state in TaskBoard, not agent memory
