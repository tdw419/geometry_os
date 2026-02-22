# Tasks: ctrm-tms-wordpress

## Phase 1: POC (12 tasks)

### Task 1.1: Create CPT mu-plugin for truth_entry and ansmo_cycle
- [x] Done (commit: ebca856b)

### Task 1.2: Add logTruth action case to ai-publisher.php dispatcher
- [x] Done (commit: baf06c9a)

### Task 1.3: Implement handle_log_truth() handler function
- [x] Done (commit: 256259e6)

### Task 1.4: Add syncTruths action case to dispatcher
- [x] Done (commit: 6819d43e)

### Task 1.5: Implement handle_sync_truths() handler function
- [x] Done (verified: function exists, synced_count present)

### Task 1.6: Add getTruthStats action case to dispatcher
- [x] Done (commit: f1c4383b)

### Task 1.7: Implement handle_get_truth_stats() handler function
- [x] Done (verified: system_health present)

### Task 1.8: Add logAnsmoCycle action case and handler
- [x] Done (commit: 1c60bcee)

### Task 1.9: Update handle_list_tools for discovery
- [x] Done (commit: c07c6c07)

### Task 1.10: PHP syntax check [VERIFY]
- [x] Done (commit: ed94a3ee) - Both files pass php -l

### Task 1.11: Update WordPress Memory Provider for TMS connection
- [x] Done (commit: c7a9f63d)

### Task 1.12: Update publish_to_wp.py with CTRM/TMS support
- [x] Done (verified: publish_truth, publish_ansmo_cycle, sync_ctrm_truths exist)

## Phase 2: Refactoring (3 tasks)

### Task 2.1: Add error handling to CTRM handlers
- [ ] Add try-catch blocks
- [ ] Return proper error responses

### Task 2.2: Add input validation utilities
- [x] Create shared validation functions
- [x] Apply to all CTRM handlers

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
- [ ] All Python files pass

### Task 4.3: Run full test suite
- [ ] All tests pass

## Phase 5: PR Lifecycle (2 tasks)

### Task 5.1: Create pull request
- [ ] Push feature branch
- [ ] Create PR with summary

### Task 5.2: Merge after CI green
- [ ] Monitor CI status
- [ ] Merge when approved
