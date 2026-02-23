---
spec: mission-control-health
phase: execution
created: 2026-02-22T16:00:00Z
---

# Tasks: Mission Control Health Monitoring (Bug Fixes)

## Summary

BUG FIX spec - all components exist, need fixes for:
1. `wp_health_bridge.js`: `window.MetricsCollector` → `window.geometryOSMetrics`
2. `wp_health_bridge.js`: Fix metric key names (bridgeLatency→avgLatency, activeSwarms→tileCount)
3. `geometry_os_bridge.php`: Add filter for base URL configuration

## Phase 1: Make It Work (POC)

- [x] 1.1 Fix MetricsCollector reference in wp_health_bridge.js
  - **Do**:
    1. Change line 110: `typeof window.MetricsCollector === 'undefined'` → `!window.geometryOSMetrics`
    2. Change line 119: `window.MetricsCollector.getAllMetrics()` → `window.geometryOSMetrics.getAllMetrics()`
  - **Files**: `systems/visual_shell/web/wp_health_bridge.js`
  - **Done when**: Bridge uses correct global instance reference
  - **Verify**: `grep -n "window.MetricsCollector" systems/visual_shell/web/wp_health_bridge.js` returns empty
  - **Commit**: `fix(health-bridge): use window.geometryOSMetrics instead of window.MetricsCollector`
  - _Requirements: FR-9, AC-3.1_
  - _Design: wp_health_bridge.js Bug section_

- [x] 1.2 Fix metric key names in heartbeat payload
  - **Do**:
    1. Change line 129: `metrics.bridgeLatency` → `metrics.avgLatency`
    2. Change line 130: `metrics.activeSwarms` → `metrics.tileCount`
    3. Also fix calculateHealthScore (line 87): `metrics.bridgeLatency` → `metrics.avgLatency`
  - **Files**: `systems/visual_shell/web/wp_health_bridge.js`
  - **Done when**: Heartbeat uses correct metric keys matching MetricsCollector.getAllMetrics()
  - **Verify**: `grep -E "bridgeLatency|activeSwarms" systems/visual_shell/web/wp_health_bridge.js` returns empty
  - **Commit**: `fix(health-bridge): use correct metric keys avgLatency and tileCount`
  - _Requirements: FR-9, AC-3.2_
  - _Design: wp_health_bridge.js Additional Issue section_

- [x] 1.3 Add base URL filter to geometry_os_bridge.php
  - **Do**:
    1. Change line 117: `$base_url = 'http://localhost:8080';` → `$base_url = apply_filters('geometry_os_asset_base_url', 'http://localhost:8080');`
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
  - **Done when**: Base URL is configurable via WordPress filter
  - **Verify**: `grep -n "apply_filters.*geometry_os_asset_base_url" wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php` returns line 117
  - **Commit**: `feat(wp-bridge): add filter for asset base URL configuration`
  - _Requirements: FR-18_
  - _Design: geometry_os_bridge.php Issue section_

- [x] 1.4 V1 [VERIFY] Quality checkpoint: lint check
  - **Do**: Run lint commands from research.md
  - **Verify**: `make lint` exits 0
  - **Done when**: No lint errors
  - **Commit**: `chore(mission-control): pass quality checkpoint` (only if fixes needed)
  - _Note: make lint checks Rust codebase, not JS/PHP. Spec changes validated via syntax check._

- [x] 1.5 POC Checkpoint - Verify fixes work
  - **Do**:
    1. Verify MetricsCollector.js returns correct key names
    2. Check that wp_health_bridge.js references match
    3. Confirm base URL filter added
  - **Verify**: `grep -A5 "getAllMetrics()" systems/visual_shell/web/MetricsCollector.js | grep -E "avgLatency|tileCount"` shows correct keys
  - **Done when**: All three fixes verified via grep
  - **Commit**: `feat(mission-control): complete POC bug fixes`

## Phase 2: Refactoring

- [ ] 2.1 Add error handling for missing geometryOSMetrics
  - **Do**:
    1. Add null check before calling getAllMetrics()
    2. Add console warning if metrics unavailable
    3. Return early from sendHeartbeat if no metrics
  - **Files**: `systems/visual_shell/web/wp_health_bridge.js`
  - **Done when**: Graceful handling when instance not available
  - **Verify**: Code review shows null check pattern
  - **Commit**: `refactor(health-bridge): add null check for geometryOSMetrics`
  - _Design: Error Handling section_

- [ ] 2.2 V2 [VERIFY] Quality checkpoint: lint + check-types
  - **Do**: Run quality commands
  - **Verify**: `make lint && make format-check` exits 0
  - **Done when**: No lint or format errors
  - **Commit**: `chore(mission-control): pass quality checkpoint` (only if fixes needed)

