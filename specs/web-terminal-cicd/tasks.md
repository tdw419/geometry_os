---
spec: web-terminal-cicd
phase: tasks
total_tasks: 6
created: 2026-02-23T00:00:00Z
generated: auto
---

# Tasks: Web Terminal CI/CD Integration

## Phase 1: Make It Work (POC)

Focus: Create CI runner and workflow. Get tests running in CI.

- [x] 1.1 Create CI test runner script
  - **Do**: Create `systems/visual_shell/api/tests/ci_terminal_tests.sh` with:
    - Bash script header with `set -e`
    - `run_suite()` function for pass/fail tracking
    - `skip_suite()` function with reason logging
    - Run WebSocket tests via pytest
    - Run E2E tests if Node/Puppeteer available
    - Run LLM tests with `TERMINAL_TEST_MOCK_LLM=1`
    - Skip ASCII tests with "No X11" message
    - Summary output with passed/failed/skipped counts
    - Exit 0 if no failures, exit 1 otherwise
  - **Files**: `systems/visual_shell/api/tests/ci_terminal_tests.sh`
  - **Done when**: Script runs locally and shows test summary
  - **Verify**: `chmod +x systems/visual_shell/api/tests/ci_terminal_tests.sh && ./systems/visual_shell/api/tests/ci_terminal_tests.sh`
  - **Commit**: `feat(ci): add CI-ready terminal test runner script`
  - _Requirements: FR-1_
  - _Design: CI Test Runner Script_

- [ ] 1.2 Create GitHub Actions workflow
  - **Do**: Create `.github/workflows/terminal-tests.yml` with:
    - Triggers: push/PR to main/master on paths `systems/visual_shell/api/**` and `wordpress_zone/.../geometry-os-web-terminal/**`
    - Schedule: nightly at 03:00 UTC
    - Manual dispatch with `test_suite` selector (all/websocket/e2e/llm)
    - Job `websocket-tests`: Python 3.11, pytest, upload XML artifact
    - Job `e2e-tests`: Node 20, Puppeteer, upload screenshots
    - Job `llm-tests`: Python 3.11, mock mode env var
    - Job `unified-tests`: runs bash script, needs all 3 jobs, PR comment
  - **Files**: `.github/workflows/terminal-tests.yml`
  - **Done when**: YAML validates successfully
  - **Verify**: `python3 -c "import yaml; yaml.safe_load(open('.github/workflows/terminal-tests.yml')); print('Valid')"`
  - **Commit**: `feat(ci): add GitHub Actions workflow for web terminal tests`
  - _Requirements: FR-2, FR-5, FR-6_
  - _Design: GitHub Actions Workflow_

- [ ] 1.3 POC Checkpoint
  - **Do**: Verify workflow file is valid and runner script executes
  - **Done when**: Both files exist, YAML valid, script runs
  - **Verify**: `ls -la .github/workflows/terminal-tests.yml systems/visual_shell/api/tests/ci_terminal_tests.sh`
  - **Commit**: (no commit needed if 1.1 and 1.2 committed)

## Phase 2: Refactoring

After POC validated, add mock mode support.

- [ ] 2.1 Add mock mode to LLM verifier
  - **Do**: Modify `systems/visual_shell/api/tests/llm_terminal_verify.py`:
    - Add `import os` at top
    - Add `TERMINAL_TEST_MOCK_LLM = os.environ.get('TERMINAL_TEST_MOCK_LLM', '0') == '1'`
    - Add `MockLLMVerifier` class with `ask_llm()` returning mock JSON
    - Modify `main()` to check `TERMINAL_TEST_MOCK_LLM` and use mock mode
    - Print "Running in MOCK mode" message
  - **Files**: `systems/visual_shell/api/tests/llm_terminal_verify.py`
  - **Done when**: `TERMINAL_TEST_MOCK_LLM=1 python3 systems/visual_shell/api/tests/llm_terminal_verify.py` runs without error
  - **Verify**: `TERMINAL_TEST_MOCK_LLM=1 python3 systems/visual_shell/api/tests/llm_terminal_verify.py`
  - **Commit**: `feat(test): add mock mode for LLM verification in CI`
  - _Requirements: FR-3_
  - _Design: LLM Mock Mode_

## Phase 3: Testing

Manual verification of CI components.

- [ ] 3.1 Validate YAML syntax
  - **Do**: Run Python YAML validation
  - **Files**: `.github/workflows/terminal-tests.yml`
  - **Done when**: No parse errors
  - **Verify**: `python3 -c "import yaml; yaml.safe_load(open('.github/workflows/terminal-tests.yml')); print('OK')"`
  - **Commit**: (no commit needed)

- [ ] 3.2 Run CI script locally
  - **Do**: Execute the CI runner script
  - **Files**: `systems/visual_shell/api/tests/ci_terminal_tests.sh`
  - **Done when**: Script completes with summary output
  - **Verify**: `./systems/visual_shell/api/tests/ci_terminal_tests.sh`
  - **Commit**: (no commit needed)

## Phase 4: Quality Gates

Documentation and final verification.

- [ ] 4.1 Add CI badge to README
  - **Do**: Add badge markdown to `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/README.md` after main heading:
    ```
    ![Terminal Tests](https://github.com/YOUR_USERNAME/geometry_os/actions/workflows/terminal-tests.yml/badge.svg)
    ```
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/README.md`
  - **Done when**: Badge appears in README
  - **Verify**: `head -5 wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/README.md`
  - **Commit**: `docs(terminal): add CI badge to README`
  - _Requirements: FR-7_
  - _Design: File Structure_

- [ ] 4.2 Create secrets documentation
  - **Do**: Create `docs/ci-secrets.md` with:
    - Required secrets table (WP_ADMIN_PASS)
    - Setup instructions
    - Optional secrets (LM_STUDIO_URL, VISUAL_BRIDGE_URL)
    - Local testing with `act`
    - Troubleshooting section
  - **Files**: `docs/ci-secrets.md`
  - **Done when**: File exists with complete documentation
  - **Verify**: `cat docs/ci-secrets.md`
  - **Commit**: `docs(ci): add secrets configuration documentation`
  - _Requirements: FR-8_
  - _Design: File Structure_

- [ ] 4.3 Final verification
  - **Do**: Verify all files exist and workflow is valid
  - **Files**: All created files
  - **Done when**: All checks pass
  - **Verify**: `ls -la .github/workflows/terminal-tests.yml systems/visual_shell/api/tests/ci_terminal_tests.sh docs/ci-secrets.md`
  - **Commit**: `chore(ci): final verification - all CI components in place` (if changes needed)

- [ ] 4.4 Push and verify CI
  - **Do**: Push branch, create PR, verify CI runs
  - **Done when**: PR shows CI running with test results
  - **Verify**: `gh pr checks --watch`
  - **Commit**: (no commit needed)

## Notes

- **POC shortcuts taken**: Using `continue-on-error: true` initially
- **Production TODOs**:
  - Remove `continue-on-error: true` once tests stable
  - Add Codecov integration if needed
  - Consider self-hosted runners for Visual Bridge tests
