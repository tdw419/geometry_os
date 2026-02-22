# Tasks: ASCII Desktop Control WordPress Plugin

## Phase 1: Core Infrastructure (POC)

Focus: Plugin skeleton, CPT registration, shell exec wrappers. No UI polish yet.

- [x] 1.1 Create plugin directory structure and main plugin file
  - **Do**:
    1. Create `wp-content/plugins/ascii-desktop-control/` directory
    2. Create `ascii-desktop-control.php` with plugin header and main class
    3. Define plugin constants (VERSION, PLUGIN_DIR, PLUGIN_URL)
    4. Add basic hook registration in constructor (admin_menu, admin_init)
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: Plugin appears in WP admin plugins list, activates without errors
  - **Verify**: `ls -la /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): create ASCII Desktop Control plugin scaffold`
  - _Requirements: FR-10, TR-8_

- [x] 1.2 Create ASCII_View shell exec wrapper class
  - **Do**:
    1. Create `includes/class-ascii-view.php`
    2. Implement `get_view($width, $height)` method with shell_exec
    3. Implement `parse_output()` to split ASCII from JSON bindings
    4. Add error handling for script failures
    5. Set DISPLAY=:0 environment variable
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-ascii-view.php`
  - **Done when**: Class returns structured array with ascii, bindings, mode, timestamp
  - **Verify**: `grep -c "class ASCII_View" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-ascii-view.php`
  - **Commit**: `feat(wp): add ASCII_View shell exec wrapper`
  - _Requirements: FR-1, IR-1_

- [ ] 1.3 Create Directive_API class with CPT CRUD
  - **Do**:
    1. Create `includes/class-directive-api.php`
    2. Implement `create($title, $content)` with duplicate check
    3. Implement `get_recent($limit)` to query directive CPT
    4. Implement `get_logs($filters)` with status/date/search filtering
    5. Implement `update_status($post_id, $status, $result)` method
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-directive-api.php`
  - **Done when**: All CRUD methods return expected data structures
  - **Verify**: `grep -c "class Directive_API" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-directive-api.php`
  - **Commit**: `feat(wp): add Directive_API with CPT CRUD`
  - _Requirements: FR-3, FR-5, FR-6, FR-7_

