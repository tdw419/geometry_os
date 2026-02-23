---
spec: wordpress-truth-daemon
phase: tasks
total_tasks: 9
created: 2026-02-22T12:00:00Z
generated: auto
---

# Tasks: WordPress Truth Daemon

## Phase 1: Make It Work (POC)

Focus: Validate the pipeline works end-to-end. Skip tests, accept hardcoded values.

- [ ] 1.1 Create WordPressClient
  - **Do**: Create `wordpress_zone/wp_client.py` with WordPressClient class. Methods: `__init__(base_url)`, `get_modified_posts(since, post_types, limit)`, `update_post_meta(post_id, meta_key, meta_value)`, `get_post_author_info(post_id)`, `_make_request(payload)`. Use requests library with 10s timeout.
  - **Files**: `wordpress_zone/wp_client.py`
  - **Done when**: Can instantiate client, call get_modified_posts() returns list (mock response OK)
  - **Verify**: `cd wordpress_zone && python -c "from wp_client import WordPressClient; c = WordPressClient(); print(c.base_url)"`
  - **Commit**: `feat(wordpress): add WordPressClient for content discovery`
  - _Requirements: FR-1_
  - _Design: WordPressClient component_

- [ ] 1.2 Create TruthExtractor
  - **Do**: Create `wordpress_zone/truth_extractor.py` with TruthExtractor class and ExtractedClaim dataclass. Methods: `__init__(model)`, `async extract_claims(content, source_title)`, `async _call_llm(prompt)`, `_parse_response(response, source_context)`. Import LMStudioIntegration from src/lm_studio/integration.py. Use EXTRACTION_PROMPT template with JSON output.
  - **Files**: `wordpress_zone/truth_extractor.py`
  - **Done when**: Can call extract_claims() and get list of ExtractedClaim objects
  - **Verify**: `cd wordpress_zone && python -c "from truth_extractor import TruthExtractor; print(TruthExtractor.EXTRACTION_PROMPT[:50])"`
  - **Commit**: `feat(wordpress): add TruthExtractor for LM Studio claim extraction`
  - _Requirements: FR-2_
  - _Design: TruthExtractor component_

- [ ] 1.3 Create TriadScorer
  - **Do**: Create `wordpress_zone/triad_scorer.py` with TriadScorer class and TriadScore dataclass. Method: `calculate_score(llm_confidence, author_role, source_type, corroboration_count)`. Implement formula: `confidence = (llm * 0.4) + (author * 0.3) + (source * 0.2) + (corroboration * 0.1)`, `distance = int(50 + (1 - confidence) * 40)`. Include DEFAULT_AUTHOR_WEIGHTS and DEFAULT_SOURCE_WEIGHTS.
  - **Files**: `wordpress_zone/triad_scorer.py`
  - **Done when**: calculate_score() returns TriadScore with confidence 0-1, distance 50-90
  - **Verify**: `cd wordpress_zone && python -c "from triad_scorer import TriadScorer; s = TriadScorer(); r = s.calculate_score(0.8, 'admin', 'post', 2); print(f'{r.confidence:.2f} d={r.distance_from_center}')"`
  - **Commit**: `feat(wordpress): add TriadScorer for CTRM hybrid scoring`
  - _Requirements: FR-3_
  - _Design: TriadScorer component_

- [ ] 1.4 Create VerificationScheduler
  - **Do**: Create `wordpress_zone/verification_scheduler.py` with VerificationScheduler class. Methods: `__init__(db_path, interval_seconds=3600, max_tokens=5000)`, `async run_cycle()`, `async start()`, `stop()`. Import CTRMDatabase from src/ctrm_core/database.py and CTRMTruthManager from src/ctrm_core/truth_manager.py. Create MockEmbedder class for SimpleEmbedder. Call manager.verify_foundational_truths(max_tokens).
  - **Files**: `wordpress_zone/verification_scheduler.py`
  - **Done when**: run_cycle() returns dict with verified_truths count
  - **Verify**: `cd wordpress_zone && python -c "from verification_scheduler import VerificationScheduler; s = VerificationScheduler(); print(s.interval_seconds)"`
  - **Commit**: `feat(wordpress): add VerificationScheduler for periodic truth verification`
  - _Requirements: FR-6_
  - _Design: VerificationScheduler component_

