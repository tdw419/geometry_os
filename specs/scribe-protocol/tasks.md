---
spec: scribe-protocol
phase: tasks
total_tasks: 18
created: 2026-02-23
---

# Tasks: Scribe Protocol

## Overview

Implementation completes the remaining ~10% of Scribe Protocol: frontend UI (shortcodes, chat widget), singleton fix for WOR_Scribe_API, and verification of cron handlers. Backend classes (WOR_Scribe_DB, WOR_Scribe_Portal, WOR_Transmission_Session, WOR_Mentor_Data_Pipeline) are already complete.

**Plugin Path**: `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/`

## Phase 1: Make It Work (POC)

Focus: Validate end-to-end functionality. Skip tests, accept hardcoded values where reasonable.

- [ ] 1.1 Fix WOR_Scribe_API singleton pattern
  - **Do**:
    1. Add `private static $instance = null` property
    2. Add `public static function get_instance(): self` method
    3. Change `public function __construct()` to `private function __construct()`
    4. Add helper function `function WOR_Scribe_API(): WOR_Scribe_API { return WOR_Scribe_API::get_instance(); }`
    5. Update `init_rest_api()` in main plugin to use `WOR_Scribe_API::get_instance()` instead of `new WOR_Scribe_API()`
  - **Files**:
    - `api/class-scribe-api.php` (modify)
    - `world-of-rectification.php` (modify line 69)
  - **Done when**: Class follows singleton pattern matching `WOR_Quest_API`
  - **Verify**: `grep -A5 "private static.*instance" api/class-scribe-api.php | head -6`
  - **Commit**: `fix(wor): add singleton pattern to WOR_Scribe_API`
  - _Requirements: AC-1.1, AC-4.3_
  - _Design: Component Interfaces - WOR_Scribe_API_

- [ ] 1.2 Create class-scribe-shortcodes.php with dashboard shortcode
  - **Do**:
    1. Create `includes/class-scribe-shortcodes.php` with singleton pattern
    2. Add `[wor_scribe_dashboard]` shortcode registration
    3. Implement `render_dashboard()`:
       - Check if user is logged in, show login link if not
       - Check if user is registered scribe via `WOR_Scribe_Portal`
       - If not registered, show registration form with cohort select
       - If registered but onboarding incomplete, show onboarding progress
       - If certified, show waiting Sprout queue + session history
    4. Add `render_registration_form()` helper
    5. Add `render_onboarding_progress()` helper
  - **Files**:
    - `includes/class-scribe-shortcodes.php` (create)
  - **Done when**: Shortcode renders different states based on user status
  - **Verify**: `php -l includes/class-scribe-shortcodes.php`
  - **Commit**: `feat(wor): add scribe dashboard shortcode`
  - _Requirements: US-9, AC-9.1 to AC-9.5_
  - _Design: Component Interfaces - WOR_Scribe_Dashboard_

- [ ] 1.3 Add help button shortcode
  - **Do**:
    1. Add `[wor_help_button]` shortcode to `class-scribe-shortcodes.php`
    2. Implement `render_button($quest_id)`:
       - Render floating help button with quest_id attribute
       - Include data attributes for quest_id, rest_url, nonce
       - Button triggers chat widget on click
    3. Add `enqueue_chat_widget()` method to enqueue JS/CSS when shortcode used
  - **Files**:
    - `includes/class-scribe-shortcodes.php` (modify)
  - **Done when**: Shortcode renders clickable help button
  - **Verify**: `grep -c "wor_help_button" includes/class-scribe-shortcodes.php`
  - **Commit**: `feat(wor): add help button shortcode`
  - _Requirements: US-10, AC-10.1, AC-10.2_
  - _Design: Component Interfaces - WOR_Help_Button_

