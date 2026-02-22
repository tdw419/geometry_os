---
spec: swarm-intelligence-proofs
phase: tasks
total_tasks: 9
created: 2026-02-22T12:00:00Z
generated: auto
---

# Tasks: Swarm Intelligence Proofs

## Phase 1: Make It Work (POC)

Focus: Implement all 14 test cases. Let failures guide production code fixes.

- [ ] 1.1 Create parallel isolation tests
  - **Do**: Create `tests/swarm/test_parallel_isolation.py` with 3 tests:
    - `test_concurrent_claiming_no_double_claims`: 5 threads claim from 10 tasks, verify no duplicates
    - `test_concurrent_results_no_mixing`: 3 agents complete tasks, verify correct result attribution
    - `test_file_locking_prevents_race_conditions`: 10 agents race for 1 task, verify single winner
  - **Files**: `tests/swarm/test_parallel_isolation.py`
  - **Done when**: All 3 tests pass
  - **Verify**: `pytest tests/swarm/test_parallel_isolation.py -v`
  - **Commit**: `test(swarm): add parallel isolation tests for concurrent claiming`
  - _Requirements: FR-1, FR-2, FR-3_
  - _Design: test_parallel_isolation.py_

- [ ] 1.2 Create cross-process coordination tests
  - **Do**: Create `tests/swarm/test_cross_process.py` with 3 tests:
    - `test_subprocess_agents_coordinate_via_shared_taskboard`: 3 subprocesses via Popen, verify all complete
    - `test_no_communication_except_taskboard`: Verify no shared env vars, only file storage
    - `test_multiple_workers_one_taskboard`: 3 workers, 9 tasks, verify distribution
  - **Files**: `tests/swarm/test_cross_process.py`
  - **Done when**: All 3 tests pass
  - **Verify**: `pytest tests/swarm/test_cross_process.py -v`
  - **Commit**: `test(swarm): add cross-process coordination tests with subprocesses`
  - _Requirements: FR-4, FR-5, FR-6_
  - _Design: test_cross_process.py_

- [ ] 1.3 Create fault tolerance tests
  - **Do**: Create `tests/swarm/test_fault_tolerance.py` with 4 tests:
    - `test_claimed_task_becomes_reclaimable_after_timeout`: Simulate crash by aging claimed_at timestamp
    - `test_corrupted_task_file_quarantined`: Write invalid JSON, verify get_pending() skips it
    - `test_agent_fail_task_marks_failed`: Verify fail_task() sets FAILED status with error
    - `test_graceful_handling_of_missing_storage`: Pass nonexistent path, verify auto-create
  - **Files**: `tests/swarm/test_fault_tolerance.py`
  - **Done when**: All 4 tests pass (may need production code fixes for corruption/stale claims)
  - **Verify**: `pytest tests/swarm/test_fault_tolerance.py -v`
  - **Commit**: `test(swarm): add fault tolerance tests for crash recovery`
  - _Requirements: FR-7, FR-8, FR-9, FR-10_
  - _Design: test_fault_tolerance.py, Production Code Changes section_

- [ ] 1.4 Create scalability tests
  - **Do**: Create `tests/swarm/test_scalability.py` with 4 tests:
    - `test_100_tasks_distributed_across_10_agents`: Verify distribution variance <= 2
    - `test_1000_tasks_with_progress_tracking`: Verify progress_pct at 50% after 500 completions
    - `test_claim_latency_under_10ms`: Use perf_counter, assert avg < 10ms
    - `test_memory_usage_stays_bounded`: Use tracemalloc, assert growth < 10MB
  - **Files**: `tests/swarm/test_scalability.py`
  - **Done when**: All 4 tests pass
  - **Verify**: `pytest tests/swarm/test_scalability.py -v`
  - **Commit**: `test(swarm): add scalability tests for 100+ tasks`
  - _Requirements: FR-11, FR-12, FR-13, FR-14_
  - _Design: test_scalability.py_

- [ ] 1.5 POC Checkpoint
  - **Do**: Verify all 14 new tests + 32 existing = 46 total pass
  - **Done when**: All swarm tests pass
  - **Verify**: `pytest tests/swarm/ -v --tb=short`
  - **Commit**: `test(swarm): complete swarm intelligence proofs suite`

## Phase 2: Production Code Fixes

After POC validated, fix any production code gaps exposed by tests.

- [ ] 2.1 Add corruption handling to TaskBoard.get_pending()
  - **Do**: Wrap Task.from_json() in try/except, skip corrupted files
  - **Files**: `systems/swarm/task_board.py`
  - **Done when**: `test_corrupted_task_file_quarantined` passes
  - **Verify**: `pytest tests/swarm/test_fault_tolerance.py::TestFaultTolerance::test_corrupted_task_file_quarantined -v`
  - **Commit**: `fix(swarm): handle corrupted task files gracefully`
  - _Design: Production Code Changes section_

- [ ] 2.2 Add stale claim recovery (if needed)
  - **Do**: If test 1.3 first test fails, implement timeout-based reclamation
  - **Files**: `systems/swarm/task_board.py`, possibly `systems/swarm/task.py`
  - **Done when**: `test_claimed_task_becomes_reclaimable_after_timeout` passes
  - **Verify**: `pytest tests/swarm/test_fault_tolerance.py::TestFaultTolerance::test_claimed_task_becomes_reclaimable_after_timeout -v`
  - **Commit**: `feat(swarm): add stale claim recovery for crash resilience`
  - _Design: Production Code Changes section_

## Phase 3: Testing

- [ ] 3.1 Run full swarm test suite with timing
  - **Do**: Execute all tests, capture durations
  - **Files**: All swarm tests
  - **Done when**: All pass, total < 60s
  - **Verify**: `pytest tests/swarm/ --durations=20`
  - **Commit**: N/A (verification only)

- [ ] 3.2 Verify test isolation
  - **Do**: Run tests multiple times, check for flakiness
  - **Files**: All swarm tests
  - **Done when**: 3 consecutive runs all pass
  - **Verify**: `for i in 1 2 3; do pytest tests/swarm/ -q || exit 1; done`
  - **Commit**: N/A (verification only)

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run type check, lint, all tests
  - **Verify**: Type check passes, lint clean, all tests green
  - **Done when**: All commands pass
  - **Commit**: `fix(swarm): address lint/type issues` (if needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: Tests may initially fail if production code lacks error handling
- **Production TODOs**: Add try/except in get_pending(), possibly stale claim recovery
- **Test count**: 14 new + 32 existing = 46 total
