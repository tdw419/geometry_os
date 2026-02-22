# Tasks: ctrm-tms-wordpress

## Phase 1: POC (12 tasks)

### Task 1.1: Create CPT mu-plugin for truth_entry and ansmo_cycle
- [x] Done

### Task 1.2: Add logTruth action case to ai-publisher.php dispatcher
- [x] Done

### Task 1.3: Implement handle_log_truth() handler function
- [ ] Add handler function after line 1100 in ai-publisher.php
- [ ] Validate required fields: agent, subject, claim, confidence
- [ ] Create truth_entry post with meta fields
- [ ] Return success with post_id

### Task 1.4: Add syncTruths action case to dispatcher
- [ ] Add `case 'syncTruths':` to switch statement
- [ ] Wire to `handle_sync_truths($args)` handler

### Task 1.5: Implement handle_sync_truths() handler function
- [ ] Fetch truths from TMS via HTTP API
- [ ] Bulk create/update truth_entry posts (limit 100)
- [ ] Return sync stats

### Task 1.6: Add getTruthStats action case to dispatcher
- [ ] Add `case 'getTruthStats':` to switch statement
- [ ] Wire to `handle_get_truth_stats()` handler

### Task 1.7: Implement handle_get_truth_stats() handler function
- [ ] Query truth_entry post counts by confidence ranges
- [ ] Calculate transparency_score per FR-1
- [ ] Return stats JSON

### Task 1.8: Add logAnsmoCycle action case to dispatcher
- [ ] Add `case 'logAnsmoCycle':` to switch statement
- [ ] Wire to `handle_log_ansmo_cycle($args)` handler

### Task 1.9: Implement handle_log_ansmo_cycle() handler function
- [ ] Validate required fields: cycle_id, decision_type, reasoning_path
- [ ] Create ansmo_cycle post with meta
- [ ] Notify Visual Bridge

### Task 1.10: Update WordPress Memory Provider for TMS connection
- [ ] Add TMS API client methods to WordPressMemoryProvider class
- [ ] Implement sync_from_tms() method

### Task 1.11: Update publish_to_wp.py with CTRM/TMS support
- [ ] Add CTRM helper functions module
- [ ] Integrate with existing send_visual_pulse()

### Task 1.12: Update handle_list_tools for discovery
- [ ] Add CTRM/TMS tools to tool registry response
- [ ] Include: logTruth, syncTruths, getTruthStats, logAnsmoCycle

## Phase 2: Refactoring (3 tasks)

### Task 2.1: Add error handling to CTRM handlers
- [ ] Add try-catch blocks
- [ ] Return proper error responses

### Task 2.2: Add input validation utilities
- [ ] Create shared validation functions
- [ ] Apply to all CTRM handlers

### Task 2.3: Optimize database queries
- [ ] Add indexes for meta queries
- [ ] Cache frequently accessed data

## Phase 3: Testing (4 tasks)

### Task 3.1: Write unit tests for CTRM handlers
- [ ] Test handle_log_truth validation
- [ ] Test handle_sync_truths bulk operations
- [ ] Test handle_get_truth_stats calculations

### Task 3.2: Write integration tests for TMS sync
- [ ] Test TMS API connectivity
- [ ] Test bulk sync scenarios

### Task 3.3: Write Visual Bridge notification tests
- [ ] Test UDP notification format
- [ ] Test graceful degradation

### Task 3.4: End-to-end test suite
- [ ] Test complete CTRM workflow
- [ ] Verify WordPress post creation

## Phase 4: Quality Gates (3 tasks)

### Task 4.1: Run PHP syntax checks
- [ ] All PHP files pass php -l

### Task 4.2: Run Python type checks
- [ ] All Python files pass mypy

### Task 4.3: Run full test suite
- [ ] All tests pass

## Phase 5: PR Lifecycle (2 tasks)

### Task 5.1: Create pull request
- [ ] Push feature branch
- [ ] Create PR with summary

### Task 5.2: Merge after CI green
- [ ] Monitor CI status
- [ ] Merge when approved