- [ ] 1.4 [VERIFY] Quality checkpoint: PHP syntax
  - **Do**: Run PHP lint on all modified files
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && php -l api/class-scribe-api.php && php -l includes/class-scribe-shortcodes.php && php -l world-of-rectification.php`
  - **Done when**: No syntax errors
  - **Commit**: `chore(wor): pass PHP syntax checkpoint` (only if fixes needed)

- [ ] 1.5 Create chat widget JavaScript
  - **Do**:
    1. Create `assets/js/wor-chat-widget.js` as jQuery IIFE
    2. Implement `WoRChatWidget.init(options)`:
       - Store restUrl, nonce, transmissionId, sproutId
       - Set up polling interval (2s)
    3. Implement `requestHelp(questId, topic)`:
       - POST to `/wor/v1/transmission/request`
       - Show waiting state with queue position
    4. Implement `pollMessages(lastId)`:
       - GET to `/wor/v1/transmission/{id}/messages?last={id}`
       - Append new messages to chat container
       - Return updated last_id
    5. Implement `sendMessage(message, senderType)`:
       - POST to `/wor/v1/transmission/{id}/send`
    6. Implement `endSession(rating, feedback)`:
       - POST to `/wor/v1/transmission/{id}/end`
       - Show rating form on success
    7. Implement UI render methods: `renderWaitingState()`, `renderChatState()`, `renderRatingForm()`
  - **Files**:
    - `assets/js/wor-chat-widget.js` (create)
  - **Done when**: Widget exposes all required methods
  - **Verify**: `grep -c "WoRChatWidget" assets/js/wor-chat-widget.js`
  - **Commit**: `feat(wor): add chat widget JavaScript`
  - _Requirements: US-5, US-6, AC-5.1 to AC-5.7, AC-6.1_
  - _Design: Component Interfaces - Chat Widget JavaScript_

- [ ] 1.6 Create chat widget CSS
  - **Do**:
    1. Create `assets/css/wor-chat.css`
    2. Style chat modal overlay (fixed position, centered)
    3. Style chat header (title, close button)
    4. Style message container (scrollable, max-height)
    5. Style message bubbles (scribe left, sprout right, system center)
    6. Style input area (text field, send button)
    7. Style waiting state (spinner, queue position)
    8. Style rating form (star inputs, feedback textarea)
    9. Add responsive mobile styles
  - **Files**:
    - `assets/css/wor-chat.css` (create)
  - **Done when**: Chat widget has complete visual styling
  - **Verify**: `test -f assets/css/wor-chat.css && wc -l assets/css/wor-chat.css`
  - **Commit**: `feat(wor): add chat widget CSS`
  - _Requirements: AC-9.6, AC-10.4_
  - _Design: File Structure_

- [ ] 1.7 Wire shortcodes in main plugin file
  - **Do**:
    1. Add `require_once WOR_PATH . 'includes/class-scribe-shortcodes.php';` in `load_dependencies()`
    2. Initialize shortcodes on `plugins_loaded` via `init_shortcodes()` method
    3. Enqueue chat widget assets when shortcodes present via `wp_enqueue_scripts`
    4. Localize `wor-chat-widget` script with `restUrl`, `nonce`, `isLoggedIn`, `userId`
  - **Files**:
    - `world-of-rectification.php` (modify)
  - **Done when**: Shortcodes registered and assets enqueued
  - **Verify**: `grep -c "class-scribe-shortcodes" world-of-rectification.php`
  - **Commit**: `feat(wor): wire scribe shortcodes in main plugin`
  - _Requirements: US-9, US-10_
  - _Design: File Structure_

- [ ] 1.8 [VERIFY] Quality checkpoint: PHP syntax all files
  - **Do**: Run PHP lint on all plugin PHP files
  - **Verify**: `find . -name "*.php" -exec php -l {} \; 2>&1 | grep -v "No syntax errors"`
  - **Done when**: No errors output
  - **Commit**: `chore(wor): pass PHP syntax checkpoint` (only if fixes needed)

- [ ] 1.9 Verify cron handlers exist and are wired
  - **Do**:
    1. Check `wor_classify_message_intent` action is registered (line 163-167 in main plugin)
    2. Check `wor_queue_transmission_for_training` action is registered (line 172-176)
    3. Check `wor_cleanup_stale_sessions` action is registered (line 181-198)
    4. Verify cleanup cron scheduled on activation (line 145-147)
    5. Verify cleanup cron cleared on deactivation (line 156-158)
  - **Files**:
    - `world-of-rectification.php` (verify only)
  - **Done when**: All three cron handlers present and wired
  - **Verify**: `grep -c "add_action.*wor_" world-of-rectification.php`
  - **Commit**: None (verification only)
  - _Requirements: US-7, FR-11, FR-12_
  - _Design: Async Processing_

- [ ] 1.10 POC Checkpoint: Manual API verification
  - **Do**:
    1. Verify PHP syntax passes on all files
    2. Verify shortcode classes follow singleton pattern
    3. Verify chat widget JS has required methods
  - **Done when**: All POC tasks complete, syntax validated
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && find . -name "*.php" -exec php -l {} \; 2>&1 | grep -c "No syntax errors" | xargs -I{} sh -c 'test {} -ge 15 && echo "PASS" || echo "FAIL"'`
  - **Commit**: `feat(wor): complete scribe protocol POC`

## Phase 2: Refactoring

- [ ] 2.1 Add proper error handling to shortcodes
  - **Do**:
    1. Add try/catch around database calls in shortcodes
    2. Return user-friendly error messages
    3. Log errors to WordPress debug log
  - **Files**:
    - `includes/class-scribe-shortcodes.php` (modify)
  - **Done when**: Errors handled gracefully, no PHP warnings
  - **Verify**: `grep -c "error_log\|wp_send_json_error" includes/class-scribe-shortcodes.php`
  - **Commit**: `refactor(wor): add error handling to shortcodes`
  - _Design: Error Handling_

