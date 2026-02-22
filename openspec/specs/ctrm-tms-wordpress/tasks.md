---
spec: ctrm-tms-wordpress
phase: tasks
total_tasks: 24
created: 2026-02-21T22:45:00Z
---

# Implementation Tasks: CTRM/TMS WordPress Integration

## Execution Context

- **Testing depth:** Standard - unit + integration tests, TDD approach
- **Deployment approach:** Standard CI/CD pipeline (direct commit to main)
- **Execution priority:** Balanced - reasonable quality with speed
- **TDD approach:** Tests written before implementation per requirements

## Phase 1: Make It Work (POC)

Focus: Validate the idea works end-to-end. Skip tests initially, add after core functionality.

### Task 1.1: Create CPT mu-plugin for truth_entry and ansmo_cycle

**Do:**
- [x] Create `mu-plugins/ctrm-truth-cpt.php`
- [x] Register `truth_entry` CPT with public=true, has_archive=true, show_in_rest=true
- [x] Register `ansmo_cycle` CPT with public=true, has_archive=true, show_in_rest=true
- [x] Both CPTs support: title, editor, custom-fields

**Files:**
- Create: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/mu-plugins/ctrm-truth-cpt.php`

**Done when:**
PHP file exists with both CPTs registered following existing `geometry_os_bridge.php` pattern

**Verify:**
```bash
grep -c "register_post_type.*truth_entry" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/mu-plugins/ctrm-truth-cpt.php && grep -c "register_post_type.*ansmo_cycle" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/mu-plugins/ctrm-truth-cpt.php
# Expected: 1 and 1 (both found)
```

**Commit:** `feat(ctrm): add truth_entry and ansmo_cycle custom post types`

**_Requirements:** FR-5
**_Design:** CPT registration via mu-plugin

---

### Task 1.2: Add logTruth action case to ai-publisher.php dispatcher

**Do:**
- [ ] Add `case 'logTruth':` to switch statement in ai-publisher.php
- [ ] Wire to `handle_log_truth($args)` handler

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php` (add case around line 136)

**Done when:**
Dispatcher routes logTruth action to handler

**Verify:**
```bash
grep -c "case 'logTruth':" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: 1
```

**Commit:** `feat(ctrm): add logTruth dispatcher case`

**_Requirements:** FR-1, US-1
**_Design:** Action dispatch pattern

---

### Task 1.3: Implement handle_log_truth PHP handler

**Do:**
- [ ] Create `handle_log_truth($data)` function
- [ ] Validate required `claim` field (400 error if missing)
- [ ] Auto-generate truth_id (UUID) if not provided
- [ ] Calculate transparency_score = min(1.0, len(reasoning_path) / 10)
- [ ] Create truth_entry post with title, content
- [ ] Store meta: truth_id, confidence, transparency_score, evidence
- [ ] Call notify_visual_bridge('TRUTH_LOGGED', ...)
- [ ] Return JSON: success, post_id, truth_id, url, transparency_score

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php` (add function after line 1100)

**Done when:**
logTruth action creates truth_entry post with correct meta and returns expected JSON

**Verify:**
```bash
grep -c "function handle_log_truth" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && grep -c "TRUTH_LOGGED" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: 1 and 1
```

**Commit:** `feat(ctrm): implement handle_log_truth handler`

**_Requirements:** FR-1, AC-1.1 to AC-1.5
**_Design:** PHP: handle_log_truth interface

---

### Task 1.4: Add syncTruths and getTruthStats action cases

**Do:**
- [ ] Add `case 'syncTruths':` to switch statement
- [ ] Add `case 'getTruthStats':` to switch statement
- [ ] Wire to respective handlers

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php`

**Done when:**
Dispatcher routes both actions to handlers

**Verify:**
```bash
grep -c "case 'syncTruths':" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && grep -c "case 'getTruthStats':" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: 1 and 1
```

**Commit:** `feat(ctrm): add syncTruths and getTruthStats dispatcher cases`

