---
spec: command-console
basePath: specs/command-console
phase: execution
totalTasks: 9
---

# Tasks: Command Console

## Overview

Bidirectional human-AI collaboration via WordPress Directives.

## Task List

### Task 1.1: Extend ai-publisher.php with Directive API Handlers

**Do**:
1. Add `getDirectives` handler - query posts in Directives category where `directive_processed` meta is not set
2. Add `markDirectiveProcessed` handler - set `directive_processed` meta to true
3. Add `postDirectiveResponse` handler - insert comment with agent response
4. Create Directives category if not exists using `wp_insert_term()`

**Files**:
- Modify: `wordpress_zone/wordpress/ai-publisher.php`

**Done when**: All three API handlers return correct JSON responses

**Verify**: `curl -X POST http://localhost:8080/?rest_route=/geometry-os/v1/invoke -H "Content-Type: application/json" -d '{"tool":"getDirectives"}' | jq '.success'`

**Commit**: `feat(wp): add Directive Console API endpoints`

**Status**: [x] COMPLETE

---

### Task 1.2: Create DirectiveAgent Core Class

**Do**:
1. Create `systems/intelligence/directive_agent.py`
2. Implement `DirectiveScope` enum: INFORMATIONAL, RESEARCH, UNKNOWN
3. Implement `DirectiveStatus` enum: COMPLETED, FAILED, OUT_OF_SCOPE, NEEDS_CLARIFICATION
4. Implement `Directive` dataclass with auto-parsing in `__post_init__`
5. Implement `DirectiveAgent` class with:
   - `poll_directives()` - fetch unprocessed directives
   - `parse_directive()` - classify scope/action/target
   - `execute_directive()` - execute based on scope
   - `post_response()` - post comment to WordPress
   - `mark_processed()` - set directive_processed meta
   - `process_one_cycle()` - single poll cycle
   - `run_forever()` - continuous polling loop

**Files**:
- Create: `systems/intelligence/directive_agent.py`

**Done when**: Python syntax valid and DirectiveAgent can be imported

**Verify**: `python3 -c "from systems.intelligence.directive_agent import DirectiveAgent; print('OK')"`

**Commit**: `feat(intelligence): add DirectiveAgent for bidirectional human-AI collaboration`

**Status**: [x] COMPLETE

---

### Task 1.3: [VERIFY] Quality Checkpoint 1

**Do**:
1. Verify Python syntax: `python3 -m py_compile systems/intelligence/directive_agent.py`
2. Verify import works: `python3 -c "from systems.intelligence.directive_agent import DirectiveAgent; print('OK')"`
3. Verify class structure has all required methods

**Files**:
- None (verification only)

**Done when**: All verification commands pass

**Verify**: `python3 -m py_compile systems/intelligence/directive_agent.py && python3 -c "from systems.intelligence.directive_agent import DirectiveAgent; print('OK')"`

**Commit**: N/A (verification only)

**Status**: [x] PASS

---

### Task 1.4: Add Unit Tests for DirectiveAgent

**Do**:
1. Create `tests/test_directive_agent.py` with test classes:
   - `TestDirectiveParsing`: test informational/research/out-of-scope parsing
   - `TestDirectiveExecution`: test execute with mock substrate map
   - `TestDirectiveAPI`: test WordPress API calls with mocked requests
   - `TestComponentLookup`: test exact/partial/empty map lookups

**Files**:
- Create: `tests/test_directive_agent.py`

**Done when**: `python3 -m pytest tests/test_directive_agent.py -v` passes all tests

**Verify**: `python3 -m pytest tests/test_directive_agent.py -v --tb=short | tail -5`

**Commit**: `test(intelligence): add DirectiveAgent unit tests`

**Requirements**: FR-7, US-3, US-4, US-5, US-6
**Design**: Test Strategy section

**Status**: [x] COMPLETE

---

### Task 1.5: Add export_cache to ArchitectAgent

**Do**:
1. Add `export_cache()` method to ArchitectAgent
2. Generate JSON file at `.geometry/substrate_map.json`
3. Include component name, path, description, metadata

**Files**:
- Modify: `systems/intelligence/architect_agent_wp.py`
- Generate: `.geometry/substrate_map.json`

**Done when**: `export_cache()` creates valid JSON file

**Verify**: `python3 -c "from systems.intelligence.architect_agent_wp import ArchitectAgent; a=ArchitectAgent(); a.export_cache(); print(open('.geometry/substrate_map.json').read()[:100])"`

**Commit**: `feat(intelligence): add substrate map cache export to ArchitectAgent`

**Status**: [x] COMPLETE

---

### Task 1.6: Create directive_ctl.sh Control Script

**Do**:
1. Create `systems/intelligence/directive_ctl.sh`
2. Implement `start` command - launch daemon in background with PID file
3. Implement `stop` command - terminate daemon and clean up PID file
4. Implement `status` command - show running state
5. Implement `process-once` command - run single poll cycle
6. Implement `tail` command - follow log file

**Files**:
- Create: `systems/intelligence/directive_ctl.sh`

**Done when**: All control commands work correctly

**Verify**: `./systems/intelligence/directive_ctl.sh status`

**Commit**: `feat(intelligence): add directive agent control script`

**Status**: [ ] PENDING

---

### Task 1.7: Add E2E Integration Tests

**Do**:
1. Create `tests/test_directive_console_e2e.py`
2. Test full lifecycle: create directive -> poll -> execute -> respond -> mark
3. Mock WordPress API responses for all endpoints
4. Verify correct status transitions

**Files**:
- Create: `tests/test_directive_console_e2e.py`

**Done when**: `python3 -m pytest tests/test_directive_console_e2e.py -v` passes

**Verify**: `python3 -m pytest tests/test_directive_console_e2e.py -v --tb=short | tail -5`

**Commit**: `test(intelligence): add Directive Console E2E tests`

**Status**: [ ] PENDING

---

### Task 1.8: [VERIFY] Quality Checkpoint 2

**Do**:
1. Run all unit tests
2. Run all E2E tests
3. Verify no regressions

**Files**:
- None (verification only)

**Done when**: All tests pass

**Verify**: `python3 -m pytest tests/test_directive_agent.py tests/test_directive_console_e2e.py -v --tb=short`

**Commit**: N/A (verification only)

**Status**: [ ] PENDING

---

### Task 1.9: Integration Test with WordPress

**Do**:
1. Create test directive post in WordPress
2. Run directive agent process-once
3. Verify comment posted correctly
4. Verify directive marked as processed

**Files**:
- None (manual integration test)

**Done when**: End-to-end flow works with real WordPress

**Verify**: Manual verification via WordPress admin

**Commit**: N/A (manual test)

**Status**: [ ] PENDING