- [ ] 2.2 Add nonce verification to chat widget AJAX
  - **Do**:
    1. Add nonce header to all fetch requests in chat widget
    2. Verify nonce on server-side where applicable
  - **Files**:
    - `assets/js/wor-chat-widget.js` (modify)
  - **Done when**: All POST requests include nonce
  - **Verify**: `grep -c "X-WP-Nonce" assets/js/wor-chat-widget.js`
  - **Commit**: `refactor(wor): add nonce verification to chat widget`
  - _Design: Security Considerations_

- [ ] 2.3 [VERIFY] Quality checkpoint: PHP syntax + file structure
  - **Do**: Verify all files exist and pass syntax check
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && ls -la includes/class-scribe-shortcodes.php assets/js/wor-chat-widget.js assets/css/wor-chat.css && find . -name "*.php" -exec php -l {} \; 2>&1 | grep -v "No syntax errors"`
  - **Done when**: All files present, no syntax errors
  - **Commit**: `chore(wor): pass refactoring checkpoint` (only if fixes needed)

## Phase 3: Testing

- [ ] 3.1 Create unit tests for WOR_Scribe_Portal
  - **Do**:
    1. Create `tests/phpunit/test-scribe-portal.php`
    2. Test `register_scribe()` - duplicate check, valid cohort
    3. Test `complete_step()` - quiz grading, step advancement
    4. Test `get_onboarding_flow()` - returns correct flow per cohort
    5. Test `grade_quiz()` - passing and failing scores
  - **Files**:
    - `tests/phpunit/test-scribe-portal.php` (create)
  - **Done when**: Tests cover main registration and onboarding logic
  - **Verify**: `test -f tests/phpunit/test-scribe-portal.php && grep -c "function test_" tests/phpunit/test-scribe-portal.php`
  - **Commit**: `test(wor): add unit tests for WOR_Scribe_Portal`
  - _Requirements: AC-1.2, AC-2.5, AC-2.6, AC-2.7_
  - _Design: Test Strategy_

- [ ] 3.2 Create unit tests for WOR_Transmission_Session
  - **Do**:
    1. Create `tests/phpunit/test-transmission-session.php`
    2. Test `request_help()` - queue addition, duplicate session check
    3. Test `accept_sprout()` - race condition simulation, eligibility check
    4. Test `send_message()` - empty message rejection, inactive session
    5. Test `poll_messages()` - pagination via last_id
    6. Test `end_transmission()` - status update, duration calculation
  - **Files**:
    - `tests/phpunit/test-transmission-session.php` (create)
  - **Done when**: Tests cover transmission lifecycle
  - **Verify**: `test -f tests/phpunit/test-transmission-session.php && grep -c "function test_" tests/phpunit/test-transmission-session.php`
  - **Commit**: `test(wor): add unit tests for WOR_Transmission_Session`
  - _Requirements: AC-3.1 to AC-3.6, AC-4.1 to AC-4.7, AC-5.1 to AC-5.7, AC-6.1 to AC-6.7_
  - _Design: Test Strategy_

- [ ] 3.3 Create unit tests for WOR_Mentor_Data_Pipeline
  - **Do**:
    1. Create `tests/phpunit/test-mentor-data-pipeline.php`
    2. Test `classify_intent()` - pattern matching for each intent type
    3. Test `export_transmission()` - JSON format validation
    4. Test `get_training_stats()` - returns expected structure
  - **Files**:
    - `tests/phpunit/test-mentor-data-pipeline.php` (create)
  - **Done when**: Tests cover intent classification and export
  - **Verify**: `test -f tests/phpunit/test-mentor-data-pipeline.php && grep -c "function test_" tests/phpunit/test-mentor-data-pipeline.php`
  - **Commit**: `test(wor): add unit tests for WOR_Mentor_Data_Pipeline`
  - _Requirements: AC-7.1 to AC-7.5, AC-8.1 to AC-8.5_
  - _Design: Test Strategy_

- [ ] 3.4 [VERIFY] Quality checkpoint: Tests exist
  - **Do**: Verify all test files created with test methods
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/tests/phpunit && ls -la test-scribe*.php test-transmission*.php test-mentor*.php 2>/dev/null && grep -c "function test_" *.php 2>/dev/null | head -5`
  - **Done when**: 3 test files with multiple test methods each
  - **Commit**: `chore(wor): pass test creation checkpoint` (only if fixes needed)

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run ALL quality checks locally
  - **Verify**:
    - `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && find . -name "*.php" -exec php -l {} \; 2>&1 | grep -v "No syntax errors"`
  - **Done when**: Zero syntax errors
  - **Commit**: `fix(wor): address lint issues` (if fixes needed)

