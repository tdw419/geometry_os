---
spec: llm-powered-expansion
phase: tasks
total_tasks: 20
created: 2026-02-21
---

# Tasks: LLM-Powered WordPress Content Expansion

## Execution Context

| Interview Topic | Response |
|-----------------|----------|
| Primary users | Internal developers only |
| Priority tradeoffs | Prioritize code quality |
| Success criteria | Feature works as specified |
| Architecture style | Extend existing architecture |
| Technology constraints | No constraints |
| Integration approach | Use existing APIs and interfaces |
| Testing depth | Standard - unit + integration tests |
| Deployment approach | Standard CI/CD pipeline |
| Execution priority | Balanced - reasonable quality with speed |

## Phase 1: Make It Work (POC)

Focus: Validate LLM integration works end-to-end. Skip edge cases, accept hardcoded values.

- [x] 1.1 Create LLMExpansionService with ZAIBridge integration
  - **Do**:
    1. Create `systems/evolution_daemon/wordpress/llm_expansion_service.py`
    2. Define `LLMExpansionConfig` dataclass with model, temperature, timeout settings
    3. Define `ExpansionResult` dataclass with post_id, content, confidence, model_used, fallback_used
    4. Implement `LLMExpansionService.__init__()` with lazy bridge loading
    5. Implement `expand()` method calling ZAIBridge with "coder" persona
    6. Implement `_fallback_expansion()` returning template content with confidence 0.3
    7. Implement `_calculate_confidence()` checking length ratio and structure markers
  - **Files**: `systems/evolution_daemon/wordpress/llm_expansion_service.py`
  - **Done when**: Module imports without error, service instantiates with defaults
  - **Verify**: `python3 -c "from systems.evolution_daemon.wordpress.llm_expansion_service import LLMExpansionService, LLMExpansionConfig, ExpansionResult; s = LLMExpansionService(); print('OK')"`
  - **Commit**: `feat(evolution): add LLMExpansionService for intelligent content expansion`
  - _Requirements: FR-1, FR-6_
  - _Design: LLMExpansionService component_

- [ ] 1.2 Create SafetyConfig and ContentBackup classes
  - **Do**:
    1. Create `systems/evolution_daemon/wordpress/safety_config.py`
    2. Define `SafetyConfig` dataclass with require_backup, min_confidence, backup_dir, max_modifications_per_hour
    3. Implement `ContentBackup.__init__()` creating backup dir with `os.makedirs(exist_ok=True)`
    4. Implement `ContentBackup.save()` writing JSON with post_id, content, timestamp, restored flag
    5. Implement `ContentBackup.load()` finding most recent backup by timestamp sort
    6. Implement `validate_proposal_safety()` checking confidence threshold and content length
  - **Files**: `systems/evolution_daemon/wordpress/safety_config.py`
  - **Done when**: Module imports, backup saves/loads JSON correctly
  - **Verify**: `python3 -c "from systems.evolution_daemon.wordpress.safety_config import SafetyConfig, ContentBackup, validate_proposal_safety; print('OK')"`
  - **Commit**: `feat(safety): add SafetyConfig and ContentBackup for safe modifications`
  - _Requirements: FR-3, FR-7, FR-8_
  - _Design: SafetyConfig component_

- [ ] 1.3 Integrate LLM service into ContentAnalyzer
  - **Do**:
    1. Add `from typing import Optional` import to content_analyzer.py
    2. Add `from .llm_expansion_service import LLMExpansionService, LLMExpansionConfig` import
    3. Modify `WordPressContentAnalyzer.__init__()` to accept `llm_enabled: bool = False` and `llm_config: Optional[LLMExpansionConfig] = None`
    4. Add lazy-loaded `llm_service` property
    5. Modify `_generate_expansion()` to route to LLM service when `llm_enabled=True`
  - **Files**: `systems/evolution_daemon/wordpress/content_analyzer.py`
  - **Done when**: Analyzer accepts llm_enabled flag, routes expansion correctly
  - **Verify**: `python3 -c "from systems.evolution_daemon.wordpress.content_analyzer import WordPressContentAnalyzer; a = WordPressContentAnalyzer(llm_enabled=True); print('OK')"`
  - **Commit**: `feat(analyzer): integrate LLMExpansionService with feature flag`
  - _Requirements: FR-2_
  - _Design: ContentAnalyzer (Modified)_

