---
spec: directive-control-surface
phase: tasks
created: 2026-02-21T17:00:00Z
---

# Tasks: Directive Control Surface

## Overview

**Total Tasks:** 14
**Phases:** 4 (POC, Testing, Docs, Quality)

## Phase 1: POC - Core Functionality

### Task 1.1: Add heartbeat support to DirectiveAgent
**Type:** IMPLEMENT
**Priority:** High
**Status:** DONE
**Files:**
- Modify: `systems/intelligence/directive_agent.py`
- Modify: `tests/test_directive_agent.py`

**Steps:**
1. Add `heartbeat_path` parameter to `__init__`
2. Add `_directives_processed` and `_start_time` instance variables
3. Implement `write_heartbeat()` method
4. Call `write_heartbeat()` after each `process_one_cycle()`
5. Write tests for heartbeat creation and content

**Verification:**
```bash
python -m pytest tests/test_directive_agent.py::TestHeartbeatSupport -v
```

---

### Task 1.2: [VERIFY] Heartbeat tests pass
**Type:** VERIFY
**Depends on:** Task 1.1
**Status:** DONE

**Steps:**
1. Run heartbeat tests
2. Confirm all 3 tests pass
3. Check heartbeat file structure

**Expected Output:**
```
tests/test_directive_agent.py::TestHeartbeatSupport::test_write_heartbeat_creates_file PASSED
tests/test_directive_agent.py::TestHeartbeatSupport::test_heartbeat_contains_required_fields PASSED
tests/test_directive_agent.py::TestHeartbeatSupport::test_heartbeat_updates_on_cycle PASSED
```

---

### Task 1.3: Add CLI arguments to DirectiveAgent
**Type:** IMPLEMENT
**Priority:** High
**Depends on:** Task 1.2
**Status:** DONE
**Files:**
- Modify: `systems/intelligence/directive_agent.py`

**Steps:**
1. Add `import argparse` and `import sys`
2. Create `main()` function with argparse
3. Add `--wp-url`, `--poll-interval`, `--heartbeat`, `--substrate-map`, `--once`, `--version` arguments
4. Wire arguments to DirectiveAgent constructor
5. Handle `--once` mode

**Verification:**
```bash
python -m systems.intelligence.directive_agent --help
python -m systems.intelligence.directive_agent --version
```

---

### Task 1.4: Write CLI tests
**Type:** IMPLEMENT
**Priority:** High
**Depends on:** Task 1.3
**Status:** DONE
**Files:**
- Modify: `tests/test_directive_agent.py`

**Steps:**
1. Add `TestCLIInterface` class
2. Test `--help` shows expected options
3. Test `--version` shows version info

**Verification:**
```bash
python -m pytest tests/test_directive_agent.py::TestCLIInterface -v
```

---

### Task 1.5: [VERIFY] CLI tests pass
**Type:** VERIFY
**Depends on:** Task 1.4
**Status:** DONE

**Steps:**
1. Run CLI tests
2. Confirm all tests pass

---

### Task 1.6: Create directive_ctl.sh control script
**Type:** IMPLEMENT
**Priority:** High
**Depends on:** Task 1.5
**Files:**
- Create: `systems/intelligence/directive_ctl.sh`

**Steps:**
1. Copy pattern from `evolution_ctl.sh`
2. Replace daemon name and paths
3. Add `cmd_process()` function
4. Remove `cmd_dry_run()`, `cmd_report()`, `cmd_target()`
5. Make executable with `chmod +x`

**Verification:**
```bash
./systems/intelligence/directive_ctl.sh help
./systems/intelligence/directive_ctl.sh status
```

---

### Task 1.7: [VERIFY] Control script works
**Type:** VERIFY
**Depends on:** Task 1.6

**Steps:**
1. Test help command shows all options
2. Test status shows STOPPED when not running
3. Test process command runs one cycle

---

## Phase 2: Testing

### Task 2.1: Create control script integration tests
**Type:** IMPLEMENT
**Priority:** Medium
**Depends on:** Task 1.7
**Files:**
- Create: `tests/test_directive_ctl.sh`

**Steps:**
1. Create bash test script
2. Test `test_executable` - script is executable
3. Test `test_help_command` - help shows expected options
4. Test `test_status_when_stopped` - status shows STOPPED
5. Test `test_process_once` - process command works

**Verification:**
```bash
bash tests/test_directive_ctl.sh
```

---

### Task 2.2: [VERIFY] Integration tests pass
**Type:** VERIFY
**Depends on:** Task 2.1

**Steps:**
1. Run bash test script
2. Confirm all 4 tests pass

---

## Phase 3: Documentation

### Task 3.1: Update Command Console README
**Type:** IMPLEMENT
**Priority:** Medium
**Depends on:** Task 2.2
**Files:**
- Create: `specs/command-console/README.md`

**Steps:**
1. Add Quick Start section with control commands
2. Add How It Works section (5-step flow)
3. Add Scope section (Phase 3 limitations)
4. Add Configuration section (environment variables)
5. Add Files table

**Verification:**
```bash
cat specs/command-console/README.md
```

---

### Task 3.2: [VERIFY] Documentation complete
**Type:** VERIFY
**Depends on:** Task 3.1

**Steps:**
1. Verify README contains all sections
2. Verify commands match actual script

---

## Phase 4: Quality Gate

### Task 4.1: Run full test suite
**Type:** VERIFY
**Priority:** High
**Depends on:** Task 3.2

**Steps:**
1. Run all DirectiveAgent unit tests
2. Run control script integration tests
3. Verify total test count

**Expected:**
- 5+ new heartbeat/CLI tests
- 4 integration tests
- All existing tests still pass

**Commands:**
```bash
python -m pytest tests/test_directive_agent.py -v
bash tests/test_directive_ctl.sh
```

---

### Task 4.2: Test daemon lifecycle
**Type:** VERIFY
**Priority:** High
**Depends on:** Task 4.1

**Steps:**
1. Start daemon: `./directive_ctl.sh start`
2. Check status: `./directive_ctl.sh status` (should show RUNNING)
3. Stop daemon: `./directive_ctl.sh stop`
4. Check status: `./directive_ctl.sh status` (should show STOPPED)

---

### Task 4.3: Final commit
**Type:** IMPLEMENT
**Priority:** Medium
**Depends on:** Task 4.2

**Steps:**
1. Review all changes
2. Stage files
3. Commit with message: `feat(directive): add control surface with heartbeat and CLI`

---

## Task Summary

| Phase | Tasks | Type |
|-------|-------|------|
| POC | 1.1-1.7 | Core functionality |
| Testing | 2.1-2.2 | Integration tests |
| Docs | 3.1-3.2 | README documentation |
| Quality | 4.1-4.3 | Final verification |

**Dependencies:**
- 1.1 → 1.2 → 1.3 → 1.4 → 1.5 → 1.6 → 1.7
- 1.7 → 2.1 → 2.2
- 2.2 → 3.1 → 3.2
- 3.2 → 4.1 → 4.2 → 4.3
