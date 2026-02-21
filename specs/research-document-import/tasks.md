---
spec: research-document-import
phase: tasks
total_tasks: 22
created: 2026-02-21
---

# Tasks: Research Document Import

## Phase 1: Make It Work (POC)

Focus: Validate the idea works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Add `research_document` CPT registration to `ai-publisher.php`
  - **Do**:
    1. Add `register_research_document_cpt()` function to `ai-publisher.php`
    2. Hook to `init` action with `add_action('init', 'register_research_document_cpt')`
    3. Configure CPT with `public => true`, `show_in_rest => true`, `supports => ['title', 'editor', 'custom-fields']`
  - **Files**: `wordpress_zone/wordpress/ai-publisher.php`
  - **Done when**: CPT registered, visible in WordPress admin menu
  - **Verify**: `curl -s http://localhost:8080/wp-json/wp/v2/research_document | head -c 200`
  - **Commit**: `feat(wp): register research_document custom post type`
  - _Requirements: FR-2, AC-2.1_
  - _Design: WordPress CPT Handler_

- [x] 1.2 Add `importResearchDocument` action to `ai-publisher.php`
  - **Do**:
    1. Add case `'importResearchDocument'` to dispatcher switch
    2. Implement `handle_import_research_document($args)` function
    3. Check for existing post by `source_path` meta using `get_posts()` with meta_query
    4. If exists and hash matches: return `status: skipped`
    5. If exists and hash differs: update with `wp_update_post()`, return `status: updated`
    6. If new: create with `wp_insert_post()`, save meta fields, return `status: created`
    7. Store meta: `source_path`, `file_hash`, `line_count`, `import_batch`
  - **Files**: `wordpress_zone/wordpress/ai-publisher.php`
  - **Done when**: API accepts import requests, returns proper status
  - **Verify**: `curl -s -X POST http://localhost:8080/ai-publisher.php -H "Content-Type: application/json" -d '{"action":"importResearchDocument","title":"Test Doc","content":"test","meta":{"source_path":"/test.txt","file_hash":"abc123","line_count":10,"import_batch":"test_001"}}' | jq .success`
  - **Commit**: `feat(wp): add importResearchDocument API action`
  - _Requirements: FR-3, FR-5, FR-6, AC-2.2-2.6, AC-3.1-3.4_
  - _Design: WordPress CPT Handler_

- [x] 1.3 Create `import_research_docs.py` batch importer
  - **Do**:
    1. Fork structure from `sync_skills_to_wp.py`
    2. Create `ResearchDocument` dataclass with file_path, title, content, file_hash, line_count
    3. Implement `discover_documents()` - glob for `.txt` and `.md` files
    4. Implement `parse_document()` - read file, extract title from filename, calculate SHA256
    5. Implement `import_batch()` - POST to `ai-publisher.php` with `importResearchDocument` action
    6. Implement `run_full_import()` - batch in 50-doc chunks with 2s delay
    7. Track progress: print "X/Y documents" every batch
  - **Files**: `wordpress_zone/import_research_docs.py`
  - **Done when**: Script runs, imports 5 test docs successfully
  - **Verify**: `python3 wordpress_zone/import_research_docs.py --limit 5 --dry-run 2>&1 | grep -E "(discovered|Processing)"`
  - **Commit**: `feat(wp): add research docs batch importer`
  - _Requirements: FR-1, FR-4, AC-1.1-1.6_
  - _Design: Python Batch Importer_

- [x] 1.4 POC Checkpoint: Import 10 docs and verify in WordPress
  - **Do**:
    1. Run importer with `--limit 10`
    2. Query WordPress for imported docs via REST API
    3. Verify meta fields populated correctly
  - **Files**: None
  - **Done when**: 10 docs visible in WordPress with correct metadata
  - **Verify**: `curl -s "http://localhost:8080/wp-json/wp/v2/research_document?per_page=15" | jq 'length'`
  - **Commit**: `feat(wp): complete research doc import POC`

- [x] 1.5 [VERIFY] Quality checkpoint: Python syntax + PHP lint
  - **Do**: Run syntax checks on new files
  - **Verify**: `python3 -m py_compile wordpress_zone/import_research_docs.py && php -l wordpress_zone/wordpress/ai-publisher.php`
  - **Done when**: Both commands exit 0
  - **Commit**: `chore(wp): pass quality checkpoint 1`

## Phase 2: Refactoring

After POC validated, clean up code.

- [x] 2.1 Add error handling to importer
  - **Do**:
    1. Add try/catch around file reading with proper error logging
    2. Handle empty files (0 bytes) - skip with warning
    3. Handle permission denied - log error, continue
    4. Add retry logic for transient API failures (max 2 retries)
    5. Add timeout handling for large file uploads
  - **Files**: `wordpress_zone/import_research_docs.py`
  - **Done when**: Error cases handled gracefully, logged appropriately
  - **Verify**: `python3 -m py_compile wordpress_zone/import_research_docs.py`
  - **Commit**: `refactor(wp): add error handling to importer`
  - _Design: Error Handling_

