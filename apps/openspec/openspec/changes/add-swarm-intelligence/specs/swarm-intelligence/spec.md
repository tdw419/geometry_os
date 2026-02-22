# Swarm Intelligence Specification Delta

## ADDED Requirements

### REQ-SWARM-001: Task Data Structure
The system SHALL provide an immutable Task dataclass with:
- Unique identifier
- Task type for routing
- Description of work
- Lifecycle status (PENDING, CLAIMED, IN_PROGRESS, COMPLETED, FAILED, CANCELLED)
- Priority for ordering
- Optional parent_id for subtask relationships
- Optional result payload
- JSON serialization/deserialization

#### Scenario: Create and serialize a task
- GIVEN a Task with id="t1", type="analysis", description="Analyze code"
- WHEN the task is created
- THEN status SHALL be PENDING
- AND to_json() SHALL produce valid JSON
- AND from_json() SHALL restore the task

### REQ-SWARM-002: TaskBoard Storage
The system SHALL provide a TaskBoard for file-based task storage with:
- Post tasks to file storage (.json per task)
- Atomic claim using flock for cross-process safety
- Query pending tasks
- Query by type
- Query by parent_id
- Get completed results by parent_id
- Mark tasks as complete or failed

#### Scenario: Atomic task claiming
- GIVEN a PENDING task on the TaskBoard
- WHEN two agents attempt to claim simultaneously
- THEN exactly one agent SHALL succeed
- AND the task status SHALL be CLAIMED

### REQ-SWARM-003: Reduction Strategies
The system SHALL provide pluggable result aggregation strategies:
- FirstResultStrategy: Return the first completed result
- BestScoreStrategy: Return the result with highest score
- MergeAllStrategy: Combine all results into merged lists
- MajorityVoteStrategy: Return the most common value

#### Scenario: Best score selection
- GIVEN results [{"score": 50}, {"score": 95}, {"score": 75}]
- WHEN BestScoreStrategy reduces the results
- THEN the result SHALL be {"score": 95}

### REQ-SWARM-004: SwarmAgent
The system SHALL provide SwarmAgent workers that:
- Have a unique agent_id
- Declare capabilities for task type matching
- Claim next pending task matching capabilities
- Execute tasks via registered handlers
- Report completion or failure

#### Scenario: Capability-based claiming
- GIVEN a TaskBoard with tasks of types ["analysis", "render"]
- AND an agent with capabilities ["analysis"]
- WHEN the agent claims the next task
- THEN the task type SHALL be "analysis"

### REQ-SWARM-005: SwarmCoordinator
The system SHALL provide a SwarmCoordinator for MapReduce orchestration:
- map(task_type, description, payloads): Create subtasks with parent_id
- reduce(parent_id, strategy): Aggregate completed results
- get_progress(parent_id): Return job progress statistics

#### Scenario: Map creates subtasks
- GIVEN payloads ["file1.py", "file2.py", "file3.py"]
- WHEN coordinator.map("analyze", "Analyze file", payloads)
- THEN 3 subtasks SHALL be created
- AND each subtask SHALL have the same parent_id

## MODIFIED Requirements

None - this is a new capability.

## REMOVED Requirements

None - this is a new capability.
