---
spec: agency-era-guilds
phase: tasks
total_tasks: 12
created: 2026-02-22T12:00:00Z
generated: auto
---

# Tasks: Agency Era Phase 1 - The Guilds

## Phase 1: Make It Work (POC)

Focus: Get EngineerAgent generating code end-to-end. Skip tests initially.

- [x] 1.1 Extend TaskType enum with guild task types
  - **Do**: Add 6 new task types to `systems/swarm/task.py`: CODE_GENERATION, CODE_TESTING, CODE_REVIEW, SECURITY_SCAN, ARCHITECTURE_DESIGN, SYSTEM_PLANNING
  - **Files**: `systems/swarm/task.py`
  - **Done when**: All 6 types visible in TaskType enum
  - **Verify**: `python -c "from systems.swarm.task import TaskType; print([t.value for t in TaskType])"`
  - **Commit**: `feat(swarm): add guild task types to TaskType enum`
  - _Requirements: FR-1, FR-5, FR-9_

- [x] 1.2 Create guilds module structure
  - **Do**: Create `systems/swarm/guilds/` directory with `__init__.py` (empty exports for now)
  - **Files**: `systems/swarm/guilds/__init__.py`
  - **Done when**: Module imports without error
  - **Verify**: `python -c "from systems.swarm.guilds import *; print('OK')"`
  - **Commit**: `feat(swarm): create guilds module structure`
  - _Requirements: All_

- [x] 1.3 Implement GuildAgent abstract base
  - **Do**: Create `base.py` with GuildAgent class extending SwarmAgent. Add `role` attribute, `event_bus` param, `_publish_result()` method, abstract `_summarize()`
  - **Files**: `systems/swarm/guilds/base.py`
  - **Done when**: Class instantiates with stub _summarize
  - **Verify**: `python -c "from systems.swarm.guilds.base import GuildAgent; print(GuildAgent.__abstractmethods__)"`
  - **Commit**: `feat(swarm): add GuildAgent abstract base class`
  - _Requirements: FR-12, FR-13_

- [x] 1.4 Implement EngineerAgent with write_code handler
  - **Do**: Create `engineer.py` with EngineerAgent extending GuildAgent. Implement `_summarize()`, register handler for CODE_GENERATION that returns `{"code": "...", "language": "python"}`. Start with hardcoded template code.
  - **Files**: `systems/swarm/guilds/engineer.py`
  - **Done when**: Agent claims CODE_GENERATION tasks and returns code
  - **Verify**: Manual test with TaskBoard.post(CODE_GENERATION task)
  - **Commit**: `feat(swarm): add EngineerAgent with code generation`
  - _Requirements: FR-1, FR-2_

- [x] 1.5 Implement GuildFactory
  - **Do**: Create `factory.py` with GuildFactory.create() method returning correct agent by role string
  - **Files**: `systems/swarm/guilds/factory.py`
  - **Done when**: Factory creates EngineerAgent for "engineer" role
  - **Verify**: `python -c "from systems.swarm.guilds.factory import GuildFactory; print(GuildFactory.create)"`
  - **Commit**: `feat(swarm): add GuildFactory for agent creation`
  - _Requirements: FR-14_

- [x] 1.6 POC Checkpoint - Engineer end-to-end
  - **Do**: Verify EngineerAgent claims task, generates code, completes task, publishes event
  - **Done when**: Manual test shows code in task.result and event in NEB history
  - **Verify**: Create task → run work_cycle() → check task.result["code"]
  - **Commit**: `feat(swarm): complete EngineerAgent POC`

## Phase 2: Refactoring

- [x] 2.1 Implement ReviewerAgent
  - **Do**: Create `reviewer.py` with ReviewerAgent extending GuildAgent. Implement handlers for CODE_REVIEW and SECURITY_SCAN. Return analysis results.
  - **Files**: `systems/swarm/guilds/reviewer.py`
  - **Done when**: Agent handles both review task types
  - **Verify**: Manual test with CODE_REVIEW and SECURITY_SCAN tasks
  - **Commit**: `feat(swarm): add ReviewerAgent with analysis handlers`
  - _Requirements: FR-5, FR-6, FR-7_