**_Requirements:** FR-2, FR-3, US-2, US-3
**_Design:** Action dispatch pattern

---

### Task 1.5: Implement handle_sync_truths PHP handler

**Do:**
- [ ] Create `handle_sync_truths($data)` function
- [ ] Validate `truths` array presence (400 error if missing)
- [ ] Limit to 100 truths per request
- [ ] For each truth: check existing by truth_id meta
- [ ] Use wp_update_post for existing, wp_insert_post for new
- [ ] Return JSON: success, synced_count, skipped_count, results array

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php`

**Done when:**
syncTruths processes bulk truths with deduplication

**Verify:**
```bash
grep -c "function handle_sync_truths" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && grep -c "synced_count" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: 1 and >= 1
```

**Commit:** `feat(ctrm): implement handle_sync_truths handler`

**_Requirements:** FR-2, AC-2.1 to AC-2.4
**_Design:** PHP: handle_sync_truths interface

---

### Task 1.6: Implement handle_get_truth_stats PHP handler

**Do:**
- [ ] Create `handle_get_truth_stats()` function
- [ ] Query all truth_entry posts
- [ ] Calculate avg_confidence from post meta
- [ ] Calculate avg_transparency from post meta
- [ ] Get 5 most recent truths with id, title, confidence, date
- [ ] Calculate system_health = (avg_confidence * 0.6 + avg_transparency * 0.4)
- [ ] Return JSON with all aggregate fields

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php`

**Done when:**
getTruthStats returns aggregate statistics

**Verify:**
```bash
grep -c "function handle_get_truth_stats" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && grep -c "system_health" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: 1 and >= 1
```

**Commit:** `feat(ctrm): implement handle_get_truth_stats handler`

**_Requirements:** FR-3, AC-3.1 to AC-3.5
**_Design:** PHP: handle_get_truth_stats interface

---

### Task 1.7: Add logAnsmoCycle action case and handler

**Do:**
- [ ] Add `case 'logAnsmoCycle':` to switch statement
- [ ] Create `handle_log_ansmo_cycle($data)` function
- [ ] Validate phase (introspection|synthesis|optimization)
- [ ] Create ansmo_cycle post type
- [ ] Store meta: cycle_id, phase, improvement_delta
- [ ] JSON encode input_state/output_state in content
- [ ] Call notify_visual_bridge('ANSMO_CYCLE', ...)
- [ ] Return JSON: success, post_id, cycle_id, url

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php`

**Done when:**
logAnsmoCycle creates ansmo_cycle post with correct meta

**Verify:**
```bash
grep -c "function handle_log_ansmo_cycle" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && grep -c "ANSMO_CYCLE" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: 1 and 1
```

**Commit:** `feat(tms): implement logAnsmoCycle handler`

**_Requirements:** FR-4, AC-4.1 to AC-4.5
**_Design:** PHP: handle_log_ansmo_cycle interface

---

### Task 1.8: Update handle_list_tools for CTRM/TMS discovery

**Do:**
- [ ] Update `handle_list_tools()` function
- [ ] Add new tools: logTruth, syncTruths, getTruthStats, logAnsmoCycle
- [ ] Add categories grouping: ctrm, tms, evolution, etc.
- [ ] Return categorized tool list

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php` (around line 287)

**Done when:**
/tools endpoint returns all CTRM/TMS actions with categories

**Verify:**
```bash
grep -c "'logTruth'" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && grep -c "'ctrm'" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: >= 1 and >= 1
```

**Commit:** `feat(discovery): update tool list with CTRM/TMS actions`

**_Requirements:** FR-8, AC-6.1 to AC-6.4
**_Design:** Tool Discovery Update

---

### Task 1.9: [VERIFY] Quality checkpoint: PHP syntax check

**Do:**
- [ ] Run PHP syntax check on modified files
- [ ] Verify no parse errors

**Verify:**
```bash
php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/mu-plugins/ctrm-truth-cpt.php
# Expected: "No syntax errors detected" for both
```

**Done when:**
Both PHP files pass syntax validation

