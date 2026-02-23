---
spec: certbot-ci-integration
phase: tasks
total_tasks: 12
created: 2026-02-22T00:00:00Z
generated: auto
---

# Tasks: certbot-ci-integration

## Phase 1: Make It Work (POC)

Focus: Get certification tests running in CI with minimal infrastructure.

- [x] 1.1 Create GitHub Actions workflow file
  - **Do**: Create `.github/workflows/certification-tests.yml` with schedule (3 AM UTC), workflow_dispatch, and workflow_call triggers. Add MariaDB 10.11 and WordPress 6.4 service containers with health checks.
  - **Files**: `.github/workflows/certification-tests.yml`
  - **Done when**: Workflow file exists with valid YAML syntax, triggers defined, services configured
  - **Verify**: `cat .github/workflows/certification-tests.yml | head -60`
  - **Commit**: `feat(ci): add certification tests workflow with Docker services`
  - _Requirements: FR-1, FR-2, FR-3, FR-4, FR-7_
  - _Design: Component 1_

- [ ] 1.2 Add checkout and Node.js setup steps
  - **Do**: Add `actions/checkout@v4`, `actions/setup-node@v4` with Node 20 and npm cache, and `npm ci` step to workflow.
  - **Files**: `.github/workflows/certification-tests.yml`
  - **Done when**: Steps checkout code, setup Node 20, install dependencies
  - **Verify**: `grep -A5 "steps:" .github/workflows/certification-tests.yml`
  - **Commit**: `feat(ci): add checkout and Node.js setup to certification workflow`
  - _Requirements: FR-1_
  - _Design: Component 1_

- [x] 1.3 Add certbot user creation endpoint
  - **Do**: In `geometry_os_bridge.php`, add REST route `/create-certbot` in `register_health_api`. Add `create_certbot_user` method that validates `secret` param against `CERTBOT_SECRET` env var, creates/updates certbot admin user with `CERTBOT_PASSWORD` env var.
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
  - **Done when**: Endpoint returns 403 on invalid secret, creates admin user on valid secret
  - **Verify**: `php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
  - **Commit**: `feat(bridge): add certbot user creation endpoint for CI/CD`
  - _Requirements: FR-5, FR-6, AC-3.1, AC-3.2, AC-3.3, AC-3.4_
  - _Design: Component 2_

- [x] 1.4 Add WordPress setup and test execution steps
  - **Do**: Add "Wait for WordPress" step with curl retry loop. Add "Setup certbot user" step calling REST endpoint with secret. Add "Run certification tests" step executing CLI runner with WP_USER, WP_PASS, WP_URL, HEADLESS env vars. Handle optional level input.
  - **Files**: `.github/workflows/certification-tests.yml`
  - **Done when**: Workflow waits for WordPress, creates user, runs tests
  - **Verify**: `grep -A20 "Run certification" .github/workflows/certification-tests.yml`
  - **Commit**: `feat(ci): add WordPress setup and test execution steps`
  - _Requirements: FR-8, AC-1.2, AC-2.2_
  - _Design: Component 1_

- [ ] 1.5 Add artifact upload steps
  - **Do**: Add two `actions/upload-artifact@v4` steps: one for `/tmp/wp_*.png` screenshots, one for `test_results/` directory. Both with `if: always()` and 7-day retention.
  - **Files**: `.github/workflows/certification-tests.yml`
  - **Done when**: Artifacts uploaded on both success and failure
  - **Verify**: `grep -A10 "upload-artifact" .github/workflows/certification-tests.yml`
  - **Commit**: `feat(ci): add artifact upload for certification test results`
  - _Requirements: FR-9, AC-1.3, AC-1.4_
  - _Design: Component 1_

- [ ] 1.6 POC Checkpoint - Manual test run
  - **Do**: Push branch, trigger workflow manually via GitHub Actions UI. Verify WordPress starts, certbot user created, tests run, artifacts uploaded.
  - **Done when**: Workflow completes (pass or fail) with artifacts visible
  - **Verify**: Check GitHub Actions run page for green/purple status
  - **Commit**: N/A (validation only)

## Phase 2: Refactoring

- [ ] 2.1 Create CI Docker image for WordPress
  - **Do**: Create `docker/wordpress-ci/Dockerfile` extending `wordpress:6.4-php8.2-apache`. Install GD extension dependencies. Enable mod_rewrite. Create `docker/wordpress-ci/php-ci.ini` with CI-specific PHP settings.
  - **Files**: `docker/wordpress-ci/Dockerfile`, `docker/wordpress-ci/php-ci.ini`
  - **Done when**: Dockerfile builds successfully
  - **Verify**: `docker build -t geometry-os-wp-ci docker/wordpress-ci/`
  - **Commit**: `feat(docker): add WordPress CI Dockerfile with GD extension`
  - _Requirements: NFR-3_
  - _Design: Component 3_

- [ ] 2.2 Create CI setup script
  - **Do**: Create `scripts/ci/setup_wordpress_ci.sh` with bash shebang. Implement wait-for-WordPress loop. Implement certbot user creation via curl. Make executable with `chmod +x`.
  - **Files**: `scripts/ci/setup_wordpress_ci.sh`
  - **Done when**: Script runs WordPress health check and user setup
  - **Verify**: `bash -n scripts/ci/setup_wordpress_ci.sh && ls -la scripts/ci/setup_wordpress_ci.sh`
  - **Commit**: `feat(ci): add WordPress CI setup script`
  - _Requirements: FR-7_
  - _Design: Component 4_

- [ ] 2.3 Update workflow to use custom Docker image
  - **Do**: Change WordPress service from `image:` to `build:` with context and dockerfile. Mount `./wordpress_zone/wordpress/wp-content` as volume. Pass `CERTBOT_SECRET` and `CERTBOT_PASSWORD` to container env. Update setup step to use script.
  - **Files**: `.github/workflows/certification-tests.yml`
  - **Done when**: Workflow builds custom image, mounts mu-plugins
  - **Verify**: `grep -A15 "wordpress:" .github/workflows/certification-tests.yml`
  - **Commit**: `feat(ci): use custom WordPress Docker image`
  - _Requirements: FR-7, AC-4.2_
  - _Design: Component 1, 3_

## Phase 3: Testing

- [ ] 3.1 Verify PHP endpoint syntax and logic
  - **Do**: Run PHP lint on modified bridge file. Test endpoint locally with curl and mock secrets.
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
  - **Done when**: `php -l` passes, endpoint responds correctly
  - **Verify**: `php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
  - **Commit**: `fix(bridge): address PHP syntax issues` (if needed)
  - _Requirements: FR-5, NFR-4_

