---
spec: web-terminal-cicd
phase: requirements
created: 2026-02-23T00:00:00Z
generated: auto
---

# Requirements: Web Terminal CI/CD Integration

## Summary

Automate 4 web terminal test suites in GitHub Actions CI/CD pipeline with proper mocking for CI-specific constraints.

## User Stories

### US-1: Automated Test Execution on Push/PR

As a developer, I want terminal tests to run automatically when I push changes so that I catch regressions early.

**Acceptance Criteria**:
- AC-1.1: Workflow triggers on push to main/master affecting terminal paths
- AC-1.2: Workflow triggers on PRs to main/master affecting terminal paths
- AC-1.3: Workflow triggers nightly at 03:00 UTC
- AC-1.4: Manual trigger available via workflow_dispatch

### US-2: Parallel Test Execution

As a developer, I want test suites to run in parallel so that CI completes faster.

**Acceptance Criteria**:
- AC-2.1: WebSocket, E2E, and LLM tests run as separate jobs
- AC-2.2: Unified summary job aggregates all results
- AC-2.3: Failed job doesn't block other jobs from completing

### US-3: CI-Compatible Test Modes

As a CI system, I need tests to adapt to CI constraints so they don't fail due to missing infrastructure.

**Acceptance Criteria**:
- AC-3.1: LLM tests run in mock mode when `TERMINAL_TEST_MOCK_LLM=1`
- AC-3.2: ASCII tests skip with clear message (no X11)
- AC-3.3: WebSocket tests skip gracefully if Visual Bridge unavailable
- AC-3.4: E2E tests use Puppeteer headless mode

### US-4: Test Result Visibility

As a developer, I want to see test results clearly so that I can quickly diagnose failures.

**Acceptance Criteria**:
- AC-4.1: JUnit XML artifacts uploaded for WebSocket tests
- AC-4.2: Screenshots uploaded for E2E test failures
- AC-4.3: PR comment with test summary table
- AC-4.4: CI badge in README shows current status

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Create CI test runner script (`ci_terminal_tests.sh`) | Must | US-1 |
| FR-2 | Create GitHub Actions workflow file | Must | US-1 |
| FR-3 | Add mock mode to LLM verifier | Must | US-3 |
| FR-4 | Skip ASCII tests in CI | Must | US-3 |
| FR-5 | Upload test artifacts | Must | US-4 |
| FR-6 | Generate PR comments with summary | Should | US-4 |
| FR-7 | Add CI badge to README | Should | US-4 |
| FR-8 | Document required secrets | Should | US-1 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | WebSocket tests complete in <60s | Performance |
| NFR-2 | Full workflow completes in <10min | Performance |
| NFR-3 | Secrets documented for reproducibility | Maintainability |

## Out of Scope

- Running Visual Bridge in CI (too complex, tests skip gracefully)
- Running LM Studio in CI (mock mode sufficient)
- ASCII desktop capture (requires X11)
- Codecov integration for terminal tests (covered by integration-tests.yml)

## Dependencies

- Existing test files (DO NOT MODIFY logic, only add mock mode)
- `WP_ADMIN_PASS` GitHub secret for E2E tests
- Puppeteer installed in CI environment
- pytest, pytest-asyncio, aiohttp, websockets packages
