---
spec: agent-production-suite
phase: tasks
total_tasks: 12
created: 2026-02-21T21:23:00Z
generated: auto
---

# Tasks: Agent Production Suite

## Phase 1: Make It Work (POC)

Focus: Get RtsWatcherAgent enhanced with core features, create control script.

- [x] 1.1 Enhance RtsWatcherAgent with heartbeat support
  - **Do**: Add heartbeat_path, _start_time, _files_ingested attributes. Implement write_heartbeat() method matching DirectiveAgent format.
  - **Files**: `systems/intelligence/rts_watcher_agent.py`
  - **Done when**: Agent writes heartbeat JSON with timestamp, pid, uptime_seconds, files_ingested
  - **Verify**: `python3 -c "from systems.intelligence.rts_watcher_agent import RtsWatcherAgent; a=RtsWatcherAgent(); a.write_heartbeat()" && cat .geometry/rts_watcher_heartbeat.json`
  - **Commit**: `feat(rts-watcher): add heartbeat support`
  - _Requirements: FR-1_
  - _Design: Component 1_

- [x] 1.2 Add CLI argument parsing to RtsWatcherAgent
  - **Do**: Add argparse with --wp-url, --watch-dir, --poll-interval, --heartbeat, --once, --version flags. Add main() entry point.
  - **Files**: `systems/intelligence/rts_watcher_agent.py`
  - **Done when**: `python3 rts_watcher_agent.py --help` shows all options
  - **Verify**: `python3 systems/intelligence/rts_watcher_agent.py --help | grep -E "(--wp-url|--watch-dir|--poll-interval|--once)"`
  - **Commit**: `feat(rts-watcher): add CLI argument parsing`
  - _Requirements: FR-2, FR-3, FR-4, FR-5, FR-6_
  - _Design: Component 1_

- [x] 1.3 Add run_forever mode to RtsWatcherAgent
  - **Do**: Implement run_forever() method with poll loop. Implement process_one_cycle() method. Handle SIGTERM gracefully.
  - **Files**: `systems/intelligence/rts_watcher_agent.py`
  - **Done when**: Agent runs continuously with --once flag to run single cycle
  - **Verify**: `timeout 5 python3 systems/intelligence/rts_watcher_agent.py --once --watch-dir /tmp 2>&1 | head -5`
  - **Commit**: `feat(rts-watcher): add run_forever and process_one_cycle`
  - _Requirements: FR-1_
  - _Design: Component 1_

- [ ] 1.4 Create rts_watcher_ctl.sh control script
  - **Do**: Create bash script with start/stop/status/tail/scan commands following directive_ctl.sh pattern exactly.
  - **Files**: `systems/intelligence/rts_watcher_ctl.sh`
  - **Done when**: All commands work (start, stop, status, tail, scan, restart)
  - **Verify**: `bash systems/intelligence/rts_watcher_ctl.sh help`
  - **Commit**: `feat(rts-watcher): add control script`
  - _Requirements: FR-7_
  - _Design: Component 2_

- [ ] 1.5 POC Checkpoint
  - **Do**: Verify RtsWatcherAgent works end-to-end with control script
  - **Done when**: Can start agent, check status, stop agent via control script
  - **Verify**: `cd systems/intelligence && ./rts_watcher_ctl.sh start && sleep 3 && ./rts_watcher_ctl.sh status && ./rts_watcher_ctl.sh stop`
  - **Commit**: `feat(rts-watcher): complete POC`

## Phase 2: Refactoring

- [ ] 2.1 Improve error handling in RtsWatcherAgent
  - **Do**: Add try/except around API calls, file operations. Log errors with proper severity. Continue on errors.
  - **Files**: `systems/intelligence/rts_watcher_agent.py`
  - **Done when**: Agent does not crash on missing files or API failures
  - **Verify**: `python3 systems/intelligence/rts_watcher_agent.py --once --watch-dir /nonexistent 2>&1 | grep -i "error\|warning"`
  - **Commit**: `refactor(rts-watcher): improve error handling`
  - _Design: Error Handling_

- [ ] 2.2 Create agent_status.sh unified dashboard
  - **Do**: Create bash script that reads both heartbeat files, displays status for DirectiveAgent and RtsWatcherAgent with color coding.
  - **Files**: `systems/intelligence/agent_status.sh`
  - **Done when**: Script shows both agents with running/stopped status, uptime, metrics
  - **Verify**: `bash systems/intelligence/agent_status.sh`
  - **Commit**: `feat(agents): add unified status dashboard`
  - _Requirements: FR-8_
  - _Design: Component 3_

## Phase 3: Testing

- [ ] 3.1 Unit tests for RtsWatcherAgent heartbeat
  - **Do**: Create test_rts_watcher_agent.py with TestHeartbeatSupport class. Test file creation, field presence, updates.
  - **Files**: `tests/test_rts_watcher_agent.py`
  - **Done when**: Tests cover write_heartbeat, heartbeat on cycle, uptime tracking
  - **Verify**: `python3 -m pytest tests/test_rts_watcher_agent.py::TestHeartbeatSupport -v`
  - **Commit**: `test(rts-watcher): add heartbeat tests`
  - _Requirements: AC-4.1_

- [ ] 3.2 Unit tests for RtsWatcherAgent scanning
  - **Do**: Add tests for scan_directory, ingest_file, process_one_cycle. Mock WordPress API calls.
  - **Files**: `tests/test_rts_watcher_agent.py`
  - **Done when**: Tests cover file discovery, meta parsing, API ingestion, error cases
  - **Verify**: `python3 -m pytest tests/test_rts_watcher_agent.py::TestScanning -v`
  - **Commit**: `test(rts-watcher): add scanning tests`
  - _Requirements: AC-4.2_

- [ ] 3.3 Unit tests for RtsWatcherAgent CLI
  - **Do**: Add tests for CLI argument parsing, main() entry point, --once mode.
  - **Files**: `tests/test_rts_watcher_agent.py`
  - **Done when**: Tests cover all CLI flags, help output, version flag
  - **Verify**: `python3 -m pytest tests/test_rts_watcher_agent.py::TestCLI -v`
  - **Commit**: `test(rts-watcher): add CLI tests`
  - _Requirements: AC-4.3_

- [ ] 3.4 Integration tests for control scripts
  - **Do**: Create test_control_scripts.py testing start/stop/status flow for both agents. Use subprocess to run scripts.
  - **Files**: `tests/test_control_scripts.py`
  - **Done when**: Tests verify control scripts can start/stop agents and report status
  - **Verify**: `python3 -m pytest tests/test_control_scripts.py -v`
  - **Commit**: `test(agents): add control script integration tests`
  - _Requirements: AC-5.3, AC-5.4_

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all tests, check coverage, verify lint passes
  - **Verify**: `python3 -m pytest tests/test_rts_watcher_agent.py tests/test_control_scripts.py -v --cov=systems.intelligence.rts_watcher_agent --cov-report=term-missing`
  - **Done when**: All tests pass, coverage > 80%
  - **Commit**: `fix(agents): address test failures` (if needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: Processed files tracked in memory only (lost on restart)
- **Production TODOs**: Consider persistent tracking of processed files in future
- **Test count target**: 30+ tests for RtsWatcherAgent (mirrors DirectiveAgent's 115)