- [x] 2.2 Add `searchResearch` API action to `ai-publisher.php`
  - **Do**:
    1. Add case `'searchResearch'` to dispatcher switch
    2. Implement `handle_search_research($args)` using `WP_Query` with `s` parameter
    3. Support `q` for full-text search on title/content
    4. Support `meta_filter` for `import_batch`, `min_line_count`, `max_line_count`
    5. Return array with `id`, `title`, `excerpt`, `url`, `source_path`, `line_count`
    6. Implement pagination with `limit` (default 50) and `offset`
  - **Files**: `wordpress_zone/wordpress/ai-publisher.php`
  - **Done when**: Search API returns matching results
  - **Verify**: `curl -s -X POST http://localhost:8080/ai-publisher.php -H "Content-Type: application/json" -d '{"action":"searchResearch","q":"python","limit":5}' | jq '.results | length'`
  - **Commit**: `feat(wp): add searchResearch API action`
  - _Requirements: FR-9, FR-10, AC-5.1-5.5_

- [x] 2.3 Create admin UI plugin directory structure
  - **Do**:
    1. Create `wordpress_zone/wordpress/wp-content/plugins/research-import-admin/` directory
    2. Create main plugin file `research-import-admin.php`
    3. Add WordPress plugin header comment
    4. Register `add_menu_page()` under Tools menu with `manage_options` capability
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php`
  - **Done when**: Plugin directory exists, page accessible in admin
  - **Verify**: `test -f wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php && echo "OK"`
  - **Commit**: `feat(wp): add research import admin plugin skeleton`
  - _Requirements: FR-7, AC-4.1_

- [x] 2.4 Implement admin UI page with import controls
  - **Do**:
    1. Add "Run Import" button with nonce field
    2. Register AJAX handler `wp_ajax_research_import_start`
    3. Call Python importer via `shell_exec()` or trigger via API
    4. Display last import summary (from transient)
    5. Add "View Logs" link placeholder
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php`
  - **Done when**: Button triggers import, shows completion message
  - **Verify**: `grep -q "wp_ajax_research_import_start" wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php && echo "OK"`
  - **Commit**: `feat(wp): add admin UI import controls`
  - _Requirements: FR-7, FR-8, AC-4.2-4.5_

- [x] 2.5 Add AJAX progress bar for import
  - **Do**:
    1. Add progress bar HTML element
    2. Register AJAX handler `wp_ajax_research_import_progress`
    3. Store import progress in transient `research_import_progress`
    4. Update importer to write progress to transient via separate API call
    5. JavaScript polling every 2s to update progress bar
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php`
  - **Done when**: Progress bar updates during import
  - **Verify**: `grep -q "research_import_progress" wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php && echo "OK"`
  - **Commit**: `feat(wp): add import progress bar`
  - _Requirements: FR-8, AC-4.3_

- [x] 2.6 [VERIFY] Quality checkpoint: PHP lint + file structure
  - **Do**: Run lint on all PHP files, verify plugin structure
  - **Verify**: `php -l wordpress_zone/wordpress/ai-publisher.php && php -l wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php`
  - **Done when**: No PHP syntax errors
  - **Commit**: `chore(wp): pass quality checkpoint 2`

## Phase 3: Testing

- [x] 3.1 Create Python unit tests for importer
  - **Do**:
    1. Create `wordpress_zone/tests/test_import_research_docs.py`
    2. Test `parse_document()` with sample filenames
    3. Test `discover_documents()` with mock directory
    4. Test SHA256 hash calculation
    5. Test title extraction from filename patterns
  - **Files**: `wordpress_zone/tests/test_import_research_docs.py`
  - **Done when**: Tests pass with 80%+ coverage of importer logic
  - **Verify**: `python3 -m pytest wordpress_zone/tests/test_import_research_docs.py -v 2>&1 | tail -5`
  - **Commit**: `test(wp): add importer unit tests`
  - _Requirements: AC-1.1-1.6, AC-2.6_
  - _Design: Test Strategy - Unit Tests_

- [x] 3.2 Create PHP mock tests for API handlers
  - **Do**:
    1. Create `wordpress_zone/tests/test_research_api.py` (mock PHP verification)
    2. Test `handle_import_research_document` structure
    3. Test `handle_search_research` structure
    4. Verify deduplication logic present
    5. Verify meta field handling
  - **Files**: `wordpress_zone/tests/test_research_api.py`
  - **Done when**: All mock tests pass
  - **Verify**: `python3 wordpress_zone/tests/test_research_api.py 2>&1 | tail -3`
  - **Commit**: `test(wp): add API mock tests`
  - _Design: Test Strategy - Unit Tests_

- [x] 3.3 Create integration test for full import cycle
  - **Do**:
    1. Create `wordpress_zone/tests/test_research_integration.py`
    2. Test import of 5 sample documents
    3. Verify posts created in WordPress via REST API
    4. Verify meta fields populated correctly
    5. Test re-import produces "skipped" status
    6. Test content update (modified hash) produces "updated" status
  - **Files**: `wordpress_zone/tests/test_research_integration.py`
  - **Done when**: Integration tests pass
  - **Verify**: `python3 -m pytest wordpress_zone/tests/test_research_integration.py -v 2>&1 | tail -5`
  - **Commit**: `test(wp): add integration tests`
  - _Design: Test Strategy - Integration Tests_

- [x] 3.4 [VERIFY] Quality checkpoint: All tests pass
  - **Do**: Run all test suites
  - **Verify**: `python3 -m pytest wordpress_zone/tests/test_import_research_docs.py wordpress_zone/tests/test_research_integration.py -v 2>&1 | grep -E "(PASSED|FAILED|ERROR|passed|failed)"`
  - **Done when**: All tests pass
  - **Commit**: `chore(wp): pass quality checkpoint 3`

## Phase 4: Quality Gates

- [x] 4.1 Local quality check
  - **Do**: Run ALL quality checks locally
  - **Verify**:
    - Python syntax: `python3 -m py_compile wordpress_zone/import_research_docs.py`
    - PHP lint: `php -l wordpress_zone/wordpress/ai-publisher.php`
    - Plugin lint: `php -l wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php`
    - Unit tests: `python3 -m pytest wordpress_zone/tests/test_import_research_docs.py -v`
  - **Done when**: All commands pass with no errors
  - **Commit**: `fix(wp): address quality issues` (if fixes needed)

- [x] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/research-document-import`
    3. Create PR using gh CLI
  - **Verify**: `gh pr checks --watch` (wait for CI completion)
  - **Done when**: All CI checks green, PR ready for review
  - **Commit**: None

