---
spec: claude-conversations-importer
phase: tasks
total_tasks: 14
created: 2026-02-21T10:00:00Z
---

# Tasks: claude-conversations-importer

## Execution Context

**Interview Responses:**
- Testing depth: Standard - unit + integration
- Deployment approach: Standard CI/CD pipeline
- Execution priority: Ship fast - POC first, polish later

**Research Findings:**
- 315 JSONL sessions (~194K lines) in geometry-os project
- Assistant messages use content array with `type: "thinking"` and `type: "text"` blocks
- Session ID extracted from filename (basename without .jsonl)
- Batch import of 50 sessions recommended to avoid PHP timeout
- Quality commands: `php -l` for lint, no PHPUnit in project

---

## Phase 1: Make It Work (POC)

Focus: Validate import works end-to-end. Skip tests, accept hardcoded paths.

### Task 1.1: [x] Plugin Skeleton with Admin Page

**Do:**
1. Create plugin directory `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/`
2. Create `claude-conversations.php` with:
   - Plugin header (Name, Description, Version, Author)
   - `if (!defined('ABSPATH')) exit;` guard
   - `Claude_Conversations_Admin` class with constructor
   - `add_menu_page()` hook for "Claude Chats" admin menu
   - Basic `render_page()` method showing status
3. Initialize class at bottom of file

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- Plugin appears in WordPress admin > Plugins
- "Claude Chats" menu item visible in sidebar
- Admin page renders without PHP errors

**Verify:**
```bash
php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php
# Manual: Activate plugin in WordPress admin, click Claude Chats menu
```

**Commit:** `feat(claude-conversations): add plugin skeleton with admin page`

_Requirements: FR-1_
_Design: Claude_Conversations_Admin_

---

### Task 1.2: [x] JSONL Parser Class

**Do:**
1. Add `Claude_JsonlParser` class to main plugin file
2. Implement `__construct(string $filepath)` - store filepath
3. Implement `parse(): array|WP_Error`:
   - Read JSONL file line by line
   - Decode each line with `json_decode()`, skip malformed
   - Filter entries where `type === 'user'` or `type === 'assistant'`
   - Extract user messages from `message.content` (string or text blocks)
   - Extract assistant messages from `message.content[]` array (text and thinking blocks)
   - Extract metadata: sessionId (from filename), cwd, gitBranch, timestamps
4. Implement `extract_title(array $conversation): string` - first 80 chars of first user message

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- Parser successfully reads test JSONL file
- Returns structured array with session_id, messages, thinking, metadata
- Handles malformed JSON gracefully (skips bad lines)

**Verify:**
```bash
# Test via admin page "Test Parse" button (Task 1.5)
# Or manual PHP test:
php -r "
require_once '/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php';
\$parser = new Claude_JsonlParser(glob(getenv('HOME') . '/.claude/projects/-home-jericho-zion-projects-geometry-os-geometry-os/*.jsonl')[0]);
\$result = \$parser->parse();
echo 'Session ID: ' . \$result['session_id'] . PHP_EOL;
echo 'Messages: ' . count(\$result['messages']) . PHP_EOL;
echo 'Thinking blocks: ' . count(\$result['thinking']) . PHP_EOL;
"
```

**Commit:** `feat(claude-conversations): add JSONL parser with thinking block extraction`

_Requirements: FR-2_
_Design: Claude_JsonlParser_

---

### Task 1.3: [x] HTML Formatter Class

**Do:**
1. Add `Claude_HtmlFormatter` class to main plugin file
2. Implement `format(array $conversation): string`:
   - Call `format_metadata()` for header section
   - Loop through messages, call `format_message()` for each
   - Call `format_thinking()` for thinking blocks
3. Implement `format_metadata(array $meta): string` - project path, branch, timestamps
4. Implement `format_message(array $msg): string`:
   - User: blue left border, `<div class="claude-msg-user">`
   - Assistant: green left border, `<div class="claude-msg-assistant">`
   - Call `format_code_blocks()` for content
