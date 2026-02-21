---
spec: directive-testing-suite
phase: tasks
total_tasks: 6
created: 2026-02-21T00:00:00Z
generated: auto
---

# Tasks: Directive Testing Suite

## Phase 1: Make It Work (POC)

Focus: Add all test cases following existing patterns. Skip optimization.

- [x] 1.1 Add scope detection edge case tests
  - **Do**: Add `TestScopeDetectionEdgeCases` class with 8 tests to `tests/test_directive_agent.py`
  - **Files**: `tests/test_directive_agent.py`
  - **Done when**: `pytest tests/test_directive_agent.py::TestScopeDetectionEdgeCases -v` passes 8 tests
  - **Verify**: `python -m pytest tests/test_directive_agent.py::TestScopeDetectionEdgeCases -v`
  - **Commit**: `test(directive): add scope detection edge case tests`
  - _Requirements: FR-1_
  - _Design: TestScopeDetectionEdgeCases_

- [x] 1.2 Add component lookup edge case tests
  - **Do**: Add `TestComponentLookupEdgeCases` class with 6 tests to `tests/test_directive_agent.py`
  - **Files**: `tests/test_directive_agent.py`
  - **Done when**: `pytest tests/test_directive_agent.py::TestComponentLookupEdgeCases -v` passes 6 tests
  - **Verify**: `python -m pytest tests/test_directive_agent.py::TestComponentLookupEdgeCases -v`
  - **Commit**: `test(directive): add component lookup edge case tests`
  - _Requirements: FR-2_
  - _Design: TestComponentLookupEdgeCases_

- [x] 1.3 Create performance benchmark tests
  - **Do**: Create `tests/test_directive_performance.py` with 3 test classes (7 tests total)
  - **Files**: `tests/test_directive_performance.py`
  - **Done when**: `pytest tests/test_directive_performance.py -v` passes all tests
  - **Verify**: `python -m pytest tests/test_directive_performance.py -v`
  - **Commit**: `test(directive): add performance benchmark tests`
  - _Requirements: FR-3_
  - _Design: TestPollingPerformance, TestHeartbeatPerformance, TestMemoryEfficiency_

- [x] 1.4 Create stress tests
  - **Do**: Create `tests/test_directive_stress.py` with 4 test classes (7 tests total)
  - **Files**: `tests/test_directive_stress.py`
  - **Done when**: `pytest tests/test_directive_stress.py -v` passes all tests
  - **Verify**: `python -m pytest tests/test_directive_stress.py -v`
  - **Commit**: `test(directive): add stress tests for high volume and concurrency`
  - _Requirements: FR-4_
  - _Design: TestHighVolume, TestLongRunning, TestConcurrentAccess, TestErrorRecovery_

- [x] 1.5 Create API contract tests
  - **Do**: Create `tests/test_directive_contracts.py` with 4 test classes (13 tests total)
  - **Files**: `tests/test_directive_contracts.py`
  - **Done when**: `pytest tests/test_directive_contracts.py -v` passes all tests
  - **Verify**: `python -m pytest tests/test_directive_contracts.py -v`
  - **Commit**: `test(directive): add API contract tests for WordPress integration`
  - _Requirements: FR-5_
  - _Design: TestGetDirectivesContract, TestMarkDirectiveProcessedContract, TestPostDirectiveResponseContract, TestSubstrateCacheContract_

- [x] 1.6 POC Checkpoint
  - **Do**: Run all directive tests and verify total count
  - **Done when**: All directive tests pass, count >= 107
  - **Verify**: `python -m pytest tests/test_directive*.py -v --tb=short`
  - **Commit**: `test(directive): comprehensive testing suite complete`

## Phase 2: Refactoring

After POC validated, clean up code.

- [ ] 2.1 Extract common fixtures
  - **Do**: Create `conftest.py` with shared `agent` and `mock_substrate_map` fixtures
  - **Files**: `tests/conftest.py`
  - **Done when**: All test files use shared fixtures
  - **Verify**: `python -m pytest tests/test_directive*.py -v`
  - **Commit**: `refactor(tests): extract common fixtures to conftest.py`
  - _Design: Architecture_

## Phase 3: Testing

- [ ] 3.1 Run full test suite with coverage
  - **Do**: Run pytest with coverage report
  - **Files**: `tests/test_directive*.py`
  - **Done when**: Coverage > 80% for directive_agent.py
  - **Verify**: `python -m pytest tests/test_directive*.py --cov=systems.intelligence.directive_agent --cov-report=term-missing`
  - **Commit**: (no commit needed, verification only)
  - _Requirements: NFR-2_

- [ ] 3.2 Generate test summary report
  - **Do**: Document test counts, pass rate, coverage percentage
  - **Files**: `specs/directive-testing-suite/.progress.md`
  - **Done when**: Report includes: total tests, pass rate, coverage, performance benchmarks
  - **Verify**: Manual review of report
  - **Commit**: `docs(test): add test suite summary report`

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all quality checks locally
  - **Verify**: Type check, lint, all directive tests pass
  - **Done when**: All commands pass
  - **Commit**: `fix(directive): address lint/type issues` (if needed)

- [ ] 4.2 Verify test isolation
  - **Do**: Confirm no external dependencies, tests can run offline
  - **Verify**: Disconnect network, run `python -m pytest tests/test_directive*.py -v`
  - **Done when**: All tests pass without network
  - **Commit**: (no commit needed)

## Notes

- **POC shortcuts taken**: No fixture optimization, inline fixture definitions
- **Production TODOs**: Consider pytest-xdist for parallel execution
- **Test count targets**: Edge cases (14) + Performance (7) + Stress (7) + Contracts (13) = 41 new tests. Existing: 63. Total: 104+
