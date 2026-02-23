---
spec: ascii-rest-api
phase: tasks
total_tasks: 22
created: 2026-02-22
---

# Tasks: ASCII REST API

## Execution Context

| Interview Topic | Response |
|-----------------|----------|
| Primary users | AI agents, external scripts |
| Priority tradeoffs | Security first - timing-safe comparison |
| Success criteria | All 5 endpoints return correct JSON, auth rejects invalid keys |
| Architecture style | Extend existing plugin patterns |
| Technology constraints | PHP 8.0+, WordPress REST API |
| Integration approach | Delegate to existing classes (ASCII_View, Directive_API, Daemon_Status) |
| Testing depth | Unit + integration + Python E2E |
| Deployment approach | Standard WordPress plugin update |
| Execution priority | Balanced - security and quality |

## Phase 1: Make It Work (POC)

Focus: Validate REST API and API key authentication work end-to-end. Skip edge cases, accept simple implementations.

- [x] 1.1 Create API_Keys class with generate/hash/store/validate methods
  - **Do**:
    1. Create `includes/class-api-keys.php`
    2. Define `OPTION_NAME` constant as `ascii_api_keys`
    3. Implement `generate()` using `wp_generate_password(32, false)` for alphanumeric key
    4. Implement `hash()` using `hash('sha256', $key)` for SHA256 storage
    5. Implement `store($name, $key_hash)` saving to wp_options with UUID, name, hash, created, last_used
    6. Implement `validate($key)` using `hash_equals()` for timing-safe comparison
    7. Implement `update_last_used($key_id)` to update timestamp on successful auth
    8. Implement `revoke($key_id)` to delete key from array
    9. Implement `get_all()` to return all keys without hashes
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-api-keys.php`
  - **Done when**: Module loads without error, all methods exist and are callable
  - **Verify**: `php -l wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-api-keys.php`
  - **Commit**: `feat(api): add API_Keys class for key generation and validation`
  - _Requirements: FR-1, FR-2, FR-3, AC-2.1, AC-2.3_
  - _Design: API_Keys Class_

- [x] 1.2 Create REST_API class with route registration
  - **Do**:
    1. Create `includes/class-rest-api.php`
    2. Define `NAMESPACE` constant as `ascii/v1`
    3. Implement `init()` to hook `rest_api_init`
    4. Implement `register_routes()` with 5 routes:
       - `GET /ascii/v1/view` -> `handle_get_view`
       - `GET /ascii/v1/status` -> `handle_get_status`
       - `POST /ascii/v1/directives` -> `handle_create_directive`
       - `GET /ascii/v1/directives` -> `handle_list_directives`
       - `GET /ascii/v1/directives/(?P<id>\d+)` -> `handle_get_directive`
    5. Implement `authenticate_request()` extracting key from header OR query param
    6. All routes require authentication via permission_callback
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`
  - **Done when**: Module loads, routes registered (check with WP-CLI or direct REST call)
  - **Verify**: `php -l wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`
  - **Commit**: `feat(api): add REST_API class with route registration`
  - _Requirements: FR-4, FR-5, FR-6, AC-1.1, AC-1.2_
  - _Design: REST_API Class_

