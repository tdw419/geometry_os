# CI Secrets Configuration

This document describes the GitHub secrets required for CI/CD workflows in Geometry OS.

## Required Secrets

### WP_ADMIN_PASS

WordPress administrator password used for:
- Certification CI workflows (certbot integration)
- WordPress plugin deployment tests
- Admin-level API access during CI

**How to configure:**
1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Name: `WP_ADMIN_PASS`
5. Value: Your WordPress admin password (use a strong, unique password)

> **Security Note**: Use a dedicated CI account with limited permissions when possible. Rotate secrets periodically.

## Workflow Files Using Secrets

| Workflow | Secrets Used | Purpose |
|----------|-------------|---------|
| `terminal-tests.yml` | None | Terminal tests run without secrets |
| `certification-ci.yml` | `WP_ADMIN_PASS` | WordPress admin operations |

## Local Testing with `act`

You can test GitHub Actions workflows locally using [act](https://github.com/nektos/act).

### Installation

```bash
# Linux
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# macOS
brew install act
```

### Running Workflows Locally

```bash
# List available workflows
act -l

# Run terminal tests workflow
act -j websocket-tests

# Run with specific event
act push -j websocket-tests

# Run all jobs in terminal tests
act -W .github/workflows/terminal-tests.yml
```

### Providing Secrets for Local Testing

Create a `.secrets` file in the project root:

```bash
# .secrets (DO NOT COMMIT)
WP_ADMIN_PASS=your_test_password_here
```

Run with secrets:

```bash
act --secret-file .secrets
```

### Mock Mode

The terminal tests support mock mode for testing without external dependencies:

```bash
# Run with mock LLM
export TERMINAL_TEST_MOCK_LLM=1
export LM_STUDIO_URL="mock://disabled"

# Run the CI script
./systems/visual_shell/api/tests/ci_terminal_tests.sh
```

## Troubleshooting

### "Secret not found" Error

**Cause**: Secret not configured in repository settings.

**Solution**:
1. Verify secret exists in **Settings** → **Secrets and variables** → **Actions**
2. Check secret name matches exactly (case-sensitive)
3. Re-add the secret if needed

### Local Tests Fail with Authentication Error

**Cause**: Secrets not provided to `act`.

**Solution**:
```bash
# Create secrets file
echo "WP_ADMIN_PASS=your_password" > .secrets

# Run with secrets
act --secret-file .secrets
```

### CI Script Permission Denied

**Cause**: Script not executable.

**Solution**:
```bash
chmod +x systems/visual_shell/api/tests/ci_terminal_tests.sh
```

### WebSocket Tests Fail in CI

**Cause**: Missing dependencies.

**Solution**:
The workflow installs dependencies automatically. If running manually:
```bash
pip install pytest pytest-asyncio aiohttp websockets
```

### E2E Tests Skipped

**Cause**: Puppeteer not installed or no display available.

**Solution**:
- In CI: E2E tests are optional and skipped if Puppeteer unavailable
- Locally: `npm install puppeteer`

### LLM Tests Skip

**Cause**: LLM service not available.

**Solution**:
LLM tests run in mock mode by default in CI. No external service needed.
```bash
export TERMINAL_TEST_MOCK_LLM=1
```

## Security Best Practices

1. **Never commit secrets** to the repository
2. Use environment-specific secrets (dev, staging, prod)
3. Rotate secrets every 90 days
4. Use GitHub's encrypted secrets feature
5. Limit secret access to required workflows only
6. Add `.secrets` to `.gitignore`

```gitignore
# .gitignore
.secrets
.env
*.pem
*_credentials*
```

## Related Documentation

- [Terminal Tests Workflow](../.github/workflows/terminal-tests.yml)
- [Certification CI Documentation](certification-ci.md)
- [Geometry OS Web Terminal README](../wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/README.md)