- [ ] 1.4 Add CLI flags for LLM mode
  - **Do**:
    1. Modify `bridge_service.py` to add `--llm` store_true argument
    2. Add `--llm-model` argument defaulting to "glm-4-plus"
    3. Add `--llm-temperature` float argument defaulting to 0.7
    4. Add `--no-backup` store_true argument
    5. Update `BridgeServiceConfig` dataclass with llm_enabled, llm_model, llm_temperature, safety_config fields
    6. Update `WPEvolutionBridgeService.__init__()` to create SafetyConfig from CLI args
  - **Files**: `systems/evolution_daemon/wordpress/bridge_service.py`
  - **Done when**: CLI accepts --llm and related flags, argparse validates them
  - **Verify**: `python3 -m systems.evolution_daemon.wordpress.bridge_service --help | grep -E "(--llm|--no-backup)"`
  - **Commit**: `feat(cli): add --llm, --llm-model, --llm-temperature, --no-backup flags`
  - _Requirements: FR-4, AC-1.1, AC-1.2, AC-1.3_
  - _Design: CLI Flags_

- [ ] 1.5 [VERIFY] Quality checkpoint: module imports and basic functionality
  - **Do**: Verify all new modules import correctly and basic instantiation works
  - **Verify**: `python3 -c "from systems.evolution_daemon.wordpress.llm_expansion_service import *; from systems.evolution_daemon.wordpress.safety_config import *; from systems.evolution_daemon.wordpress.content_analyzer import WordPressContentAnalyzer; WordPressContentAnalyzer(llm_enabled=True); print('PASS')"`
  - **Done when**: All imports succeed, no Python syntax errors
  - **Commit**: `chore(evolution): pass POC quality checkpoint` (only if fixes needed)

- [ ] 1.6 Write unit tests for LLMExpansionService
  - **Do**:
    1. Create `tests/test_llm_expansion_service.py`
    2. Write `test_service_initializes_with_defaults()` verifying config.model == "glm-4-plus"
    3. Write `test_service_generates_expansion_result()` verifying ExpansionResult fields
    4. Write `test_service_falls_back_on_error()` with invalid API key
    5. Write `test_confidence_calculation()` verifying score ranges
  - **Files**: `tests/test_llm_expansion_service.py`
  - **Done when**: All tests pass
  - **Verify**: `pytest tests/test_llm_expansion_service.py -v`
  - **Commit**: `test(evolution): add unit tests for LLMExpansionService`
  - _Requirements: FR-1, FR-5, FR-6_
  - _Design: Test Strategy - Unit Tests_

- [x] 1.7 Write unit tests for SafetyConfig
  - **Do**:
    1. Create `tests/test_safety_config.py`
    2. Write `test_safety_config_defaults_are_conservative()` verifying require_backup=True, min_confidence=0.7
    3. Write `test_backup_saves_original_content()` verifying save/load cycle
    4. Write `test_validate_proposal_safety_rejects_low_confidence()` with confidence 0.5
    5. Write `test_backup_filename_format()` verifying post_{id}_{timestamp}.json
  - **Files**: `tests/test_safety_config.py`
  - **Done when**: All tests pass
  - **Verify**: `pytest tests/test_safety_config.py -v`
  - **Commit**: `test(safety): add unit tests for SafetyConfig and ContentBackup`
  - _Requirements: FR-3, FR-7, FR-8, AC-4.1, AC-4.3_
  - _Design: Test Strategy - Unit Tests_

- [ ] 1.8 POC Checkpoint: End-to-end validation
  - **Do**:
    1. Run all new unit tests
    2. Verify LLM service connects to ZAIBridge (mock mode OK)
    3. Verify ContentAnalyzer produces different output with llm_enabled=True vs False
    4. Verify CLI flags propagate through to analyzer
  - **Verify**: `pytest tests/test_llm_expansion_service.py tests/test_safety_config.py -v`
  - **Done when**: All tests pass, feature demonstrable
  - **Commit**: `feat(evolution): complete POC for LLM expansion`

## Phase 2: Refactoring

- [ ] 2.1 Add SafetyConfig integration to BridgeService
  - **Do**:
    1. Modify `BridgeServiceConfig` to include `safety_config: Optional[SafetyConfig] = None`
    2. Modify `WPEvolutionBridgeService.__init__()` to create `ContentBackup` instance
    3. Add safety validation in `_execute_proposal()` calling `validate_proposal_safety()`
    4. Add backup creation before proposal execution when `require_backup=True`
    5. Add logging for safety validation results
  - **Files**: `systems/evolution_daemon/wordpress/bridge_service.py`
  - **Done when**: Bridge validates safety and creates backups before execution
  - **Verify**: `python3 -c "from systems.evolution_daemon.wordpress.bridge_service import BridgeServiceConfig, WPEvolutionBridgeService; c = BridgeServiceConfig(auto_execute=True); print('OK')"`
  - **Commit**: `refactor(bridge): integrate SafetyConfig and backup before execution`
  - _Requirements: FR-7, AC-4.1, AC-4.2_
  - _Design: BridgeServiceConfig (Modified)_