- [ ] 1.4 Create Daemon_Status class with pgrep and caching
  - **Do**:
    1. Create `includes/class-daemon-status.php`
    2. Implement `is_running()` with pgrep shell exec
    3. Add transient caching (30s TTL per requirements)
    4. Implement `get_status()` returning running/stopped + last_check
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-daemon-status.php`
  - **Done when**: Class returns cached daemon status, cache expires after 30s
  - **Verify**: `grep -c "CACHE_TTL" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-daemon-status.php`
  - **Commit**: `feat(wp): add Daemon_Status with pgrep and caching`
  - _Requirements: FR-9, AC-6.3, AC-6.4_

- [ ] 1.5 Register directive CPT in main plugin file
  - **Do**:
    1. Add `register_directive_cpt()` method to main class
    2. Call on `init` hook
    3. Configure labels, supports (title, content), public => false, show_ui => true
    4. Add meta box callback for directive_status field
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: directive CPT appears in WP admin menu, can create/edit posts
  - **Verify**: `grep -c "register_post_type.*directive" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): register directive custom post type`
  - _Requirements: FR-3, TR-6_

- [ ] 1.6 [VERIFY] Quality checkpoint: PHP syntax check all files
  - **Do**: Run PHP syntax check on all created files
  - **Verify**: `php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/*.php && php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/*.php`
  - **Done when**: No syntax errors
  - **Commit**: `chore(wp): pass quality checkpoint` (only if fixes needed)

- [ ] 1.7 Register settings via Settings API
  - **Do**:
    1. Add `register_settings()` method to main class
    2. Register settings: ascii_polling_interval, ascii_grid_width, ascii_grid_height, ascii_llm_endpoint, ascii_llm_model, ascii_log_retention_days, ascii_daemon_enabled
    3. Add sanitization callbacks for each setting type
    4. Call on `admin_init` hook
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: Settings appear in wp_options table with defaults
  - **Verify**: `grep -c "register_setting.*ascii_" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): register plugin settings via Settings API`
  - _Requirements: FR-8, AC-5.7_

- [ ] 1.8 Implement AJAX handlers in main class
  - **Do**:
    1. Add `wp_ajax_ascii_get_view` handler - calls ASCII_View->get_view()
    2. Add `wp_ajax_ascii_post_directive` handler - calls Directive_API->create()
    3. Add `wp_ajax_ascii_get_directives` handler - calls Directive_API->get_recent()
    4. Add `wp_ajax_ascii_get_logs` handler - calls Directive_API->get_logs()
    5. Add `wp_ajax_ascii_daemon_status` handler - calls Daemon_Status->get_status()
    6. Add nonce verification and capability check to each handler
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: All AJAX endpoints return JSON responses with success/data structure
  - **Verify**: `grep -c "wp_ajax_ascii_" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): add AJAX handlers for ASCII view and directives`
  - _Requirements: FR-4, FR-5, FR-6, FR-7, FR-12_

- [ ] 1.9 [VERIFY] Quality checkpoint: PHP syntax + file structure
  - **Do**: Verify all PHP files have no syntax errors and includes are correct
  - **Verify**: `find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control -name "*.php" -exec php -l {} \; 2>&1 | grep -v "No syntax errors"`
  - **Done when**: All files pass syntax check
  - **Commit**: `chore(wp): pass quality checkpoint` (only if fixes needed)

- [ ] 1.10 Add admin menu pages
  - **Do**:
    1. Add `add_menu()` method with add_menu_page for "ASCII Control" (toplevel)
    2. Add submenu page for Settings (under Settings menu via add_options_page)
    3. Add submenu page for Logs under toplevel menu
    4. Use dashicons-desktop icon
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: Menu items appear in WP admin sidebar
  - **Verify**: `grep -c "add_menu_page\|add_options_page\|add_submenu_page" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): add admin menu pages`
  - _Requirements: FR-10, AC-5.1_

- [ ] 1.11 POC Checkpoint: Core functionality working
  - **Do**: Verify plugin activates, CPT works, AJAX handlers return data
  - **Verify**: `curl -s -X POST "http://localhost/wordpress/wp-admin/admin-ajax.php" -d "action=ascii_daemon_status" 2>/dev/null | head -c 200 || echo "Manual test required: activate plugin in WP admin"`
  - **Done when**: Plugin activates without PHP errors, menu appears
  - **Commit**: `feat(wp): complete POC core infrastructure`

## Phase 2: Admin UI

Focus: Control page, settings page, logs page with real UI templates.

- [ ] 2.1 Create control page template
  - **Do**:
    1. Create `admin/page-control.php` with HTML structure
    2. Add ASCII grid container (pre-formatted, monospace)
    3. Add directive posting form (title, content fields)
    4. Add directive queue table placeholder
    5. Add daemon status indicator area
    6. Add loading spinner and error toast containers
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-control.php`
  - **Done when**: Page renders with all UI sections visible
  - **Verify**: `grep -c "ascii-grid\|directive-form\|daemon-status" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-control.php`
  - **Commit**: `feat(wp): add control page template`
  - _Requirements: AC-1.1, AC-2.1, AC-3.1, AC-6.1_

- [ ] 2.2 Create settings page template
  - **Do**:
    1. Create `admin/page-settings.php` with form structure
    2. Add fields: polling_interval (1-60), grid_width (40-200), grid_height (10-60)
    3. Add fields: llm_endpoint (URL), llm_model (text)
    4. Add field: log_retention_days (1-365)
    5. Add field: daemon_enabled (checkbox)
    6. Use Settings API pattern with settings_fields() and do_settings_sections()
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-settings.php`
  - **Done when**: Settings form renders with current values, submit saves via WP Settings API
  - **Verify**: `grep -c "settings_fields\|do_settings_sections" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-settings.php`
  - **Commit**: `feat(wp): add settings page template`
  - _Requirements: AC-5.1 through AC-5.8_

- [ ] 2.3 Create logs page template
  - **Do**:
    1. Create `admin/page-logs.php` with table structure
    2. Add filter form (status dropdown, date range, search)
    3. Add logs table with columns: ID, Directive, Actions, Result, Timestamp
    4. Add pagination controls
    5. Add expandable row content for full directive details
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-logs.php`
  - **Done when**: Logs page renders with filter controls and table structure
  - **Verify**: `grep -c "filter-form\|logs-table\|pagination" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-logs.php`
  - **Commit**: `feat(wp): add logs page template`
  - _Requirements: AC-4.1 through AC-4.7_

- [ ] 2.4 [VERIFY] Quality checkpoint: All templates render without PHP errors
  - **Do**: PHP syntax check on all admin templates
  - **Verify**: `php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/*.php`
  - **Done when**: All templates pass syntax check
  - **Commit**: `chore(wp): pass quality checkpoint` (only if fixes needed)

- [ ] 2.5 Create JavaScript polling and UI logic
  - **Do**:
    1. Create `assets/js/control.js` with ASCIIControl module
    2. Implement `poll.start()` / `poll.stop()` with configurable interval
    3. Implement `view.render(data)` to update ASCII grid
    4. Implement `directive.submit()` for AJAX form posting
    5. Implement `directive.loadList()` to refresh queue table
    6. Implement `daemon.checkStatus()` for status badge updates
    7. Implement `ui.showToast(message, type)` for notifications
    8. Add Page Visibility API to pause polling when tab hidden
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/assets/js/control.js`
  - **Done when**: JS polls ASCII view every 2s, updates grid, handles form submit
  - **Verify**: `grep -c "poll\|view\|directive\|daemon\|showToast" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/assets/js/control.js`
  - **Commit**: `feat(wp): add JavaScript polling and UI logic`
  - _Requirements: AC-1.2, AC-2.5, AC-3.6, UI-4, UI-5_

- [ ] 2.6 Create CSS dark theme styles
  - **Do**:
    1. Create `assets/css/admin.css` with dark theme
    2. Style ASCII grid: monospace font, #1e1e1e bg, #d4d4d4 text
    3. Style status badges: pending (yellow), completed (green), failed (red), processing (gray)
    4. Style loading spinner and toast notifications
    5. Add responsive styles for 1024px+ screens
    6. Add focus states for accessibility
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/assets/css/admin.css`
  - **Done when**: Dark theme applies to control page, status badges color-coded
  - **Verify**: `grep -c "#1e1e1e\|monospace\|badge-pending\|badge-completed" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/assets/css/admin.css`
  - **Commit**: `feat(wp): add dark theme CSS styles`
  - _Requirements: UI-1, UI-2, UI-3, UI-6, UI-8_

- [ ] 2.7 Enqueue JS/CSS on plugin pages only
  - **Do**:
    1. Add `enqueue_assets($hook)` method to main class
    2. Check if current page is plugin page (ascii-control, settings, logs)
    3. wp_enqueue_script with jQuery dependency
    4. wp_localize_script with nonce and ajaxurl
    5. wp_enqueue_style for admin.css
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: JS/CSS only load on plugin pages, not all admin pages
  - **Verify**: `grep -c "admin_enqueue_scripts\|wp_localize_script" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): conditionally enqueue JS/CSS on plugin pages`
  - _Requirements: FR-11, TR-11_

- [ ] 2.8 [VERIFY] Quality checkpoint: JS and CSS load correctly
  - **Do**: Verify asset files exist and are syntactically valid
  - **Verify**: `ls -la /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/assets/js/control.js && ls -la /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/assets/css/admin.css`
  - **Done when**: All asset files exist with non-zero size
  - **Commit**: `chore(wp): pass quality checkpoint` (only if fixes needed)

## Phase 3: Polish and Security

Focus: Rate limiting, admin bar link, activation hooks, final verification.

- [ ] 3.1 Add rate limiting for ASCII view endpoint
  - **Do**:
    1. Add rate limit check in `ajax_get_view()` handler
    2. Use transient with key `ascii_rate_limit_{user_id}` set to 1 second
    3. Return 429 error if rate limit exceeded
    4. Add rate limit status to response headers
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: Max 1 ASCII view request per second per user enforced
  - **Verify**: `grep -c "rate_limit\|transient.*ascii_rate" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): add rate limiting for ASCII view endpoint`
  - _Requirements: NFR-12_

- [ ] 3.2 Add admin bar quick link
  - **Do**:
    1. Add `add_admin_bar_link()` method hooked to `admin_bar_menu`
    2. Add "ASCII Control" node linking to main control page
    3. Add daemon status indicator in node title (green dot/red dot)
    4. Position after site name
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: Admin bar shows "ASCII Control" link with status indicator
  - **Verify**: `grep -c "admin_bar_menu\|add_node.*ascii" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): add admin bar quick link`
  - _Requirements: UI-9_

- [ ] 3.3 Write activation/deactivation hooks
  - **Do**:
    1. Create `activate()` static method for register_activation_hook
    2. Flush rewrite rules for directive CPT
    3. Set default option values if not exists
    4. Create `deactivate()` static method for register_deactivation_hook
    5. Flush rewrite rules on deactivation
    6. Optionally clear transients on deactivation
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: Plugin activates with defaults, deactivates cleanly
  - **Verify**: `grep -c "register_activation_hook\|register_deactivation_hook\|flush_rewrite_rules" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(wp): add activation/deactivation hooks`
  - _Requirements: TR-9_

- [ ] 3.4 [VERIFY] Quality checkpoint: Full plugin syntax check
  - **Do**: Run PHP syntax check on entire plugin directory
  - **Verify**: `find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control -name "*.php" -exec php -l {} \; 2>&1 | grep -v "No syntax errors" | wc -l | xargs -I{} bash -c 'if [ {} -eq 0 ]; then exit 0; else exit 1; fi'`
  - **Done when**: Zero syntax errors
  - **Commit**: `chore(wp): pass quality checkpoint` (only if fixes needed)

- [ ] 3.5 Final integration test
  - **Do**:
    1. Verify plugin directory structure is complete
    2. Verify all required files exist
    3. Verify all AJAX handlers have nonce + capability checks
    4. Verify settings have sanitization callbacks
  - **Verify**: `find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control -type f | wc -l` (should be 9 files)
  - **Done when**: All 9 expected files exist, plugin activates without errors
  - **Commit**: `feat(wp): complete ASCII Desktop Control plugin`

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all quality verification commands
  - **Verify**:
    - PHP syntax: `find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control -name "*.php" -exec php -l {} \; 2>&1 | grep -v "No syntax errors" | wc -l`
    - File count: `find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control -type f | wc -l`
    - Security: `grep -c "check_ajax_referer\|current_user_can" /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: All commands pass (syntax=0 errors, files=9, security>=5)
  - **Commit**: `fix(wp): address quality issues` (if fixes needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch: `git branch --show-current`
    2. Stage files: `git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/`
    3. Commit: `git commit -m "feat(wp): add ASCII Desktop Control plugin"`
    4. Push: `git push -u origin feat/wp-mission-control-health`
    5. Create PR if needed
  - **Verify**: `git log -1 --oneline`
  - **Done when**: Changes committed to feature branch
  - **Commit**: None (this is the commit step)

## Phase 5: PR Lifecycle

- [ ] 5.1 Monitor CI and address failures
  - **Do**: Check CI status, fix any issues found
  - **Verify**: `git status` shows clean working tree
  - **Done when**: All CI checks pass or no CI configured
  - **Commit**: `fix(wp): address CI failures` (if fixes needed)

- [ ] 5.2 Final validation: AC checklist verification
  - **Do**: Read requirements.md, verify each acceptance criteria is implemented
  - **Verify**: `grep -c "AC-" /home/jericho/zion/projects/geometry_os/geometry_os/.auto-claude/specs/ascii-wp-plugin/requirements.md` (count total ACs)
  - **Done when**: All ACs traceable to implemented code
  - **Commit**: None

## Unresolved Questions

1. **Python script path configuration**: Currently hardcoded to `.gemini/skills/ascii-desktop-control/scripts/`. Should be configurable in settings for production.
2. **Display environment**: Currently assumes DISPLAY=:0. Multi-display systems may need configuration.

## Notes

- **POC shortcuts taken**: Hardcoded Python script paths, no WebSocket (AJAX polling only)
- **Production TODOs**:
  - Make Python script paths configurable
  - Add WebSocket support for real-time updates
  - Add directive scheduling feature
  - Add role-based permissions beyond manage_options