- [ ] 3.2 Run full CI workflow end-to-end
  - **Do**: Trigger workflow with all levels (no level input). Verify all 8 tests execute. Check artifacts contain expected files.
  - **Done when**: Workflow passes with Grade A certification
  - **Verify**: `gh run view --log` or GitHub Actions UI
  - **Commit**: N/A (validation only)
  - _Requirements: AC-1.2_

## Phase 4: Quality Gates

- [ ] 4.1 Add CI badge to README
  - **Do**: Add `[![Certification Tests](https://github.com/tdw419/geometry_os/actions/workflows/certification-tests.yml/badge.svg)]` to README badges section.
  - **Files**: `README.md`
  - **Done when**: Badge visible, links to workflow
  - **Verify**: `grep "certification-tests" README.md`
  - **Commit**: `docs: add certification tests CI badge`
  - _Requirements: FR-11_

- [ ] 4.2 Create certification CI documentation
  - **Do**: Create `docs/certification-ci.md` with Overview, Triggers table, Running Locally instructions, Test Levels table, Troubleshooting section.
  - **Files**: `docs/certification-ci.md`
  - **Done when**: Documentation complete with examples
  - **Verify**: `cat docs/certification-ci.md | head -50`
  - **Commit**: `docs: add certification CI documentation`
  - _Requirements: FR-12_

- [ ] 4.3 Document required GitHub secrets
  - **Do**: Add "Required GitHub Secrets" section to plan file with table of secret names, descriptions, generation commands using `openssl rand`.
  - **Files**: `docs/plans/2026-02-23-certbot-ci-integration.md`
  - **Done when**: Secrets documented with generation examples
  - **Verify**: `grep -A10 "Required GitHub Secrets" docs/plans/2026-02-23-certbot-ci-integration.md`
  - **Commit**: `docs: document required GitHub secrets for certification CI`
  - _Requirements: NFR-2_

## Notes

- **POC shortcuts**: Using stock WordPress image initially, custom image in Phase 2
- **Production TODOs**: Add Slack notifications on failure, make workflow a required status check for main
- **Secrets must be configured**: `CERTBOT_PASSWORD` and `CERTBOT_SECRET` in GitHub repo settings