- [ ] 2.2 Write CLI flag tests
  - **Do**:
    1. Create `tests/test_bridge_cli.py`
    2. Write `test_cli_accepts_llm_flag()` verifying args.llm == True
    3. Write `test_cli_accepts_llm_config_options()` with --llm-model and --llm-temperature
    4. Write `test_cli_llm_defaults_to_false()` with empty args
    5. Write `test_cli_no_backup_flag()` verifying --no-backup sets flag
  - **Files**: `tests/test_bridge_cli.py`
  - **Done when**: All tests pass
  - **Verify**: `pytest tests/test_bridge_cli.py -v`
  - **Commit**: `test(cli): add CLI flag parsing tests`
  - _Requirements: FR-4, AC-1.1, AC-1.2, AC-1.3, AC-4.5_
  - _Design: Test Strategy - Unit Tests_

- [ ] 2.3 Add LLM mode tests to ContentAnalyzer test file
  - **Do**:
    1. Modify `tests/test_wordpress_content_analyzer.py`
    2. Add `test_analyzer_uses_llm_when_enabled()` verifying longer content than template
    3. Add `test_analyzer_uses_template_when_llm_disabled()` verifying "## Additional Context" present
    4. Add `test_analyzer_propagates_llm_config()` verifying config passes through
  - **Files**: `tests/test_wordpress_content_analyzer.py`
  - **Done when**: All tests pass including new ones
  - **Verify**: `pytest tests/test_wordpress_content_analyzer.py -v`
  - **Commit**: `test(analyzer): add LLM mode tests`
  - _Requirements: FR-2_
  - _Design: Test Strategy - Unit Tests_

- [ ] 2.4 [VERIFY] Quality checkpoint: refactored code passes tests
  - **Do**: Run all tests for modified files
  - **Verify**: `pytest tests/test_llm_expansion_service.py tests/test_safety_config.py tests/test_bridge_cli.py tests/test_wordpress_content_analyzer.py -v`
  - **Done when**: All tests pass
  - **Commit**: `chore(evolution): pass refactoring quality checkpoint` (only if fixes needed)

## Phase 3: Testing

- [ ] 3.1 Write BridgeService safety integration tests
  - **Do**:
    1. Create `tests/test_bridge_service_safety.py`
    2. Write `test_bridge_creates_backup_before_execution()` verifying safety_config.require_backup
    3. Write `test_bridge_respects_confidence_threshold()` with high min_confidence
    4. Write `test_bridge_rejects_low_confidence_proposals()` verifying skip
  - **Files**: `tests/test_bridge_service_safety.py`
  - **Done when**: All tests pass
  - **Verify**: `pytest tests/test_bridge_service_safety.py -v`
  - **Commit**: `test(bridge): add safety integration tests`
  - _Requirements: FR-7, AC-4.1, AC-4.4_
  - _Design: Test Strategy - Integration Tests_

- [ ] 3.2 Write E2E integration tests
  - **Do**:
    1. Create `tests/test_llm_expansion_integration.py`
    2. Write `test_full_expansion_flow_with_llm()` end-to-end post->analysis->expansion->proposal
    3. Write `test_template_fallback_when_llm_unavailable()` with invalid API key
    4. Write `test_quality_improvement_metrics()` comparing word counts
    5. Write `test_confidence_scoring_accuracy()` verifying score ranges
  - **Files**: `tests/test_llm_expansion_integration.py`
  - **Done when**: All tests pass
  - **Verify**: `pytest tests/test_llm_expansion_integration.py -v`
  - **Commit**: `test(integration): add E2E tests for LLM expansion flow`
  - _Requirements: FR-5, FR-6, AC-2.1, AC-2.2, AC-2.3, AC-3.1_
  - _Design: Test Strategy - Integration Tests_

- [ ] 3.3 [VERIFY] Quality checkpoint: all tests pass
  - **Do**: Run complete test suite for LLM expansion feature
  - **Verify**: `pytest tests/test_llm_expansion_service.py tests/test_safety_config.py tests/test_bridge_cli.py tests/test_wordpress_content_analyzer.py tests/test_bridge_service_safety.py tests/test_llm_expansion_integration.py -v --tb=short`
  - **Done when**: All tests pass, no failures
  - **Commit**: `chore(evolution): pass testing quality checkpoint` (only if fixes needed)

## Phase 4: Quality Gates