## Phase 3: Testing

- [ ] 3.1 Create unit tests for wp_health_bridge.js
  - **Do**:
    1. Create `WpHealthBridgeTester` class at `systems/visual_shell/web/tests/test_wp_health_bridge.js`
    2. Add tests for calculateHealthScore (perfect metrics, high latency penalty, buffer drops penalty, reconnects penalty)
    3. Add tests for heartbeat payload construction (correct key names)
    4. Add test for graceful error handling when metrics unavailable
  - **Files**: `systems/visual_shell/web/tests/test_wp_health_bridge.js`
  - **Done when**: Tester class with 5+ test methods created
  - **Verify**: `grep -c "test_" systems/visual_shell/web/tests/test_wp_health_bridge.js` returns 5+
  - **Commit**: `test(health-bridge): add unit tests for wp_health_bridge.js`
  - _Requirements: AC-3.3_
  - _Design: Test Strategy section_

- [ ] 3.2 Update test runner to include new tests
  - **Do**:
    1. Add `<script src="test_wp_health_bridge.js"></script>` to runner HTML
    2. Add "Run Bridge Tests" button or integrate into "Run All"
  - **Files**: `systems/visual_shell/web/tests/test_mission_control_health_runner.html`
  - **Done when**: New test file loaded by runner
  - **Verify**: `grep "test_wp_health_bridge.js" systems/visual_shell/web/tests/test_mission_control_health_runner.html` shows script tag
  - **Commit**: `test(health-bridge): add wp_health_bridge tests to runner`

- [ ] 3.3 V3 [VERIFY] Quality checkpoint: lint + tests
  - **Do**: Run quality commands
  - **Verify**: `make lint && make check` exits 0
  - **Done when**: All tests pass, no lint errors
  - **Commit**: `chore(mission-control): pass quality checkpoint` (only if fixes needed)

- [ ] 3.4 Integration test verification
  - **Do**:
    1. Verify integration tests in verification_wp_integration.js reference correct keys
    2. Check that mock geometryOS uses window.geometryOSMetrics pattern
  - **Files**: `systems/visual_shell/web/tests/verification_wp_integration.js`
  - **Done when**: Integration tests use correct patterns
  - **Verify**: `grep "geometryOSMetrics" systems/visual_shell/web/tests/verification_wp_integration.js` shows usage
  - **Commit**: `test(health-bridge): update integration tests for correct patterns`

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run ALL quality checks locally
  - **Verify**: All commands must pass:
    - Lint: `make lint`
    - Format check: `make format-check`
    - Tests: `make check`
  - **Done when**: All commands pass with no errors
  - **Commit**: `fix(mission-control): address lint/type issues` (if fixes needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/wp-mission-control-health`
    3. Create PR: `gh pr create --title "fix(mission-control): health bridge bug fixes" --body "Fixes window.MetricsCollector reference and metric key names"`
  - **Verify**: `gh pr checks --watch` shows all green
  - **Done when**: All CI checks green, PR ready for review
  - **Commit**: None (PR creation)

## Phase 5: PR Lifecycle

- [ ] 5.1 Monitor CI and address failures
  - **Do**: Monitor PR checks, fix any failures
  - **Verify**: `gh pr checks` shows all passing
  - **Done when**: CI passes
  - **Commit**: Various fix commits as needed

- [ ] 5.2 V4 [VERIFY] Final validation: grep confirms all bugs fixed
  - **Do**:
    1. `grep -r "window.MetricsCollector" systems/visual_shell/web/` should return empty
    2. `grep -r "bridgeLatency\|activeSwarms" systems/visual_shell/web/wp_health_bridge.js` should return empty
    3. `grep "apply_filters.*geometry_os_asset_base_url" wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php` should find line
  - **Verify**: All three grep commands confirm fixes
  - **Done when**: No references to old patterns remain
  - **Commit**: None

- [ ] 5.3 V5 [VERIFY] AC checklist verification
  - **Do**: Programmatically verify acceptance criteria
  - **Verify**:
    - AC-3.1: `grep "setInterval.*60000" systems/visual_shell/web/wp_health_bridge.js` shows 60s interval
    - AC-3.2: `grep -A5 "payload = {" systems/visual_shell/web/wp_health_bridge.js` shows correct keys
  - **Done when**: All relevant AC confirmed via automated checks
  - **Commit**: None

## Unresolved Questions

1. **Production base URL**: Default remains `http://localhost:8080` - users can override via filter `add_filter('geometry_os_asset_base_url', function() { return 'https://production.url'; });`

## Notes

- **POC shortcuts**: None - this is a bug fix spec
- **Production TODOs**:
  - Document the `geometry_os_asset_base_url` filter for production deployments
  - Consider adding a wp-config constant fallback