## Phase 5: PR Lifecycle

- [ ] 5.1 Full import validation (100 docs)
  - **Do**:
    1. Run importer with `--limit 100` on staging/production
    2. Verify no timeout, correct counts
    3. Check WordPress for all 100 posts
  - **Verify**: `curl -s "http://localhost:8080/wp-json/wp/v2/research_document?per_page=100" | jq 'length'`
  - **Done when**: 100 docs imported successfully
  - **Commit**: None

- [ ] 5.2 Search API validation
  - **Do**:
    1. Test search with known terms
    2. Test meta filtering
    3. Test pagination
  - **Verify**: `curl -s -X POST http://localhost:8080/ai-publisher.php -H "Content-Type: application/json" -d '{"action":"searchResearch","q":"python","limit":5}' | jq '.success'`
  - **Done when**: Search returns expected results
  - **Commit**: None

- [ ] 5.3 Memory Beams integration verification
  - **Do**:
    1. Import test document
    2. Run `WordPressMemoryProvider.sync_posts()`
    3. Verify document appears in WordPress zone (3000-3400, 1000-1400)
  - **Verify**: `python3 -c "from wordpress_zone.wordpress_memory_provider import WordPressMemoryProvider; p = WordPressMemoryProvider(); print('OK')"`
  - **Done when**: Research docs visible in Memory Beams
  - **Commit**: None

- [ ] 5.4 Admin UI E2E test
  - **Do**:
    1. Navigate to Tools > Research Import
    2. Click "Run Import" button
    3. Verify progress bar updates
    4. Verify completion message shows summary
  - **Verify**: Manual browser test OR `grep -q "Run Import" wordpress_zone/wordpress/wp-content/plugins/research-import-admin/research-import-admin.php && echo "Button found"`
  - **Done when**: Admin UI fully functional
  - **Commit**: None

- [ ] 5.5 AC checklist verification
  - **Do**: Read requirements.md, verify each AC-* is satisfied
  - **Verify**: Grep codebase for implementation, run test commands
  - **Done when**: All acceptance criteria confirmed met
  - **Commit**: None

## Unresolved Questions

1. Environment-specific paths: `source_path` stores absolute path - may need relative for multi-env
   - Current: Keep absolute, revisit if needed

2. Import log retention: How many logs to keep?
   - Current: Last 10 in transient, full logs in filesystem

3. Concurrent admin imports: Two admins click "Run Import"?
   - Current: Use transient lock with 5-minute expiry

## Notes

- **POC shortcuts**: Hardcoded batch size, basic error handling, no progress bar in POC
- **Production TODOs**: Add proper progress persistence, log rotation, concurrent import locking