- [x] 1.3 Implement authentication flow with timing-safe comparison
  - **Do**:
    1. In `REST_API.authenticate_request()`, extract API key from:
       - `X-API-Key` header via `$request->get_header('X-API-Key')`
       - `?api_key=` query param via `$request->get_param('api_key')`
    2. Call `API_Keys.validate($key)` with timing-safe comparison
    3. On valid key: call `update_last_used()`, return true for permission_callback
    4. On invalid/missing key: return `WP_Error('rest_forbidden', 'Invalid or missing API key', ['status' => 401])`
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`
  - **Done when**: Auth rejects invalid keys with 401, accepts valid keys
  - **Verify**: Manual curl test to endpoint with/without valid key
  - **Commit**: `feat(api): implement API key authentication with timing-safe comparison`
  - _Requirements: FR-3, FR-4, FR-5, FR-6, AC-1.1, AC-1.2, AC-1.3, AC-1.4_
  - _Design: Authentication Flow_

- [x] 1.4 Implement endpoint handlers delegating to existing classes
  - **Do**:
    1. Implement `handle_get_view()` delegating to `ASCII_View.get_view()`
    2. Implement `handle_get_status()` delegating to `Daemon_Status.get_status()`
    3. Implement `handle_create_directive()` delegating to `Directive_API.create()`
    4. Implement `handle_list_directives()` delegating to `Directive_API.get_recent()`
    5. Implement `handle_get_directive()` delegating to `Directive_API.get()`
    6. All handlers return `WP_REST_Response` with `success` wrapper
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`
  - **Done when**: All 5 endpoints callable via REST, return JSON responses
  - **Verify**: Manual curl test to each endpoint
  - **Commit**: `feat(api): implement all 5 REST endpoint handlers`
  - _Requirements: FR-7, FR-8, FR-9, FR-10, FR-11, AC-3.1 - AC-7.4_
  - _Design: Endpoints section_

- [x] 1.5 Integrate new classes into main plugin file
  - **Do**:
    1. Add `require_once` for `class-api-keys.php` and `class-rest-api.php` in `load_includes()`
    2. Add `API_Keys` and `REST_API` instance properties
    3. Add `get_api_keys()` and `get_rest_api()` getter methods
    4. Initialize `REST_API` on `rest_api_init` action hook
    5. Store `REST_API` instance for later reference
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: Plugin activates without error, REST routes registered
  - **Verify**: `php -l wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Commit**: `feat(plugin): integrate API_Keys and REST_API classes`
  - _Requirements: FR-7 - FR-11_
  - _Design: File Structure_

- [x] 1.6 [VERIFY] Quality checkpoint: PHP syntax and basic functionality
  - **Do**: Verify all new PHP files pass syntax check
  - **Verify**: `for f in wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-api-*.php; do php -l "$f"; done`
  - **Done when**: No syntax errors in any new file
  - **Commit**: `chore(api): pass POC quality checkpoint` (only if fixes needed)

- [x] 1.7 POC Checkpoint: End-to-end validation
  - **Do**:
    1. Generate API key via PHP: `$api_keys->generate(); $api_keys->store('test', $hash);`
    2. Test GET /ascii/v1/view with valid key - expect 200 with JSON
    3. Test GET /ascii/v1/view with invalid key - expect 401
    4. Test POST /ascii/v1/directives with valid key - expect 201 with id
    5. Test GET /ascii/v1/directives/{id} - expect 200 with directive data
  - **Verify**: Manual curl commands to live WordPress instance
  - **Done when**: All 5 endpoints respond correctly with auth
  - **Commit**: `feat(api): complete POC for REST API`

## Phase 2: Refactoring

- [x] 2.1 Add Admin UI section for API key management
  - **Do**:
    1. Modify `admin/page-settings.php` to add "API Keys" section after general settings
    2. Add table showing: Key Name, Created, Last Used, Revoke button
    3. Add "Generate New Key" button with form
    4. Add AJAX handlers for generate/revoke actions
    5. Add JavaScript for one-time key display modal with copy warning
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-settings.php`
  - **Done when**: Settings page shows API keys section with generate/revoke functionality
  - **Verify**: Load settings page in browser, verify UI elements present
  - **Commit**: `feat(admin): add API Keys management section to settings`
  - _Requirements: FR-12, AC-2.1 - AC-2.6_
  - _Design: Admin UI section_

- [ ] 2.2 Add AJAX handlers for key generation and revocation
  - **Do**:
    1. Add `wp_ajax_ascii_generate_api_key` handler in main plugin class
    2. Add `wp_ajax_ascii_revoke_api_key` handler in main plugin class
    3. Implement `ajax_generate_api_key()` calling `API_Keys.generate()` and `store()`
    4. Implement `ajax_revoke_api_key()` calling `API_Keys.revoke()`
    5. Add nonce verification and capability checks
    6. Return generated key in response for one-time display
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: AJAX endpoints work, key generation returns plain key for display
  - **Verify**: Browser dev tools network tab, verify AJAX responses
  - **Commit**: `feat(ajax): add API key generate/revoke handlers`
  - _Requirements: FR-12, AC-2.2, AC-2.5_
  - _Design: Admin UI section_