- [ ] 1.5 Create WordPressTruthDaemon
  - **Do**: Create `wordpress_zone/wordpress_truth_daemon.py` with DaemonConfig dataclass and WordPressTruthDaemon class. Methods: `__init__(config)`, `async run_discovery()`, `async _process_post(post)`, `async start()`, `stop()`. Wire all components: wp_client, extractor, scorer, truth_manager. Add signal handlers for SIGTERM/SIGINT. Add main() CLI entrypoint with argparse.
  - **Files**: `wordpress_zone/wordpress_truth_daemon.py`
  - **Done when**: Can instantiate daemon, run_discovery() returns int count
  - **Verify**: `cd wordpress_zone && python -c "from wordpress_truth_daemon import WordPressTruthDaemon, DaemonConfig; d = WordPressTruthDaemon(); print(d.config.poll_interval)"`
  - **Commit**: `feat(wordpress): add WordPressTruthDaemon main orchestration`
  - _Requirements: FR-4, FR-5_
  - _Design: WordPressTruthDaemon component_

- [ ] 1.6 POC Checkpoint
  - **Do**: Verify full pipeline works. Start daemon briefly, check logs.
  - **Done when**: Daemon starts, attempts discovery cycle, logs output
  - **Verify**: `cd wordpress_zone && timeout 5 python wordpress_truth_daemon.py -v || true`
  - **Commit**: `feat(wordpress): complete WordPress Truth Daemon POC`

## Phase 2: Refactoring

After POC validated, clean up code.

- [ ] 2.1 Update ai-publisher.php
  - **Do**: Add three new action handlers to `wordpress_zone/wordpress/ai-publisher.php`: `getModifiedContent` (query posts by modified date, return id/title/content/modified/type/author_id), `updatePostMeta` (update post meta with permission check), `getPostAuthor` (return id/role/post_count). Add `define('WP_TRUTH_DAEMON_MODE', true)` at top.
  - **Files**: `wordpress_zone/wordpress/ai-publisher.php`
  - **Done when**: All three actions respond to JSON requests
  - **Verify**: Manual curl test to ai-publisher.php with each action
  - **Commit**: `feat(wordpress): add getModifiedContent, updatePostMeta, getPostAuthor endpoints`
  - _Requirements: FR-1, FR-5_
  - _Design: WordPress API Updates_

- [ ] 2.2 Add configuration file
  - **Do**: Create `wordpress_zone/truth_daemon_config.yaml` with discovery (poll_interval, post_types, categories, batch_size), extraction (llm_model, max_content_length, temperature), scoring (author_reliability_weights, source_type_weights, corroboration_boost_per_match, max_corroboration_boost), verification (interval, max_tokens_per_cycle, min_confidence_to_verify), database (path), wordpress (url, api_endpoint, timeout).
  - **Files**: `wordpress_zone/truth_daemon_config.yaml`
  - **Done when**: YAML file parses correctly
  - **Verify**: `cd wordpress_zone && python -c "import yaml; print(yaml.safe_load(open('truth_daemon_config.yaml'))['discovery']['poll_interval'])"`
  - **Commit**: `feat(wordpress): add truth daemon configuration file`
  - _Requirements: FR-7_
  - _Design: Configuration_

## Phase 3: Testing

- [ ] 3.1 Unit tests for WordPressClient
  - **Do**: Create `wordpress_zone/tests/test_wp_client.py`. Test cases: `test_init_with_default_url`, `test_init_with_custom_url`, `test_get_modified_posts_returns_list`. Use unittest.mock.patch to mock _make_request.
  - **Files**: `wordpress_zone/tests/test_wp_client.py`
  - **Done when**: `pytest tests/test_wp_client.py -v` passes with 3 tests
  - **Verify**: `cd wordpress_zone && python -m pytest tests/test_wp_client.py -v`
  - **Commit**: `test(wordpress): add WordPressClient unit tests`
  - _Requirements: AC-1.1, AC-1.2_

- [ ] 3.2 Unit tests for TruthExtractor
  - **Do**: Create `wordpress_zone/tests/test_truth_extractor.py`. Test cases: `test_extracted_claim_dataclass`, `test_extract_claims_returns_list` (mock _call_llm), `test_empty_content_returns_empty_list`. Mark with @pytest.mark.asyncio.
  - **Files**: `wordpress_zone/tests/test_truth_extractor.py`
  - **Done when**: `pytest tests/test_truth_extractor.py -v` passes with 3 tests
  - **Verify**: `cd wordpress_zone && python -m pytest tests/test_truth_extractor.py -v`
  - **Commit**: `test(wordpress): add TruthExtractor unit tests`
  - _Requirements: AC-2.1, AC-2.4_