5. Implement `format_thinking(array $think): string` - blockquote with brain emoji
6. Implement `format_code_blocks(string $content): string`:
   - Convert ```language blocks to `<pre><code class="language-X">`
   - Convert inline `code` to `<code>`
7. Implement `format_markdown(string $content): string` - bold, italic
8. Implement `get_css(): string` - inline CSS for styling

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- Formatter produces valid HTML from parsed conversation
- Code blocks have `<pre><code class="language-X">` structure
- Thinking blocks formatted as blockquotes with brain emoji
- Role-based styling classes applied

**Verify:**
```bash
php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php
# Manual: Check "Test Parse" output shows formatted HTML
```

**Commit:** `feat(claude-conversations): add HTML formatter with code highlighting`

_Requirements: FR-3_
_Design: Claude_HtmlFormatter_

---

### Task 1.4: [x] Import Engine Class

**Do:**
1. Add `Claude_Importer` class to main plugin file
2. Implement `import_all(string $claude_dir): array`:
   - Glob all `.jsonl` files from all project subdirectories
   - Loop through files, call `import_session()` for each
   - Return stats array: imported, skipped, errors count
3. Implement `import_session(string $filepath, string $project): array`:
   - Extract session_id from filename (basename without .jsonl)
   - Check `find_existing_post()` - skip if exists
   - Parse file with `Claude_JsonlParser`
   - Format with `Claude_HtmlFormatter`
   - Call `create_post()` with formatted content
4. Implement `find_existing_post(string $session_id): int|false`:
   - Query posts with `_claude_session_id` meta
5. Implement `create_post(...)`:
   - `wp_insert_post()` with title, content, category
   - `update_post_meta()` for `_claude_session_id` and metadata
6. Implement `ensure_category(): int`:
   - Get or create "Claude Conversations" category

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- Import creates WordPress posts from JSONL files
- Duplicate detection works (session_id in post_meta)
- Stats returned accurately (imported/skipped/errors)

**Verify:**
```bash
# Run import from admin page, verify posts created in WordPress
# Check post_meta for _claude_session_id
```

**Commit:** `feat(claude-conversations): add import engine with duplicate detection`

_Requirements: FR-4_
_Design: Claude_Importer_

---

### Task 1.5: [x] Complete Admin UI with Actions

**Do:**
1. Update `Claude_Conversations_Admin::render_page()`:
   - Display Claude directory path (`~/.claude/projects/`)
   - Show session count (glob all .jsonl files)
   - Show imported count (posts with `_claude_session_id` meta)
   - Add "Import All Sessions" form with nonce
   - Add "Test Parse First Session" form with nonce
2. Implement `handle_import()`:
   - Verify nonce with `check_admin_referer()`
   - Check `manage_options` capability
   - Call `Claude_Importer::import_all()`
   - Display admin notice with stats
3. Implement `test_parse()`:
   - Find first .jsonl file
   - Parse with `Claude_JsonlParser`
   - Format with `Claude_HtmlFormatter`
   - Display preview in admin page
4. Hook actions in constructor

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- Admin page shows session/imported counts
- "Import All Sessions" button triggers import
- "Test Parse First Session" shows formatted preview
- Success/error notices display after actions

**Verify:**
```bash
php -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php
# Manual: Click "Test Parse First Session" in admin, verify preview shows
# Manual: Click "Import All Sessions", verify posts created
```

**Commit:** `feat(claude-conversations): complete admin UI with import actions`

_Requirements: FR-6, US-1_
_Design: Claude_Conversations_Admin_

---

### Task 1.6: [x] Prism.js Frontend Integration

**Do:**
1. Add `claude_conversations_enqueue_prism()` function
2. Hook to `wp_enqueue_scripts`
3. Check if post has "Claude Conversations" category
4. If yes, enqueue:
   - Prism CSS from cdnjs: `https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-tomorrow.min.css`
   - Prism JS from cdnjs: `https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js`
   - Language components: python, bash, javascript, rust
5. Add inline CSS for message styling (call `Claude_HtmlFormatter::get_css()`)

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- Prism.js loads on Claude Conversation posts only
- Code blocks display with syntax highlighting
- Message styling applied (blue/green borders)

**Verify:**
```bash
# Manual: View imported post in frontend
# Check network tab for prism.css and prism.js loads
# Verify code blocks have syntax highlighting
```

**Commit:** `feat(claude-conversations): add Prism.js syntax highlighting`

_Requirements: FR-5, US-2_
_Design: PrismLoader_

---

### Task 1.7: [x] POC Checkpoint - End-to-End Import

**Do:**
1. Verify plugin activates without errors
2. Run "Test Parse First Session" - confirm preview displays
3. Run "Import All Sessions" - confirm stats shown
4. View imported post on frontend - confirm formatting
5. Verify code blocks have Prism.js highlighting
6. Verify thinking blocks visible as blockquotes
7. Run second import - confirm "Already Imported" count shows duplicates skipped

**Files:**
- None (verification task)

**Done when:**
- Full import flow works from admin to frontend
- Duplicate detection prevents re-import
- All 315 sessions importable (may take 60+ seconds)

**Verify:**
```bash
# Manual E2E verification in WordPress admin + frontend
# Check imported post count in wp_posts
curl -s http://localhost:8080/wp-json/wp/v2/posts?categories=CLAUDE_CONVERSATIONS_CAT_ID | jq '. | length'
```

**Commit:** `feat(claude-conversations): complete POC - end-to-end import working`

_Requirements: US-1, US-2, US-3, US-4, US-5_

---

## Phase 2: Refactoring

Clean up POC code, improve structure and error handling.

### Task 2.1: [x] Extract Classes to Separate Files

**Do:**
1. Create `includes/` subdirectory
2. Move `Claude_JsonlParser` to `includes/class-jsonl-parser.php`
3. Move `Claude_HtmlFormatter` to `includes/class-html-formatter.php`
4. Move `Claude_Importer` to `includes/class-importer.php`
5. Add `require_once` statements in main plugin file
6. Add proper namespace or class prefix consistency

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/includes/class-jsonl-parser.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/includes/class-html-formatter.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/includes/class-importer.php`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- Plugin loads all classes correctly
- PHP lint passes on all files