- [ ] 2.3 Improve error handling for edge cases
  - **Do**:
    1. Handle empty API keys array in `validate()` - return null
    2. Handle concurrent key generation - UUID prevents collisions
    3. Handle special characters in query param - document URL encoding
    4. Handle non-numeric directive ID - return 400 with error
    5. Handle limit > 100 in list_directives - clamp to 100
    6. Handle limit < 1 - default to 10
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`, `includes/class-api-keys.php`
  - **Done when**: Edge cases return proper HTTP status codes
  - **Verify**: Manual curl tests with edge case inputs
  - **Commit**: `refactor(api): add edge case handling`
  - _Requirements: AC-6.2, AC-7.2_
  - _Design: Edge Cases section_

- [ ] 2.4 [VERIFY] Quality checkpoint: refactored code passes tests
  - **Do**: Run syntax check on all modified files
  - **Verify**: `php -l wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-api-keys.php && php -l wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php && php -l wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`
  - **Done when**: No syntax errors
  - **Commit**: `chore(api): pass refactoring quality checkpoint` (only if fixes needed)

## Phase 3: Testing

- [ ] 3.1 Write PHP unit tests for API_Keys class
  - **Do**:
    1. Create `tests/php/class-test-api-keys.php`
    2. Write `test_generate_returns_32_chars()` verifying length and alphanumeric
    3. Write `test_hash_is_sha256()` verifying 64-char hex output
    4. Write `test_store_creates_entry()` verifying wp_options update
    5. Write `test_validate_returns_key_data()` with valid key
    6. Write `test_validate_rejects_invalid()` with invalid key
    7. Write `test_hash_equals_timing_safe()` verifying hash_equals usage
    8. Write `test_revoke_removes_key()` verifying deletion
    9. Write `test_update_last_used()` verifying timestamp update
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-api-keys.php`
  - **Done when**: All 8 tests pass
  - **Verify**: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php class-test-api-keys.php`
  - **Commit**: `test(api): add unit tests for API_Keys class`
  - _Requirements: FR-1, FR-2, FR-3, AC-2.1 - AC-2.6_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.2 Write PHP unit tests for REST_API class
  - **Do**:
    1. Create `tests/php/class-test-rest-api.php`
    2. Write `test_missing_key_returns_401()` without any auth
    3. Write `test_invalid_key_returns_401()` with wrong key
    4. Write `test_valid_key_proceeds()` with valid key
    5. Write `test_header_and_query_param_auth()` testing both methods
    6. Write `test_get_view_endpoint()` verifying response structure
    7. Write `test_get_status_endpoint()` verifying response structure
    8. Write `test_create_directive_endpoint()` verifying 201 response
    9. Write `test_list_directives_pagination()` verifying limit param
    10. Write `test_get_directive_404()` with non-existent ID
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-rest-api.php`
  - **Done when**: All 9 tests pass
  - **Verify**: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php class-test-rest-api.php`
  - **Commit**: `test(api): add unit tests for REST_API class`
  - _Requirements: FR-4 - FR-11, AC-1.1 - AC-7.4_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.3 Create Python integration test script
  - **Do**:
    1. Create `tests/python/test_rest_api.py`
    2. Add argparse for `--url` and `--key` CLI arguments
    3. Write `test_invalid_key_rejection()` expecting 401
    4. Write `test_get_view()` expecting 200 with ascii/bindings
    5. Write `test_get_status()` expecting 200 with running/pid
    6. Write `test_create_directive()` expecting 201 with id
    7. Write `test_list_directives()` expecting array with pagination
    8. Write `test_get_directive()` expecting full directive data
    9. Write `test_full_crud_cycle()` doing create -> get -> list
    10. Exit with code 0 on success, 1 on failure
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/python/test_rest_api.py`
  - **Done when**: Script runs and all tests pass against live WP
  - **Verify**: `python3 wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/python/test_rest_api.py --url http://localhost:8080 --key <test_key>`
  - **Commit**: `test(api): add Python integration test script`
  - _Requirements: FR-13, AC-8.1 - AC-8.5_
  - _Design: Test Strategy - Integration Tests_

