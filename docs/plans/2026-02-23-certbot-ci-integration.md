# Certbot CI Integration Plan

## Overview

This plan describes the integration of certification tests into GitHub Actions CI/CD pipeline for automated WordPress plugin testing.

## Required GitHub Secrets

The following secrets must be configured in the GitHub repository settings before the certification tests workflow can run successfully.

### Configuration Steps

1. Navigate to repository **Settings** > **Secrets and variables** > **Actions**
2. Click **New repository secret** for each secret below
3. Add the secret name and value
4. Click **Add secret**

### Secret Reference

| Secret Name | Description | Generation Command |
|-------------|-------------|-------------------|
| `CERTBOT_SECRET` | Shared secret used to authenticate requests to the certbot user creation endpoint | `openssl rand -hex 32` |
| `CERTBOT_PASSWORD` | Password for the certbot WordPress admin user created during CI runs | `openssl rand -base64 24` |

### Generation Examples

```bash
# Generate CERTBOT_SECRET (64-character hex string)
openssl rand -hex 32
# Example output: a1b2c3d4e5f6789012345678901234567890abcdef1234567890abcdef123456

# Generate CERTBOT_PASSWORD (base64-encoded, ~32 chars)
openssl rand -base64 24
# Example output: kJ8mN2pQ7rS9tU3vW5xY6zA1bC4dE8fG
```

### Security Notes

- **Never commit secrets to the repository**
- Rotate secrets periodically (recommended: every 90 days)
- Use strong, randomly generated values (minimum 32 characters)
- Limit secret access to required workflows only

## Workflow Reference

- **Workflow File**: `.github/workflows/certification-tests.yml`
- **Documentation**: `docs/certification-ci.md`

## Related Components

- `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php` - REST endpoint
- `systems/visual_shell/web/tests/cli_certification_runner.js` - Test runner

## Status

- [x] GitHub Actions workflow created
- [x] REST endpoint for certbot user creation
- [ ] Secrets configured in repository (manual step)
- [ ] First successful workflow run (requires secrets)