**Commit:** (only if fixes needed) `fix(ctrm): resolve PHP syntax errors`

---

### Task 1.10: Add TMS connection to WordPressMemoryProvider

**Do:**
- [ ] Add `tms_url` parameter to `__init__` (default: http://localhost:8000)
- [ ] Create `get_posts_from_wp(post_types, limit)` method
- [ ] Create `send_to_tms(post)` method - POST to TMS /api/truths/add
- [ ] Create `sync_to_tms(post_types)` orchestration method
- [ ] Create `get_truth_stats()` method calling WordPress API

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress_memory_provider.py`

**Done when:**
WordPressMemoryProvider can sync posts to TMS and get truth stats

**Verify:**
```bash
grep -c "def sync_to_tms" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress_memory_provider.py && grep -c "tms_url" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress_memory_provider.py
# Expected: 1 and >= 1
```

**Commit:** `feat(integration): add TMS connection to WordPressMemoryProvider`

**_Requirements:** FR-6, AC-5.1 to AC-5.4
**_Design:** Python: WordPressMemoryProvider Extensions

---

### Task 1.11: Add CTRM helpers to publish_to_wp.py

**Do:**
- [ ] Create `publish_truth(claim, evidence, confidence, reasoning_path)` function
- [ ] Create `publish_ansmo_cycle(phase, input_state, output_state, improvement_delta)` function
- [ ] Create `sync_ctrm_truths(truths)` function
- [ ] All functions call ai-publisher.php and send visual pulse on success

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/publish_to_wp.py`

**Done when:**
Python helpers exist for all CTRM/TMS publishing operations

**Verify:**
```bash
grep -c "def publish_truth" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/publish_to_wp.py && grep -c "def publish_ansmo_cycle" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/publish_to_wp.py && grep -c "def sync_ctrm_truths" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/publish_to_wp.py
# Expected: 1, 1, 1
```

**Commit:** `feat(ctrm): add Python helper functions for CTRM/TMS publishing`

**_Requirements:** FR-7, AC-7.1 to AC-7.4
**_Design:** Python: publish_to_wp.py Extensions

---

### Task 1.12: [VERIFY] POC Checkpoint - Manual API validation

**Do:**
- [ ] Test logTruth via curl
- [ ] Test getTruthStats via curl
- [ ] Verify truth_entry post created in WordPress

**Verify:**
```bash
curl -s -X POST http://localhost:8080/ai-publisher.php -H "Content-Type: application/json" -d '{"action":"logTruth","claim":"POC test truth","evidence":"Manual test","confidence":0.9}' | jq -r '.success'
# Expected: "true"
```

**Done when:**
logTruth returns success and creates WordPress post

**Commit:** `feat(ctrm): complete POC implementation`

---

## Phase 2: Refactoring

### Task 2.1: Add error handling to PHP handlers

**Do:**
- [ ] Add try/catch patterns to all new handlers
- [ ] Ensure consistent error response format
- [ ] Add proper HTTP status codes (400, 500)

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php`

**Done when:**
All handlers return consistent error responses

**Verify:**
```bash
grep -c "is_wp_error" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php
# Expected: >= 5 (all new handlers check for errors)
```

**Commit:** `refactor(ctrm): add consistent error handling`

**_Design:** Error Handling section

---

### Task 2.2: Add input validation to Python helpers

**Do:**
- [ ] Add type hints to all Python helper functions
- [ ] Add confidence range validation (0.0-1.0)
- [ ] Add phase validation for ANSMO (introspection|synthesis|optimization)

**Files:**
- Modify: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/publish_to_wp.py`

**Done when:**
Python helpers validate inputs before API calls

**Verify:**
```bash
python3 -c "import sys; sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone'); from publish_to_wp import publish_truth; print('OK')"
# Expected: OK
```

**Commit:** `refactor(ctrm): add input validation to Python helpers`

---

### Task 2.3: [VERIFY] Quality checkpoint: Python syntax and imports

**Do:**
- [ ] Run Python syntax check on modified files
- [ ] Verify all imports resolve

**Verify:**
```bash
python3 -m py_compile /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress_memory_provider.py && python3 -m py_compile /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/publish_to_wp.py && echo "OK"
# Expected: OK
```

**Done when:**
Both Python files compile without errors

**Commit:** (only if fixes needed) `fix(ctrm): resolve Python syntax errors`

---

## Phase 3: Testing

### Task 3.1: Create test_ctrm_tms_api.py for PHP handlers

**Do:**
- [ ] Create test file following test_research_api.py pattern (mock PHP verification)
- [ ] Add tests for logTruth action registration
- [ ] Add tests for syncTruths action registration
- [ ] Add tests for getTruthStats action registration
- [ ] Add tests for logAnsmoCycle action registration
- [ ] Add tests for validation logic (missing fields)
- [ ] Add tests for meta field handling

**Files:**
- Create: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/tests/test_ctrm_tms_api.py`

**Done when:**
Test file exists with 15+ test functions covering all handlers

**Verify:**
```bash
grep -c "def test_" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/tests/test_ctrm_tms_api.py
# Expected: >= 15
```

**Commit:** `test(ctrm): add mock PHP verification tests`

**_Requirements:** NFR-2, AC-1.1 to AC-4.5
**_Design:** Test Strategy section

---

### Task 3.2: Create test_memory_provider_tms.py

**Do:**
- [ ] Create test file for WordPressMemoryProvider TMS methods
- [ ] Mock requests.post for ai-publisher.php calls
- [ ] Mock socket for Memory Daemon
- [ ] Test sync_to_tms method
- [ ] Test send_to_tms method
- [ ] Test get_truth_stats method

**Files:**
- Create: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/tests/test_memory_provider_tms.py`

**Done when:**
Test file covers all new TMS methods with mocked dependencies

**Verify:**
```bash
grep -c "def test_" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/tests/test_memory_provider_tms.py
# Expected: >= 5
```

**Commit:** `test(memory): add TMS sync tests`

**_Requirements:** FR-6, AC-5.1 to AC-5.4
**_Design:** Test Strategy - WordPressMemoryProvider

---

### Task 3.3: Create test_publish_ctrm.py for Python helpers

**Do:**
- [ ] Create test file for publish_to_wp.py CTRM helpers
- [ ] Mock requests.post for ai-publisher.php calls
- [ ] Mock send_visual_pulse function
- [ ] Test publish_truth function
- [ ] Test publish_ansmo_cycle function
- [ ] Test sync_ctrm_truths function

**Files:**
- Create: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/tests/test_publish_ctrm.py`

**Done when:**
Test file covers all CTRM helper functions

**Verify:**
```bash
grep -c "def test_" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/tests/test_publish_ctrm.py
# Expected: >= 5
```

**Commit:** `test(publish): add CTRM helper tests`

**_Requirements:** FR-7, AC-7.1 to AC-7.4
**_Design:** Test Strategy - publish_to_wp.py

---

### Task 3.4: [VERIFY] Run all CTRM/TMS tests

**Do:**
- [ ] Run pytest on all new test files
- [ ] Verify all tests pass

**Verify:**
```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone && python3 tests/test_ctrm_tms_api.py && python3 tests/test_memory_provider_tms.py && python3 tests/test_publish_ctrm.py
# Expected: All show "Results: X passed, 0 failed"
```

**Done when:**
All tests pass with zero failures

**Commit:** (only if fixes needed) `fix(ctrm): resolve test failures`

---

## Phase 4: Quality Gates

### Task 4.1: Local quality check

**Do:**
- [ ] Run PHP syntax check on all modified PHP files
- [ ] Run Python syntax check on all modified Python files
- [ ] Run all test files

**Verify:**
```bash
php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/ai-publisher.php && php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/mu-plugins/ctrm-truth-cpt.php && python3 -m py_compile /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress_memory_provider.py && python3 -m py_compile /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/publish_to_wp.py && echo "ALL CHECKS PASSED"
# Expected: "ALL CHECKS PASSED"
```

**Done when:**
All syntax checks pass

**Commit:** (only if fixes needed) `fix(ctrm): address quality gate issues`

---

### Task 4.2: Verify WordPress endpoint availability

**Do:**
- [ ] Test /ai-publisher.php/tools endpoint
- [ ] Verify all CTRM/TMS tools listed
- [ ] Test each action via curl

**Verify:**
```bash
curl -s http://localhost:8080/ai-publisher.php/tools | jq -r '.tools | index("logTruth") // "MISSING"'
# Expected: a number (index of logTruth in tools array)
```

**Done when:**
Tool discovery returns all new actions

**Commit:** None (verification only)

---

### Task 4.3: Final integration validation

**Do:**
- [ ] Test complete truth logging flow
- [ ] Test ANSMO cycle logging flow
- [ ] Verify Visual Bridge notification (check port 8769)
- [ ] Verify WordPress post created

**Verify:**
```bash
curl -s -X POST http://localhost:8080/ai-publisher.php -H "Content-Type: application/json" -d '{"action":"logTruth","claim":"Final validation truth","evidence":"Integration test","confidence":0.95}' | jq '.success and .post_id and .truth_id and .url'
# Expected: true
```

**Done when:**
End-to-end flow works

**Commit:** `feat(ctrm-tms): complete WordPress integration`

---

## Phase 5: PR Lifecycle

### Task 5.1: Create feature branch and commit all changes

**Do:**
- [ ] Create feature branch: `git checkout -b feat/ctrm-tms-wordpress`
- [ ] Stage all modified files
- [ ] Create final commit with comprehensive message

**Verify:**
```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os && git branch --show-current
# Expected: feat/ctrm-tms-wordpress
```

**Done when:**
All changes committed to feature branch

**Commit:** `feat(ctrm-tms): complete WordPress integration

- Added logTruth, syncTruths, getTruthStats actions
- Added logAnsmoCycle action for TMS
- Created truth_entry and ansmo_cycle custom post types
- Extended WordPressMemoryProvider with TMS connection
- Added CTRM/TMS helper functions to publish_to_wp.py
- Updated tool discovery for MCP compatibility
- Added comprehensive test coverage

Implements Tri-Layer Integration:
- Sensory Layer: WordPress -> TMS
- Cognitive Layer: CTRM -> WordPress
- Visual Layer: Real-time telemetry via Visual Bridge

Closes: ctrm-tms-wordpress spec`

---

### Task 5.2: Verify commit history and push

**Do:**
- [ ] Review commit history
- [ ] Verify all files included
- [ ] Push branch to remote

**Verify:**
```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os && git log --oneline -5
# Expected: Show recent commits with CTRM/TMS changes
```

**Done when:**
Branch pushed to remote

**Commit:** None

---

## Summary

| Phase | Tasks | Focus |
|-------|-------|-------|
| Phase 1: POC | 1.1-1.12 | Core functionality, validate idea |
| Phase 2: Refactor | 2.1-2.3 | Error handling, input validation |
| Phase 3: Testing | 3.1-3.4 | Test files, verify coverage |
| Phase 4: Quality | 4.1-4.3 | Syntax checks, integration validation |
| Phase 5: PR | 5.1-5.2 | Branch, commit, push |

**Total: 24 tasks**

## Unresolved Questions

1. **TMS Backend Availability:** TMS FastAPI at localhost:8000 may not be running - sync_to_tms() includes graceful error handling
2. **Visual Bridge Event Format:** Following existing TRACK_CLAIMED format as template

## Notes

**POC shortcuts taken:**
- Mock PHP tests instead of real WordPress integration tests
- TMS backend may be unavailable - graceful degradation
- Visual Bridge notifications are fire-and-forget (UDP)

**Production TODOs:**
- Add real WordPress integration tests with test database
- Add TMS backend startup check
- Add rate limiting for bulk sync
- Add truth conflict resolution algorithms