**Verify:**
```bash
find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations -name "*.php" -exec php -l {} \;
```

**Commit:** `refactor(claude-conversations): extract classes to separate files`

_Design: File Structure_

---

### Task 2.2: Add Error Handling and Edge Cases

**Do:**
1. Add try/catch in parser for file read errors
2. Add WP_Error returns for edge cases:
   - Empty conversation (no messages)
   - File not found
   - Invalid JSONL structure
3. Add input validation in admin handlers
4. Add file path validation (no directory traversal)
5. Add max execution time check before batch operations
6. Truncate long titles to 80 chars with ellipsis

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/includes/class-jsonl-parser.php`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/includes/class-importer.php`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/claude-conversations.php`

**Done when:**
- All error paths return WP_Error with meaningful messages
- Invalid inputs handled gracefully
- Long titles truncated

**Verify:**
```bash
find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations -name "*.php" -exec php -l {} \;
# Manual: Test with empty JSONL file, verify error message
```

**Commit:** `refactor(claude-conversations): add comprehensive error handling`

_Requirements: NFR-3_
_Design: Error Handling_

---

### Task 2.3: [VERIFY] Quality Checkpoint: PHP Lint

**Do:**
1. Run PHP lint on all plugin files
2. Fix any syntax errors found

**Verify:**
```bash
find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations -name "*.php" -exec php -l {} \; | grep -v "No syntax errors"
# Exit 0 = all pass
```

**Done when:**
- All PHP files pass syntax check

**Commit:** `chore(claude-conversations): pass PHP lint checkpoint` (only if fixes needed)

---

## Phase 3: Testing

Add unit and integration tests.

### Task 3.1: Unit Tests for JSONL Parser

**Do:**
1. Create `tests/` directory
2. Create `tests/test-jsonl-parser.php` with simple test runner
3. Test cases:
   - Parse valid JSONL file
   - Parse file with malformed lines (skip gracefully)
   - Extract user messages correctly
   - Extract assistant text blocks
   - Extract thinking blocks
   - Extract metadata (session_id, gitBranch, timestamps)
   - Handle empty file
   - Handle file not found
4. Run tests and verify all pass

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-jsonl-parser.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/fixtures/sample.jsonl`

**Done when:**
- All parser unit tests pass

**Verify:**
```bash
php /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-jsonl-parser.php
# Output should show: "All X tests passed"
```

**Commit:** `test(claude-conversations): add JSONL parser unit tests`

_Requirements: FR-2_
_Design: Test Strategy_

---

### Task 3.2: Unit Tests for HTML Formatter

**Do:**
1. Create `tests/test-html-formatter.php`
2. Test cases:
   - Format conversation with user messages
   - Format conversation with assistant messages
   - Format thinking blocks (blockquote + brain emoji)
   - Format code blocks (pre/code with language class)
   - Format inline code
   - Format markdown bold/italic
   - CSS output contains required styles
