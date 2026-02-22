# Add Swarm Intelligence System

## Status
ACTIVE

## Summary
Implement file-based decentralized swarm coordination with TaskBoard, SwarmAgent, and SwarmCoordinator using MapReduce pattern.

## Motivation
Enable distributed task processing with atomic cross-process claiming, capability-based routing, and pluggable result aggregation strategies.

## Core Components

### 1. Task (task.py)
- Immutable dataclass for work items
- Lifecycle states: PENDING → CLAIMED → IN_PROGRESS → COMPLETED/FAILED/CANCELLED
- JSON serialization for file storage

### 2. TaskBoard (task_board.py)
- File-based task storage with flock atomic operations
- Post, claim, complete, fail operations
- Query by status, type, parent_id

### 3. ReductionStrategy (reduction.py)
- FirstResultStrategy: Return first result
- BestScoreStrategy: Return highest score
- MergeAllStrategy: Combine all lists
- MajorityVoteStrategy: Return most common value

### 4. SwarmAgent (swarm_agent.py)
- Claim tasks matching capabilities
- Execute via registered handlers
- Report complete/fail

### 5. SwarmCoordinator (swarm_coordinator.py)
- map(): Create subtasks with parent_id
- reduce(): Aggregate by parent_id + strategy
- get_progress(): Monitor job state

## Architecture
```
Coordinator.map() → TaskBoard.post() → Agent.claim_next_task()
                                            │
                                            ▼
Coordinator.reduce() ← TaskBoard.get_results() ← Agent.complete_task()
```

## Success Criteria
| Metric | Target |
|--------|--------|
| Unit tests passing | 27+ |
| Integration tests passing | 5 |
| Test coverage | >90% |
| Cross-process atomicity | Verified via flock |

## References
- Implementation Plan: `docs/plans/2026-02-22-swarm-intelligence.md`
- Design: `specs/swarm-intelligence/design.md`
- Requirements: `specs/swarm-intelligence/requirements.md`
