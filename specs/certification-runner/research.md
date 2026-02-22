---
spec: certification-runner
phase: research
created: 2026-02-22T00:00:00Z
generated: auto
---

# Research: certification-runner

## Executive Summary

Feasibility: HIGH. Existing infrastructure (CertificationRunner.js, CertificationTests.js, cli_certification_runner.js, geometry_os_scorecard.php) provides foundation. Plan upgrades to dual-interface (browser + CLI) with event-driven architecture and mock/simulate capabilities for CI/CD.

## Codebase Analysis

### Existing Patterns

| File | Current State | Gap |
|------|---------------|-----|
| `systems/visual_shell/web/js/CertificationTests.js` | Test registration via `registerAllTests(runner)` function | Needs standalone registry class with `getByLevel()`, `get()`, `getAll()` |
| `systems/visual_shell/web/js/CertificationRunner.js` | Level-based runner with `prompt()` for interactive tests | Missing `runAll()`, proper event emission, response handler |
| `systems/visual_shell/web/tests/cli_certification_runner.js` | Playwright-based CLI, targets scorecard page | Needs to target new certification page, enhanced mock handlers |
| `geometry_os_scorecard.php` | Scorecard dashboard with Level 1-3 tests | Needs link to dedicated certification runner page |

### Dependencies

- **PixiJS**: FPS measurement for metabolic tests
- **Playwright**: Browser automation for CLI runner
- **WordPress REST API**: `/geometry-os/v1/heartbeat-status` endpoint
- **window.geometryOS**: Tile registry, navigation, events

### Constraints

1. Tests run in browser context (PixiJS, DOM access required)
2. Interactive tests need mock handlers for CI/CD
3. WordPress page must enqueue scripts from localhost:8888
4. CLI runner needs login handling for WordPress admin

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Existing code is 80% complete, just needs refactoring |
| Effort Estimate | S | 6 tasks, mostly file creation/modification |
| Risk Level | Low | No breaking changes to existing functionality |

## Recommendations

1. **Refactor CertificationTests.js** into standalone registry (no runner dependency)
2. **Enhance CertificationRunner.js** with `runAll()`, proper event system, `respond()` method
3. **Create dedicated WordPress page** (geometry_os_certification_page.php) for running tests
4. **Update CLI runner** to use new page and mock handlers for interactive tests
