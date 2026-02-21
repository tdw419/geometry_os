---
spec: directive-control-surface
phase: tasks
total_tasks: 14
created: 2026-02-21T12:00:00Z
generated: auto
---

# Tasks: Directive Control Surface

## Phase 1: Make It Work (POC)

Focus: Add heartbeat support and CLI arguments to DirectiveAgent.

- [ ] 1.1 Add heartbeat support to DirectiveAgent
  - **Do**: Add `heartbeat_path` param to `__init__`, add `write_heartbeat()` method, add counter tracking
  - **Files**: `systems/intelligence/directive_agent.py`
  - **Done when**: Heartbeat file written with timestamp, pid, running, directives_processed
  - **Verify**: `python -m pytest tests/test_directive_agent.py::TestHeartbeatSupport -v`
  - **Commit**: `feat(directive): add heartbeat support for daemon monitoring`
  - _Requirements: FR-1, FR-2, FR-3_
  - _Design: DirectiveAgent (Modified)_

- [ ] 1.2 Add CLI arguments for daemon mode
  - **Do**: Add argparse with --wp-url, --poll-interval, --substrate-map, --heartbeat, --once, --version flags
  - **Files**: `systems/intelligence/directive_agent.py`
  - **Done when**: `--help` shows all options, `--version` works, `--once` exits after one cycle
  - **Verify**: `python -m pytest tests/test_directive_agent.py::TestCLIInterface -v`
  - **Commit**: `feat(directive): add CLI arguments for daemon control`
  - _Requirements: FR-4, FR-5, FR-6_
  - _Design: DirectiveAgent (Modified)_

- [ ] 1.3 Create directive_ctl.sh control script
  - **Do**: Create bash script with start/stop/status/tail/process/restart commands following evolution_ctl.sh pattern
  - **Files**: `systems/intelligence/directive_ctl.sh`
  - **Done when**: All commands execute, help text displayed
  - **Verify**: `chmod +x systems/intelligence/directive_ctl.sh && ./systems/intelligence/directive_ctl.sh help`
  - **Commit**: `feat(directive): add directive_ctl.sh control script`
  - _Requirements: FR-7, FR-8, FR-9_
  - _Design: directive_ctl.sh (New)_

- [ ] 1.4 POC Checkpoint
  - **Do**: Verify full daemon lifecycle works
  - **Done when**: Start -> Status shows RUNNING -> Stop -> Status shows STOPPED
  - **Verify**: `./systems/intelligence/directive_ctl.sh start && ./systems/intelligence/directive_ctl.sh status && ./systems/intelligence/directive_ctl.sh stop`
  - **Commit**: `feat(directive): complete POC control surface`

## Phase 2: Testing

- [ ] 2.1 Add heartbeat unit tests
  - **Do**: Create TestHeartbeatSupport class with tests for file creation, required fields, cycle updates
  - **Files**: `tests/test_directive_agent.py`
  - **Done when**: 3 tests pass covering heartbeat functionality
  - **Verify**: `python -m pytest tests/test_directive_agent.py::TestHeartbeatSupport -v`
  - **Commit**: `test(directive): add heartbeat unit tests`
  - _Requirements: AC-2.1, AC-2.2, AC-2.3_

- [ ] 2.2 Add CLI unit tests
  - **Do**: Create TestCLIInterface class with tests for --help and --version
  - **Files**: `tests/test_directive_agent.py`
  - **Done when**: 2 tests pass covering CLI functionality
  - **Verify**: `python -m pytest tests/test_directive_agent.py::TestCLIInterface -v`
  - **Commit**: `test(directive): add CLI unit tests`
  - _Requirements: AC-4.1, AC-4.2_

- [ ] 2.3 Create control script integration tests
  - **Do**: Create bash test script testing help, status when stopped, process once, executable check
  - **Files**: `tests/test_directive_ctl.sh`
  - **Done when**: 4 tests pass covering control script
  - **Verify**: `bash tests/test_directive_ctl.sh`
  - **Commit**: `test(directive): add control script integration tests`
  - _Requirements: AC-1.1, AC-2.1, AC-4.1_

## Phase 3: Documentation

- [ ] 3.1 Update command-console README
  - **Do**: Add usage documentation for directive_ctl.sh with quick start examples
  - **Files**: `specs/command-console/README.md`
  - **Done when**: README shows start/stop/status/tail/process commands
  - **Verify**: README contains `directive_ctl.sh` reference
  - **Commit**: `docs(command-console): add directive agent usage documentation`
  - _Requirements: All US_

## Phase 4: Quality Gates

- [ ] 4.1 Run all DirectiveAgent tests
  - **Do**: Execute full test suite for directive agent
  - **Verify**: `python -m pytest tests/test_directive_agent.py -v`
  - **Done when**: All tests pass (existing + new)
  - **Commit**: `fix(directive): address test issues` (if needed)

- [ ] 4.2 Run control script tests
  - **Do**: Execute bash integration tests
  - **Verify**: `bash tests/test_directive_ctl.sh`
  - **Done when**: All 4 tests pass

- [ ] 4.3 Full daemon lifecycle verification
  - **Do**: Test complete start -> status -> stop cycle
  - **Verify**: Manual verification of daemon lifecycle
  - **Done when**: Start shows RUNNING, Stop shows STOPPED

- [ ] 4.4 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: None - pattern reuse is production-ready
- **Production TODOs**: Consider systemd service file for auto-restart