3. Run tests and verify all pass

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-html-formatter.php`

**Done when:**
- All formatter unit tests pass

**Verify:**
```bash
php /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-html-formatter.php
# Output should show: "All X tests passed"
```

**Commit:** `test(claude-conversations): add HTML formatter unit tests`

_Requirements: FR-3_
_Design: Test Strategy_

---

### Task 3.3: Integration Test for Import Flow

**Do:**
1. Create `tests/test-import-integration.php`
2. Test cases:
   - Import single session creates post
   - Import sets correct post_meta
   - Import assigns category
   - Duplicate detection (import same file twice)
   - Empty conversation skipped
   - Error handling (invalid file)
3. Requires WordPress test environment (skip if not available)

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-import-integration.php`

**Done when:**
- Integration tests pass (or marked manual if WP test env unavailable)

**Verify:**
```bash
# If WordPress test environment available:
php /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-import-integration.php
# Otherwise: Manual verification via admin page
```

**Commit:** `test(claude-conversations): add import integration tests`

_Requirements: FR-4_
_Design: Test Strategy_

---

### Task 3.4: [VERIFY] Quality Checkpoint: All Tests Pass

**Do:**
1. Run all unit tests
2. Verify all pass

**Verify:**
```bash
for test in /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-*.php; do
  php "$test" || exit 1
done
echo "All tests passed"
```

**Done when:**
- All unit tests pass with exit 0

**Commit:** `chore(claude-conversations): pass test checkpoint` (only if fixes needed)

---

## Phase 4: Quality Gates

Final verification before PR.

### Task 4.1: Local Quality Check

**Do:**
1. Run PHP lint on all files
2. Run all unit tests
3. Manual E2E verification:
   - Activate plugin
   - Run import
   - View posts on frontend

**Verify:**
```bash
# PHP Lint
find /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations -name "*.php" -exec php -l {} \; | grep -v "No syntax errors" && echo "LINT PASS"

# Unit Tests
for test in /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/tests/test-*.php; do
  php "$test" || exit 1
done
echo "TESTS PASS"
```

**Done when:**
- All lint and tests pass

**Commit:** `fix(claude-conversations): address quality issues` (only if fixes needed)

---

### Task 4.2: Create README Documentation

**Do:**
1. Create `README.md` with:
   - Plugin description
   - Installation instructions
   - Usage guide (Import All, Test Parse)
   - File structure
   - Customization options
   - Troubleshooting section

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/claude-conversations/README.md`

**Done when:**
- README covers all essential usage

**Verify:**
```bash
wc -l /home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/claude-conversations/README.md
# Should be 50+ lines
```

**Commit:** `docs(claude-conversations): add README documentation`

---

### Task 4.3: Create PR and Verify CI

**Do:**
1. Verify on feature branch: `git branch --show-current`
2. Push branch: `git push -u origin feat/claude-conversations-importer`
3. Create PR: `gh pr create --title "feat(wordpress): Claude Code conversations importer plugin" --body "..."`
4. Verify CI passes (if applicable)

**Verify:**
```bash
git branch --show-current | grep -q "feat/" && echo "On feature branch"
gh pr checks --watch || echo "No CI configured"
```

**Done when:**
- PR created and CI green (or no CI)

**Commit:** None (PR creation task)

---

## Phase 5: PR Lifecycle

Continuous validation after PR creation.

### Task 5.1: Address Review Comments

**Do:**
1. Monitor PR for review comments
2. Address any feedback
3. Push fixes
4. Re-verify CI passes

**Verify:**
```bash
gh pr checks
```

**Done when:**
- All review comments resolved
- CI green

**Commit:** Various fix commits as needed

---

## Unresolved Questions

- Max message length before truncation? (Current: no truncation)
- Collapsible thinking blocks? (Deferred: simple blockquote for now)
- Category hierarchy for multiple projects? (Deferred: single category)

## Notes

**POC Shortcuts:**
- Single plugin file initially (refactored in Phase 2)
- No batch chunking (relies on PHP max_execution_time)
- Inline CSS in post content (no separate CSS file)
- Simple test runner (no PHPUnit dependency)

**Production TODOs:**
- Add batch chunking for very large imports (>1000 sessions)
- Add progress indicator during import
- Add admin page search/filter
- Consider REST API endpoints for external triggers
