---
spec: desktop-agent-testing
phase: tasks
total_tasks: 8
created: 2026-02-22T00:00:00Z
generated: auto
---

# Tasks: Desktop Agent Testing Suite

## Phase 1: Make It Work (POC)

Focus: Critical safety tests first, then core unit tests.

- [x] 1.1 SafetySanitizer Unit Tests (P0 Critical)
  - **Do**: Create `tests/test_desktop_agent_sanitizer.py` with 25+ tests covering blocked keys, blocked commands, safe operations, case-insensitive blocking
  - **Files**: `tests/test_desktop_agent_sanitizer.py`, `systems/desktop_agent/safety/sanitizer.py`
  - **Done when**: All 25+ tests pass, covering all BLOCKED_KEYS, BLOCKED_COMBOS, BLOCKED_COMMANDS
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent_sanitizer.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add SafetySanitizer unit tests (P0 safety)`
  - _Requirements: FR-1, FR-2, FR-3, FR-4_
  - _Design: test_desktop_agent_sanitizer.py section_

- [x] 1.2 SessionManager Unit Tests
  - **Do**: Create `tests/test_desktop_agent_session.py` with 15+ tests covering creation, retrieval, destruction, stale cleanup, max limit
  - **Files**: `tests/test_desktop_agent_session.py`, `systems/desktop_agent/session_manager.py`
  - **Done when**: All 15+ tests pass with MockBackend
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent_session.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add SessionManager unit tests`
  - _Requirements: FR-5, FR-6, FR-7_
  - _Design: test_desktop_agent_session.py section_

- [x] 1.3 LocalBackend Unit Tests
  - **Do**: Create `tests/test_desktop_agent_backend.py` with 20+ tests mocking xdotool, wmctrl, mss, pyperclip
  - **Files**: `tests/test_desktop_agent_backend.py`, `systems/desktop_agent/backends/local_backend.py`
  - **Done when**: All 20+ tests pass without real X11/display
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent_backend.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add LocalBackend unit tests with mocks`
  - _Requirements: FR-8, FR-9, FR-10, FR-11, FR-12_
  - _Design: test_desktop_agent_backend.py section_

- [x] 1.4 TrackBoardClient Unit Tests
  - **Do**: Create `tests/test_desktop_agent_track.py` with 15+ tests mocking TrackManager, WordPress unavailable fallback
  - **Files**: `tests/test_desktop_agent_track.py`, `systems/desktop_agent/safety/track_client.py`
  - **Done when**: All 15+ tests pass, fallback path tested
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent_track.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add TrackBoardClient unit tests`
  - _Requirements: FR-13, FR-14_
  - _Design: test_desktop_agent_track.py section_

- [ ] 1.5 POC Checkpoint
  - **Do**: Verify all unit tests pass, coverage report generated
  - **Done when**: 75+ tests passing, no real external dependencies
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent_*.py -v --cov=systems/desktop_agent --cov-report=term-missing`
  - **Commit**: `test(desktop-agent): complete POC test suite`

## Phase 2: Integration Tests

- [x] 2.1 DesktopAgentService Integration Tests
  - **Do**: Create `tests/test_desktop_agent_service.py` with 15+ tests for full service flow (connect, screenshot, input, exec, windows)
  - **Files**: `tests/test_desktop_agent_service.py`, `systems/desktop_agent/service.py`
  - **Done when**: All 15+ integration tests pass with MockLocalBackend
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent_service.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add DesktopAgentService integration tests`
  - _Requirements: FR-15, FR-16, FR-17, FR-18_
  - _Design: test_desktop_agent_service.py section_

## Phase 3: Performance Tests

- [x] 3.1 Performance Benchmarks
  - **Do**: Create `tests/test_desktop_agent_performance.py` with 6 benchmarks validating NFR latency targets
  - **Files**: `tests/test_desktop_agent_performance.py`
  - **Done when**: All benchmarks pass, validation < 1ms, session < 10ms
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent_performance.py -v --benchmark-only`
  - **Commit**: `test(desktop-agent): add performance benchmarks for NFR validation`
  - _Requirements: FR-19, FR-20, FR-21_
  - _Design: test_desktop_agent_performance.py section_

## Phase 4: Quality Gates

- [ ] 4.1 Test Coverage Configuration
  - **Do**: Create `tests/conftest_desktop_agent.py` with shared fixtures (mock_backend, mock_track_manager), configure 80% coverage gate
  - **Files**: `tests/conftest_desktop_agent.py`
  - **Done when**: Coverage report shows 80%+ with shared fixtures
  - **Verify**: `PYTHONPATH=. pytest tests/test_desktop_agent*.py --cov=systems/desktop_agent --cov-fail-under=80`
  - **Commit**: `test(desktop-agent): add shared fixtures and coverage config`
  - _Requirements: NFR-1, NFR-3_
  - _Design: Fixtures section_

- [ ] 4.2 Quality Gate Script
  - **Do**: Create `scripts/run_desktop_agent_tests.sh` that runs all tests, generates coverage report, enforces 80% gate
  - **Files**: `scripts/run_desktop_agent_tests.sh`
  - **Done when**: Script runs all 6 test files, fails if coverage < 80% or any test fails
  - **Verify**: `./scripts/run_desktop_agent_tests.sh`
  - **Commit**: `test(desktop-agent): add quality gate test runner script`
  - _Requirements: NFR-4_
  - _Design: File Structure section_

## Notes

- **POC shortcuts**: Using mock backends instead of real X11/display
- **Production TODOs**: Add E2E tests with real display when CI supports it
- **Test count**: ~100 tests across 6 files
- **Coverage target**: 80% overall, 100% for SafetySanitizer