- [ ] 4.1 Run full Python test coverage
  - **Do**:
    1. Run pytest with coverage on all new modules
    2. Ensure coverage > 80% on new code
    3. Add any missing test cases to reach threshold
  - **Verify**: `pytest tests/test_llm_*.py tests/test_safety_config.py tests/test_bridge_cli.py tests/test_bridge_service_safety.py --cov=systems.evolution_daemon.wordpress.llm_expansion_service --cov=systems.evolution_daemon.wordpress.safety_config --cov-report=term-missing`
  - **Done when**: Coverage > 80% on new modules
  - **Commit**: `test(evolution): improve test coverage to >80%`

- [ ] 4.2 Create documentation
  - **Do**:
    1. Create `systems/evolution_daemon/wordpress/README_LLM_EXPANSION.md`
    2. Document template mode vs LLM mode usage
    3. Document CLI flags: --llm, --llm-model, --llm-temperature, --no-backup
    4. Document safety features: backup, confidence thresholds, fallback
    5. Document comparison table of template vs LLM modes
    6. Document ZAI_API_KEY environment variable
  - **Files**: `systems/evolution_daemon/wordpress/README_LLM_EXPANSION.md`
  - **Done when**: README explains all features, includes examples
  - **Verify**: `test -f systems/evolution_daemon/wordpress/README_LLM_EXPANSION.md && grep -q "llm" systems/evolution_daemon/wordpress/README_LLM_EXPANSION.md && echo "PASS"`
  - **Commit**: `docs(evolution): add LLM expansion usage documentation`
  - _Requirements: FR-10, NFR-6_
  - _Design: Documentation_

- [ ] 4.3 Final verification: all tests pass
  - **Do**:
    1. Run complete test suite
    2. Verify no regressions in existing tests
    3. Verify all new tests pass
  - **Verify**: `pytest tests/test_llm_expansion_service.py tests/test_safety_config.py tests/test_bridge_cli.py tests/test_wordpress_content_analyzer.py tests/test_bridge_service_safety.py tests/test_llm_expansion_integration.py -v`
  - **Done when**: All tests green, no errors
  - **Commit**: None

## Phase 5: PR Lifecycle

- [ ] 5.1 Create PR and verify CI
  - **Do**:
    1. Verify on feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/llm-powered-expansion`
    3. Create PR: `gh pr create --title "feat(evolution): add LLM-powered content expansion" --body "$(cat <<'EOF'
## Summary
- Add LLMExpansionService for intelligent content expansion via ZAI Bridge (GLM-4)
- Add SafetyConfig and ContentBackup for safe modifications with zero data loss
- Add CLI flags: --llm, --llm-model, --llm-temperature, --no-backup
- Automatic fallback to template expansion on LLM errors (100% reliability)
- Content backups before modification with restore capability
- Quality metrics: confidence scoring (0.0-1.0), length ratio, structure markers

## Test Plan
- [ ] Unit tests for LLMExpansionService pass
- [ ] Unit tests for SafetyConfig/ContentBackup pass
- [ ] CLI flag parsing tests pass
- [ ] Integration tests pass
- [ ] E2E flow validated with mock API

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"`
    4. Wait for CI: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: All CI checks pass
  - **Commit**: None

- [ ] 5.2 Final AC verification
  - **Do**:
    1. Verify AC-1.1: --llm defaults to False
    2. Verify AC-1.2: --llm-model accepts model name
    3. Verify AC-1.3: --llm-temperature accepts float 0.0-1.0
    4. Verify AC-2.1: Fallback on timeout
    5. Verify AC-2.2: Fallback on API error
    6. Verify AC-2.3: fallback_used flag in result
    7. Verify AC-2.4: Fallback confidence 0.3
    8. Verify AC-3.1: Confidence score in result
    9. Verify AC-4.1: require_backup defaults True
    10. Verify AC-4.2: Backups to configurable dir
    11. Verify AC-4.3: Backup filename format
    12. Verify AC-4.5: --no-backup disables backup
  - **Verify**: `pytest tests/test_llm_*.py tests/test_safety_config.py tests/test_bridge_cli.py -v && echo "All ACs verified"`
  - **Done when**: All acceptance criteria met
  - **Commit**: None

## Notes

**POC shortcuts taken:**
- Mock mode used for ZAIBridge when no API key available
- Simple confidence calculation (length ratio + structure markers)
- Fallback template is basic placeholder content
- Backup retention uses /tmp (ephemeral)

**Production TODOs:**
- Add backup retention policy with cleanup
- Add rate limiting enforcement (max_modifications_per_hour)
- Consider streaming responses for better UX
- Add cost tracking for API usage
- Consider batch expansion mode