- [ ] 3.3 Unit tests for TriadScorer
  - **Do**: Create `wordpress_zone/tests/test_triad_scorer.py`. Test cases: `test_default_config`, `test_custom_config`, `test_calculate_score_basic`, `test_admin_role_boosts_confidence`, `test_high_confidence_closer_to_center`.
  - **Files**: `wordpress_zone/tests/test_triad_scorer.py`
  - **Done when**: `pytest tests/test_triad_scorer.py -v` passes with 5 tests
  - **Verify**: `cd wordpress_zone && python -m pytest tests/test_triad_scorer.py -v`
  - **Commit**: `test(wordpress): add TriadScorer unit tests`
  - _Requirements: AC-3.1, AC-3.2, AC-3.5_

- [ ] 3.4 Unit tests for VerificationScheduler
  - **Do**: Create `wordpress_zone/tests/test_verification_scheduler.py`. Test cases: `test_init_default_config`, `test_custom_config`, `test_run_cycle_returns_results` (mock CTRMTruthManager).
  - **Files**: `wordpress_zone/tests/test_verification_scheduler.py`
  - **Done when**: `pytest tests/test_verification_scheduler.py -v` passes with 3 tests
  - **Verify**: `cd wordpress_zone && python -m pytest tests/test_verification_scheduler.py -v`
  - **Commit**: `test(wordpress): add VerificationScheduler unit tests`
  - _Requirements: AC-6.1, AC-6.2_

- [ ] 3.5 Unit tests for WordPressTruthDaemon
  - **Do**: Create `wordpress_zone/tests/test_wordpress_truth_daemon.py`. Test cases: `test_default_config`, `test_custom_config`, `test_process_post_returns_truths` (mock all components), `test_run_discovery_returns_count`.
  - **Files**: `wordpress_zone/tests/test_wordpress_truth_daemon.py`
  - **Done when**: `pytest tests/test_wordpress_truth_daemon.py -v` passes with 4 tests
  - **Verify**: `cd wordpress_zone && python -m pytest tests/test_wordpress_truth_daemon.py -v`
  - **Commit**: `test(wordpress): add WordPressTruthDaemon unit tests`
  - _Requirements: FR-4, FR-5_

- [ ] 3.6 Integration tests
  - **Do**: Create `wordpress_zone/tests/test_truth_pipeline.py`. Test cases: `test_full_extraction_pipeline` (mock WordPress and LM Studio, verify end-to-end flow), `test_triad_scorer_integration` (verify score ranges for different scenarios).
  - **Files**: `wordpress_zone/tests/test_truth_pipeline.py`
  - **Done when**: `pytest tests/test_truth_pipeline.py -v` passes with 2 tests
  - **Verify**: `cd wordpress_zone && python -m pytest tests/test_truth_pipeline.py -v`
  - **Commit**: `test(wordpress): add integration tests for truth extraction pipeline`
  - _Requirements: All_

## Phase 4: Quality Gates

- [ ] 4.1 Create control script
  - **Do**: Create `wordpress_zone/truth_daemon_ctl.sh` with start/stop/restart/status/tail/report commands. Use PID file for tracking. Create logs/ directory. Add report command with sqlite3 queries for stats.
  - **Files**: `wordpress_zone/truth_daemon_ctl.sh`
  - **Done when**: All commands work, script is executable
  - **Verify**: `cd wordpress_zone && ./truth_daemon_ctl.sh status`
  - **Commit**: `feat(wordpress): add truth daemon control script`

- [ ] 4.2 Local quality check
  - **Do**: Run all tests, verify daemon starts/stops cleanly
  - **Verify**: `cd wordpress_zone && python -m pytest tests/ -v && ./truth_daemon_ctl.sh start && sleep 2 && ./truth_daemon_ctl.sh stop`
  - **Done when**: All tests pass, daemon starts and stops
  - **Commit**: `fix(wordpress): address any test failures` (if needed)

- [ ] 4.3 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: SimpleEmbedder uses hash-based mock, no real embeddings
- **Production TODOs**: Replace SimpleEmbedder with real LM Studio embeddings, add WordPress authentication, implement truth archival
- **Dependencies**: Requires WordPress running with ai-publisher.php, LM Studio with loaded model