- [ ] 3.4 [VERIFY] Quality checkpoint: all tests pass
  - **Do**: Run all unit and integration tests
  - **Verify**: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
  - **Done when**: All PHP tests pass
  - **Commit**: `chore(api): pass testing quality checkpoint` (only if fixes needed)

## Phase 4: Quality Gates

- [ ] 4.1 Run full PHP syntax validation
  - **Do**:
    1. Run php -l on all new PHP files
    2. Run php -l on all modified PHP files
    3. Ensure declare(strict_types=1) in all new files
    4. Ensure ABSPATH check at file top
  - **Verify**: `find wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control -name "*.php" -exec php -l {} \; | grep -v "No syntax errors"`
  - **Done when**: No syntax errors in any PHP file
  - **Commit**: `chore(api): fix syntax issues` (only if fixes needed)

- [ ] 4.2 Update README with API documentation
  - **Do**:
    1. Document all 5 endpoints with request/response examples
    2. Document authentication methods (header + query param)
    3. Document API key generation via admin UI
    4. Document error response format
    5. Add curl examples for each endpoint
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/README.md`
  - **Done when**: README explains all REST API features with examples
  - **Verify**: `grep -q "GET /ascii/v1/view" wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/README.md`
  - **Commit**: `docs(api): add REST API documentation to README`
  - _Requirements: NFR-6, NFR-7_
  - _Design: Documentation_

- [ ] 4.3 Final verification: all tests pass
  - **Do**:
    1. Run all PHP unit tests
    2. Run Python integration tests against local WordPress
    3. Verify no regressions in existing plugin functionality
    4. Verify admin UI works in browser
  - **Verify**: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
  - **Done when**: All tests green, no errors
  - **Commit**: None

## Phase 5: PR Lifecycle

- [ ] 5.1 Create PR and verify CI
  - **Do**:
    1. Verify on feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/ascii-rest-api`
    3. Create PR: `gh pr create --title "feat(api): add REST API with API key authentication" --body "$(cat <<'EOF'
## Summary
- Add REST API endpoints for ASCII Desktop Control with API key authentication
- 5 endpoints: GET view, GET status, POST directives, GET directives, GET directives/{id}
- API key management via WordPress admin settings UI
- Timing-safe key validation using hash_equals()
- Python integration test script for E2E validation

## Test Plan
- [ ] Unit tests for API_Keys class pass (8 tests)
- [ ] Unit tests for REST_API class pass (9 tests)
- [ ] Python integration tests pass (5+ tests)
- [ ] Manual browser test of admin UI
- [ ] curl tests for all endpoints

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"`
    4. Wait for CI: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: All CI checks pass
  - **Commit**: None

- [ ] 5.2 Final AC verification
  - **Do**:
    1. Verify AC-1.1: X-API-Key header auth works
    2. Verify AC-1.2: api_key query param auth works
    3. Verify AC-1.3: Invalid key returns 401
    4. Verify AC-2.1: Generate creates 32-char key
    5. Verify AC-2.3: Keys stored as SHA256 hash
    6. Verify AC-5.1: POST /directives creates directive
    7. Verify AC-6.1: GET /directives returns array
    8. Verify AC-7.1: GET /directives/{id} returns directive
  - **Verify**: `python3 wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/python/test_rest_api.py --url <wp_url> --key <test_key>`
  - **Done when**: All acceptance criteria met
  - **Commit**: None

## Notes

**POC shortcuts taken:**
- Simple key storage in wp_options (no separate table)
- No rate limiting beyond WordPress defaults
- No scoped permissions (all keys have full access)
- Admin UI uses existing settings page pattern

**Production TODOs:**
- Consider rate limiting per API key
- Consider key expiration dates
- Consider scoped/permission-based keys
- Add audit logging for API requests
- Consider API versioning strategy

## Unresolved Questions

None - all design decisions resolved in design.md.