- [ ] 4.2 Verify file structure complete
  - **Do**: Confirm all required files exist
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && ls -la includes/class-scribe-shortcodes.php api/class-scribe-api.php assets/js/wor-chat-widget.js assets/css/wor-chat.css`
  - **Done when**: All 4 files present
  - **Commit**: None

- [ ] 4.3 Verify singleton pattern consistency
  - **Do**: Confirm WOR_Scribe_API follows same pattern as WOR_Quest_API
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && grep -A10 "get_instance" api/class-scribe-api.php | head -12`
  - **Done when**: Has `private static $instance`, `get_instance()`, private constructor
  - **Commit**: None

- [ ] 4.4 Verify cron handlers
  - **Do**: Confirm all three cron actions registered
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && grep "add_action.*wor_" world-of-rectification.php | wc -l`
  - **Done when**: Count >= 3
  - **Commit**: None

## Phase 5: PR Lifecycle

- [ ] 5.1 Verify feature branch and commit all changes
  - **Do**:
    1. Verify on feature branch: `git branch --show-current`
    2. Stage changes: `git add -A`
    3. Create commit: `git commit -m "feat(wor): complete scribe protocol implementation"`
  - **Verify**: `git status --porcelain` returns empty
  - **Done when**: All changes committed
  - **Commit**: `feat(wor): complete scribe protocol implementation`

- [ ] 5.2 Push and create PR
  - **Do**:
    1. Push branch: `git push -u origin feat/scribe-protocol` (or current branch name)
    2. Create PR: `gh pr create --title "feat(wor): Scribe Protocol - Expert-in-the-loop mentorship system" --body "$(cat <<'EOF'
## Summary
- Add singleton pattern to WOR_Scribe_API for consistency
- Create `[wor_scribe_dashboard]` shortcode for Scribe dashboard UI
- Create `[wor_help_button]` shortcode for Sprout help request
- Create chat widget JavaScript with 2s polling
- Create chat widget CSS with responsive styling
- Verify cron handlers for intent classification and session cleanup

## Test plan
- [ ] PHP syntax passes on all files
- [ ] Shortcodes render correct states (unregistered, onboarding, certified)
- [ ] Chat widget JS exposes required methods
- [ ] Singleton pattern matches WOR_Quest_API
- [ ] Cron handlers registered in main plugin file

## Acceptance Criteria Coverage
- US-1: Scribe Registration (backend complete)
- US-2: Cohort-Based Onboarding (backend complete)
- US-3: Sprout Help Request (backend complete)
- US-4: Scribe Accepts Help Request (backend complete)
- US-5: Real-Time Chat (chat widget added)
- US-6: Session Completion (chat widget added)
- US-7: Intent Classification (cron handler verified)
- US-8: Training Data Export (backend complete)
- US-9: Scribe Dashboard UI (shortcode added)
- US-10: Sprout Help Button (shortcode + widget added)

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"`
  - **Verify**: `gh pr checks` shows PR created
  - **Done when**: PR URL returned
  - **Commit**: None

- [ ] 5.3 Final verification
  - **Do**: Run final quality gate checks
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification && find . -name "*.php" -exec php -l {} \; 2>&1 | grep -v "No syntax errors" | wc -l | xargs -I{} sh -c 'test {} -eq 0 && echo "PASS: All PHP files valid" || echo "FAIL: Syntax errors found"'`
  - **Done when**: "PASS" output
  - **Commit**: None

---

## Unresolved Questions

1. **Rating threshold**: Requirements say 3.5/5 - should this be configurable via admin settings?
2. **Export format**: JSON with `{metadata, messages[]}` - add JSONL option for OpenAI fine-tuning?
3. **Scribe revocation**: If rating drops, auto-revoke certification? Manual admin action?
4. **Cross-session history**: Should Sprout see previous sessions with same Scribe?

## Notes

**POC shortcuts taken:**
- No actual browser testing (PHP syntax only)
- Chat widget polling uses hardcoded 2s interval
- No ML-based intent classification (regex patterns only)
- Queue stored in wp_options (not Redis)

**Production TODOs:**
- Add admin settings page for rating threshold, queue timeout
- Consider WebSocket upgrade for chat transport
- Add rate limiting per-user
- Add JSONL export option for OpenAI fine-tuning
- Consider Redis for queue storage at scale

**Implementation Notes:**
- Backend ~90% complete: DB tables, WOR_Scribe_Portal, WOR_Transmission_Session, WOR_Mentor_Data_Pipeline all exist
- WOR_Scribe_API missing singleton - fixed in 1.1
- Cron handlers already exist in main plugin file - verified in 1.9
- Chat widget uses jQuery IIFE pattern matching existing wor-game.js
