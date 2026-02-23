# Certification Tests CI Integration

## Overview

The Geometry OS certification tests are automated end-to-end tests that verify WordPress plugin functionality. They run in GitHub Actions using Docker containers for MariaDB and WordPress.

## Triggers

| Trigger | Description |
|---------|-------------|
| `schedule` | Nightly at 03:00 UTC (`0 3 * * *`) |
| `workflow_dispatch` | Manual trigger via GitHub Actions UI |
| `workflow_call` | Called from other workflows |

### Manual Trigger with Level

When triggering manually, you can specify a certification level:

```bash
# Via GitHub CLI
gh workflow run certification-tests.yml -f level=1

# Or leave empty to run all levels
gh workflow run certification-tests.yml
```

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    GitHub Actions Runner                     │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌────────────────────┐  │
│  │   MariaDB   │  │  WordPress  │  │  Certification     │  │
│  │   10.11     │  │    6.4      │  │  Test Runner       │  │
│  │   :3306     │  │   :8080     │  │  (Playwright)      │  │
│  └─────────────┘  └─────────────┘  └────────────────────┘  │
│                          │                                  │
│                          ▼                                  │
│              /wp-json/geometry-os/v1/create-certbot         │
│              (REST endpoint for user creation)              │
└─────────────────────────────────────────────────────────────┘
```

## Test Levels

| Level | Name | Description |
|-------|------|-------------|
| 1 | Basic Connectivity | Verifies WordPress is running and accessible |
| 2 | Plugin Activation | Tests plugin activation and deactivation |
| 3 | Admin Access | Verifies admin user capabilities |
| 4 | Content Creation | Tests post/page creation workflows |
| 5 | Media Handling | Verifies image upload and processing |
| 6 | Settings Management | Tests settings persistence |
| 7 | API Endpoints | Verifies REST API functionality |
| 8 | Full Integration | Complete end-to-end certification |

## Running Locally

### Prerequisites

- Docker and Docker Compose
- Node.js 20+
- npm

### Steps

1. **Start WordPress environment:**

```bash
docker compose -f docker/wordpress-ci/docker-compose.test.yml up -d
```

2. **Install dependencies:**

```bash
npm install
npx playwright install --with-deps chromium
```

3. **Set environment variables:**

```bash
export WP_URL="http://localhost:8080/wp-admin/tools.php?page=geoos-certify"
export WP_USER="certbot"
export WP_PASS="your-test-password"
export HEADLESS="true"
```

4. **Run tests:**

```bash
# Run all levels
node systems/visual_shell/web/tests/cli_certification_runner.js

# Run specific level
node systems/visual_shell/web/tests/cli_certification_runner.js 1
```

## Artifacts

After each workflow run, the following artifacts are uploaded:

| Artifact | Contents | Retention |
|----------|----------|-----------|
| `certification-screenshots` | `/tmp/wp_*.png` screenshots | 7 days |
| `certification-test-results` | `test_results/` directory | 7 days |

Artifacts are uploaded even if tests fail (`if: always()`).

## Troubleshooting

### WordPress Container Fails Health Check

**Symptoms**: Workflow times out waiting for WordPress

**Solutions**:
- Check MariaDB container logs: `docker logs <mariadb-container>`
- Verify health check command: `curl -f http://localhost:8080/`
- Increase `health-retries` in workflow

### Certbot User Creation Fails (403 Forbidden)

**Symptoms**: "Failed to create certbot user!" error

**Solutions**:
- Verify `CERTBOT_SECRET` and `CERTBOT_PASSWORD` secrets are configured
- Check WordPress container logs for PHP errors
- Verify mu-plugins were copied correctly

### Playwright Browser Fails to Start

**Symptoms**: "Executable doesn't exist" error

**Solutions**:
- Ensure `npx playwright install --with-deps chromium` runs
- Check for missing system dependencies
- Verify runner has sufficient memory

### Test Results Not Uploaded

**Symptoms**: No artifacts appear after workflow

**Solutions**:
- Check `if-no-files-found: ignore` setting
- Verify test runner writes to `/tmp/wp_*.png` and `test_results/`
- Check step logs for upload errors

## Related Files

- **Workflow**: `.github/workflows/certification-tests.yml`
- **Test Runner**: `systems/visual_shell/web/tests/cli_certification_runner.js`
- **Bridge Endpoint**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`

## Required GitHub Secrets

| Secret | Description |
|--------|-------------|
| `CERTBOT_SECRET` | Shared secret for certbot user creation endpoint |
| `CERTBOT_PASSWORD` | Password for the certbot WordPress admin user |

See `docs/plans/2026-02-23-certbot-ci-integration.md` for secret generation commands.
