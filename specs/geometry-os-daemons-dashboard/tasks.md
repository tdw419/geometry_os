---
spec: geometry-os-daemons-dashboard
phase: tasks
total_tasks: 7
created: 2026-02-22
generated: auto
---

# Tasks: Geometry OS Daemons Dashboard

## Phase 1: Make It Work (POC)

Focus: Get plugin loading and showing basic daemon status.

- [x] 1.1 Create main plugin file (geometry-os-daemons.php)
  - **Do**: Create `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/geometry-os-daemons.php` with plugin header, main class, menu registration, and AJAX handler stub
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/geometry-os-daemons.php`
  - **Done when**: Plugin appears in WordPress admin plugins list
  - **Verify**: `ls -la wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/geometry-os-daemons.php`
  - **Commit**: `feat(wp): add Geometry OS Daemons plugin skeleton`
  - _Requirements: FR-1, FR-2_
  - _Design: Geometry_OS_Daemons component_

- [x] 1.2 Create Daemon_Monitor class (class-daemon-monitor.php)
  - **Do**: Create `includes/class-daemon-monitor.php` with multi-daemon checking via pgrep/ps, transient caching, uptime formatting
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/includes/class-daemon-monitor.php`
  - **Done when**: Class loads without fatal error, methods callable
  - **Verify**: `php -l wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/includes/class-daemon-monitor.php`
  - **Commit**: `feat(wp): add Daemon_Monitor class for multi-daemon status`
  - _Requirements: FR-3, FR-4, FR-5, FR-6, FR-7, FR-8_
  - _Design: Daemon_Monitor component_

- [x] 1.3 Create admin dashboard page (page-daemons.php)
  - **Do**: Create `admin/page-daemons.php` with card grid template, status indicators, metrics display
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/admin/page-daemons.php`
  - **Done when**: Page renders at admin.php?page=geometry-os
  - **Verify**: `ls -la wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/admin/page-daemons.php`
  - **Commit**: `feat(wp): add daemons dashboard page template`
  - _Requirements: FR-4, FR-5, FR-6, FR-7_
  - _Design: Admin Dashboard Page component_

- [x] 1.4 Create admin CSS styles (admin.css)
  - **Do**: Create `assets/css/admin.css` with card grid layout, status colors (green/red), responsive adjustments
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/assets/css/admin.css`
  - **Done when**: Dashboard displays styled cards with proper colors
  - **Verify**: `ls -la wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/assets/css/admin.css`
  - **Commit**: `feat(wp): add daemons dashboard admin styles`
  - _Requirements: FR-4_
  - _Design: UI styling_

- [ ] 1.5 Create JavaScript auto-refresh (daemon-monitor.js)
  - **Do**: Create `assets/js/daemon-monitor.js` with 30s auto-refresh, manual refresh button, card DOM update logic
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/assets/js/daemon-monitor.js`
  - **Done when**: Dashboard auto-refreshes every 30 seconds, manual refresh works
  - **Verify**: `ls -la wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/assets/js/daemon-monitor.js`
  - **Commit**: `feat(wp): add daemon dashboard auto-refresh JavaScript`
  - _Requirements: FR-9, FR-10, FR-11_
  - _Design: JavaScript Auto-Refresh component_

- [ ] 1.6 POC Checkpoint
  - **Do**: Verify plugin loads, dashboard shows daemon status, auto-refresh works
  - **Done when**: Can navigate to Geometry OS > Daemons in WordPress admin, see all 3 daemons, see live data
  - **Verify**: Manual browser test of admin.php?page=geometry-os
  - **Commit**: `feat(wp): complete Geometry OS Daemons POC`

## Phase 2: Refactoring

After POC validated, clean up code.

- [ ] 2.1 Add comprehensive error handling
  - **Do**: Add try/catch in AJAX handler, graceful degradation when shell_exec disabled
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/geometry-os-daemons.php`, `includes/class-daemon-monitor.php`
  - **Done when**: Plugin handles missing shell_exec gracefully
  - **Verify**: PHP syntax check
  - **Commit**: `refactor(wp): add error handling to daemon monitor`
  - _Design: Error Handling section_

## Phase 3: Testing

- [ ] 3.1 Write PHP unit tests
  - **Do**: Create `tests/php/bootstrap.php` with mock WordPress functions, `tests/php/class-test-daemon-monitor.php` with tests for get_configured_daemons, caching, uptime formatting
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/tests/php/bootstrap.php`, `tests/php/class-test-daemon-monitor.php`, `tests/php/run-tests.php`
  - **Done when**: Tests pass with PHPUnit
  - **Verify**: `php wordpress_zone/wordpress/wp-content/plugins/geometry-os-daemons/tests/php/run-tests.php` (or note PHPUnit requirement)
  - **Commit**: `test(wp): add Daemon_Monitor unit tests`
  - _Requirements: All FRs_

## Phase 4: Quality Gates

- [ ] 4.1 Integration test - verify plugin loads
  - **Do**: Run PHP syntax check on all PHP files, verify file structure complete
  - **Verify**: `php -l` on all PHP files, `find` to check file structure
  - **Done when**: No syntax errors, all expected files present
  - **Commit**: `feat(wp): complete Geometry OS Daemons dashboard plugin`

## Notes

- **POC shortcuts taken**: None - plan is production-ready from start
- **Production TODOs**: Consider adding start/stop controls, historical metrics