- [x] 2.2 Implement ArchitectAgent
  - **Do**: Create `architect.py` with ArchitectAgent extending GuildAgent. Implement handlers for ARCHITECTURE_DESIGN and SYSTEM_PLANNING. Return component specs.
  - **Files**: `systems/swarm/guilds/architect.py`
  - **Done when**: Agent handles both architecture task types
  - **Verify**: Manual test with ARCHITECTURE_DESIGN task
  - **Commit**: `feat(swarm): add ArchitectAgent with design handlers`
  - _Requirements: FR-9, FR-10, FR-11_

- [x] 2.3 Add error handling to all agents
  - **Do**: Wrap handler execution in try/except, return error dicts with actionable info
  - **Files**: `systems/swarm/guilds/engineer.py`, `reviewer.py`, `architect.py`
  - **Done when**: Exceptions result in fail_task() with traceback in result
  - **Verify**: Force exception in handler, check task.result["error"]
  - **Commit**: `refactor(swarm): add error handling to guild agents`
  - _Design: Error Handling_

## Phase 3: Testing

- [x] 3.1 Unit tests for GuildAgent base
  - **Do**: Create test file testing _publish_result() called on complete, role attribute set
  - **Files**: `tests/swarm/test_guild_base.py`
  - **Done when**: pytest passes for GuildAgent tests
  - **Verify**: `pytest tests/swarm/test_guild_base.py -v`
  - **Commit**: `test(swarm): add GuildAgent unit tests`
  - _Requirements: AC-4.1, AC-4.2_

- [x] 3.2 Unit tests for each guild agent
  - **Do**: Create test files for EngineerAgent, ReviewerAgent, ArchitectAgent testing handlers return correct structure
  - **Files**: `tests/swarm/test_engineer.py`, `test_reviewer.py`, `test_architect.py`
  - **Done when**: All handler methods tested
  - **Verify**: `pytest tests/swarm/test_*.py -v`
  - **Commit**: `test(swarm): add guild agent handler tests`
  - _Requirements: AC-1.1, AC-2.1, AC-3.1_

- [x] 3.3 Integration test with TaskBoard and NEBBus
  - **Do**: Test full workflow: post task → agent claims → completes → NEB event published
  - **Files**: `tests/swarm/test_guild_integration.py`
  - **Done when**: Integration test passes
  - **Verify**: `pytest tests/swarm/test_guild_integration.py -v`
  - **Commit**: `test(swarm): add guild integration tests`

## Phase 4: Quality Gates

- [ ] 4.1 Update module exports
  - **Do**: Add all guild classes to `systems/swarm/guilds/__init__.py` and reference in `systems/swarm/__init__.py`
  - **Files**: `systems/swarm/guilds/__init__.py`, `systems/swarm/__init__.py`
  - **Done when**: All classes importable from `systems.swarm`
  - **Verify**: `python -c "from systems.swarm import EngineerAgent, ReviewerAgent, ArchitectAgent, GuildFactory"`
  - **Commit**: `feat(swarm): export guild agents from swarm module`

- [ ] 4.2 Local quality check
  - **Do**: Run mypy type check, pytest, ensure all pass
  - **Verify**: `mypy systems/swarm/guilds/ && pytest tests/swarm/ -v`
  - **Done when**: No type errors, all tests pass
  - **Commit**: `fix(swarm): address type issues in guilds` (if needed)

## Notes

- **POC shortcuts**: Hardcoded code generation templates, no actual LLM integration
- **Production TODOs**: Integrate actual code generation (LLM), add real security scanner (bandit), add style checker (pylint/black)
- **Extensions**: EngineerAgent.test_code() needs sandbox execution environment
