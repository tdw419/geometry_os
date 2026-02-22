---
spec: certification-runner
phase: tasks
total_tasks: 7
created: 2026-02-22T00:00:00Z
generated: auto
---

# Tasks: certification-runner

## Phase 1: Make It Work (POC)

Focus: Build core components and verify browser UI works end-to-end.

- [x] 1.1 Create CertificationTests.js test registry
  - **Do**: Create `systems/visual_shell/web/CertificationTests.js` with standalone registry class containing tests for all 3 levels. Each test is an object with id, name, level, description, timeout, run(). Include getByLevel(), get(), getAll() methods.
  - **Files**: `systems/visual_shell/web/CertificationTests.js`
  - **Done when**: File exists, exports `window.CertificationTests`, console shows "[CertificationTests] Registry loaded with N tests"
  - **Verify**: `grep -c "registry:" systems/visual_shell/web/CertificationTests.js` returns count > 0
  - **Commit**: `feat(certification): add CertificationTests.js test registry`
  - _Requirements: FR-1_
  - _Design: CertificationTests.js_

- [x] 1.2 Create CertificationRunner.js orchestrator
  - **Do**: Create `systems/visual_shell/web/CertificationRunner.js` with class having on(), emit(), runTest(), runLevel(), runAll(), respond(), getSummary() methods. Implement event-driven architecture with timeout handling.
  - **Files**: `systems/visual_shell/web/CertificationRunner.js`
  - **Done when**: File exists, exports `window.CertificationRunner`, console shows "[CertificationRunner] Class loaded"
  - **Verify**: `grep -c "runAll\|runLevel\|emit" systems/visual_shell/web/CertificationRunner.js` returns count >= 3
  - **Commit**: `feat(certification): add CertificationRunner.js orchestrator`
  - _Requirements: FR-2, FR-3_
  - _Design: CertificationRunner.js_

- [x] 1.3 Create WordPress certification page
  - **Do**: Create `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_certification_page.php` with admin menu, script enqueues, control panel UI, progress bar, live log, and interactive prompt modal.
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_certification_page.php`
  - **Done when**: Page accessible at `tools.php?page=geoos-certify`, shows "Run Certifications" title
  - **Verify**: `grep -c "geoos-certify\|certification-tests\|certification-runner" wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_certification_page.php` returns count >= 3
  - **Commit**: `feat(certification): add dedicated WordPress certification runner page`
  - _Requirements: FR-4_
  - _Design: WordPress Certification Page_

- [ ] 1.4 POC Checkpoint
  - **Do**: Open browser to WordPress certification page, click "Run All Certifications", verify progress bar updates, log shows test results, summary grade appears
  - **Done when**: Browser test runs all levels, shows pass/fail for each test, displays final grade
  - **Verify**: Manual browser test at `http://localhost:8080/wp-admin/tools.php?page=geoos-certify`
  - **Commit**: `feat(certification): complete POC - browser UI working`

## Phase 2: Refactoring

After POC validated, update CLI runner to use new architecture.

- [ ] 2.1 Update CLI runner for new modules
  - **Do**: Replace `systems/visual_shell/web/tests/cli_certification_runner.js` to target new certification page, use CertificationTests/CertificationRunner, implement mock handlers for interactive tests (restart-tile, verify-sync)
  - **Files**: `systems/visual_shell/web/tests/cli_certification_runner.js`
  - **Done when**: CLI runner navigates to geoos-certify page, handles prompts via mock handlers
  - **Verify**: `grep -c "geoos-certify\|onCertificationPrompt\|restart-tile" systems/visual_shell/web/tests/cli_certification_runner.js` returns count >= 3
  - **Commit**: `feat(cli): update certification runner to use new modular architecture`
  - _Requirements: FR-5_
  - _Design: CLI Runner_

## Phase 3: Testing

- [ ] 3.1 Test browser UI
  - **Do**: Open `http://localhost:8080/wp-admin/tools.php?page=geoos-certify`, click each button (Run All, Level 1-3, Reset), verify correct behavior, test interactive prompt modal
  - **Files**: N/A (manual testing)
  - **Done when**: All buttons work, progress updates, log shows results, modal handles prompts
  - **Verify**: Manual verification in browser
  - **Commit**: `test(certification): verify browser UI functionality`

- [ ] 3.2 Test CLI runner
  - **Do**: Run `WP_URL=http://localhost:8080/wp-admin/tools.php?page=geoos-certify node systems/visual_shell/web/tests/cli_certification_runner.js 3`, verify Level 3 tests execute, mock handlers trigger, exit code reflects pass/fail
  - **Files**: N/A (CLI testing)
  - **Done when**: CLI outputs test results, mock handlers log actions, exit code is 0 or 1
  - **Verify**: Command executes without error, shows pass/fail summary
  - **Commit**: `test(certification): verify CLI runner functionality`
  - _Requirements: AC-2.1, AC-2.2, AC-2.4_

## Phase 4: Quality Gates

- [ ] 4.1 Add scorecard link to certification page
  - **Do**: Modify `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_scorecard.php` to add "Run Certifications" button linking to geoos-certify page
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_scorecard.php`
  - **Done when**: Scorecard page shows button linking to certification page
  - **Verify**: `grep -c "geoos-certify" wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_scorecard.php` returns count > 0
  - **Commit**: `feat(scorecard): add link to dedicated certification page`
  - _Requirements: FR-6_

- [ ] 4.2 Final integration verification
  - **Do**: Run full browser test (Run All), run CLI test (all levels), verify both produce same results
  - **Done when**: Browser and CLI produce identical pass/fail results for same test suite
  - **Verify**: Compare browser console output with CLI terminal output
  - **Commit**: `feat(certification): complete interactive Level 3 certification runner`

## Notes

- **POC shortcuts taken**: No persistence, no test scheduling
- **Production TODOs**: Add result persistence, scheduled runs, multi-user support
- **Interactive tests**: `blind-restoration` and `multi-seat-sync` require mock handlers in CLI mode
