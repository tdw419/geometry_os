---
spec: certification-runner
phase: requirements
created: 2026-02-22T00:00:00Z
generated: auto
---

# Requirements: certification-runner

## Summary

Build a dual-interface (browser + CLI) certification runner for Level 3 Operational Excellence tests with event-driven execution and mock/simulate capabilities for CI/CD automation.

## User Stories

### US-1: Browser-based Certification Runner

As a **Geometry OS operator**, I want to run certification tests from a WordPress admin page so that I can verify system health visually with live logs.

**Acceptance Criteria**:
- AC-1.1: Dedicated WordPress page at `tools.php?page=geoos-certify`
- AC-1.2: Buttons for "Run All", "Level 1", "Level 2", "Level 3"
- AC-1.3: Progress bar showing current test and completion percentage
- AC-1.4: Live log panel with color-coded results
- AC-1.5: Modal for interactive test prompts with Pass/Fail buttons
- AC-1.6: Summary grade (A-F) displayed at completion

### US-2: CLI Certification Runner for CI/CD

As a **CI/CD pipeline**, I want to run certifications via CLI with mock handlers so that I can automate Level 3 testing without manual interaction.

**Acceptance Criteria**:
- AC-2.1: `node cli_certification_runner.js [level]` command
- AC-2.2: Playwright headless browser execution
- AC-2.3: Mock handlers for interactive tests (restart-tile, verify-sync)
- AC-2.4: Exit code 0 on all pass, 1 on any fail
- AC-2.5: Terminal output with pass/fail status per test

### US-3: Modular Test Registry

As a **developer**, I want tests in a standalone registry so that I can add/modify tests independently of the runner.

**Acceptance Criteria**:
- AC-3.1: `CertificationTests.registry` object with test definitions
- AC-3.2: `CertificationTests.getByLevel(level)` method
- AC-3.3: `CertificationTests.get(id)` method
- AC-3.4: `CertificationTests.getAll()` method
- AC-3.5: Each test has: id, name, level, description, timeout, run()

### US-4: Event-Driven Orchestrator

As a **UI developer**, I want the runner to emit events so that I can build reactive interfaces.

**Acceptance Criteria**:
- AC-4.1: `on(event, callback)` subscription method
- AC-4.2: Events: suite:start, level:start, progress, test:start, test:complete, prompt, suite:complete
- AC-4.3: DOM event dispatch via `certification:${event}`
- AC-4.4: `respond(testId, success, details)` method for interactive prompts

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | CertificationTests.js as standalone registry with `getByLevel()`, `get()`, `getAll()` | Must | US-3 |
| FR-2 | CertificationRunner.js with `runAll()`, `runLevel()`, `runTest()` | Must | US-4 |
| FR-3 | Event emission for all lifecycle phases | Must | US-4 |
| FR-4 | WordPress certification page with controls, progress, logs, modal | Must | US-1 |
| FR-5 | CLI runner with Playwright and mock handlers | Must | US-2 |
| FR-6 | Link from scorecard to certification page | Should | US-1 |
| FR-7 | Grade calculation (A-F) based on pass percentage | Should | US-1 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Test execution timeout handling (default 30s) | Reliability |
| NFR-2 | CLI runner supports WordPress login via env vars | Security |
| NFR-3 | Browser UI responsive with 60 FPS animations | Performance |

## Out of Scope

- Database persistence of results (future)
- Real-time multi-user certification (future)
- Test scheduling/automation (future)

## Dependencies

- Playwright (`@playwright/test`)
- WordPress mu-plugins system
- PixiJS (via existing geometryOSApp)
- REST API endpoint `/geometry-os/v1/heartbeat-status`
