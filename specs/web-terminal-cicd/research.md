---
spec: web-terminal-cicd
phase: research
created: 2026-02-23T00:00:00Z
generated: auto
---

# Research: Web Terminal CI/CD Integration

## Executive Summary

High feasibility. Integrating 4 existing terminal test suites into GitHub Actions. Pattern established by `integration-tests.yml`. WebSocket tests run directly, E2E with Puppeteer, LLM in mock mode, ASCII skipped (no X11).

## Codebase Analysis

### Existing Test Suites

| Suite | File | Dependencies | CI Strategy |
|-------|------|--------------|-------------|
| WebSocket | `test_terminal_bridge.py` | pytest, aiohttp, websockets | Full run |
| E2E | `e2e_terminal_test.js` | Puppeteer, Node.js 20 | Headless |
| LLM | `llm_terminal_verify.py` | aiohttp, LM Studio | Mock mode |
| ASCII | `ascii_terminal_test.py` | X11, mss | Skip |

### Existing CI Pattern (integration-tests.yml)

```
Triggers: push/PR to main, nightly schedule, manual dispatch
Jobs: neural-pipeline-tests, health-system-tests, cross-language-tests, full-integration
Features: pytest coverage, artifacts upload, PR comments, Codecov
```

**Key patterns to follow:**
- Matrix of parallel jobs with `needs:` dependencies
- `continue-on-error: true` for non-blocking tests
- Artifact upload for test results and screenshots
- GitHub script for PR comments
- `workflow_dispatch` with `test_suite` selector

### Dependencies

| Dependency | Version | Purpose |
|------------|---------|---------|
| pytest | latest | Python test runner |
| pytest-asyncio | latest | Async test support |
| aiohttp | latest | HTTP client |
| websockets | latest | WebSocket client |
| Puppeteer | latest | Headless browser |
| Node.js | 20 | E2E runtime |

### Constraints

1. **No X11 in CI**: ASCII desktop tests must skip
2. **No LM Studio in CI**: LLM tests use mock mode (`TERMINAL_TEST_MOCK_LLM=1`)
3. **WordPress credentials**: E2E tests need `WP_ADMIN_PASS` secret
4. **Visual Bridge**: Tests skip gracefully if bridge not running

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Existing pattern in integration-tests.yml |
| Effort Estimate | S | 6 tasks, straightforward implementation |
| Risk Level | Low | Tests already skip gracefully |

## Recommendations

1. Create separate `terminal-tests.yml` workflow (don't modify integration-tests.yml)
2. Add mock mode env var to LLM verifier for CI
3. Run WebSocket tests first (fast, no external deps)
4. Use `continue-on-error: true` initially to avoid blocking builds
