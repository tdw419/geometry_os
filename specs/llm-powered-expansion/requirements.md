---
spec: llm-powered-expansion
phase: requirements
created: 2026-02-21
---

# Requirements: LLM-Powered WordPress Content Expansion

## Goal

Replace template-based content expansion with intelligent LLM-generated improvements via ZAI Bridge (GLM-4), providing contextual, higher-quality content while maintaining safety through feature flags and fallback mechanisms.

## User Stories

### US-1: Enable LLM Expansion via CLI Flag
**As a** developer
**I want to** enable LLM-powered expansion via `--llm` CLI flag
**So that** I can choose between template-based (fast, free) and LLM-based (intelligent, API) expansion

**Acceptance Criteria:**
- [ ] AC-1.1: `--llm` flag defaults to False (template mode)
- [ ] AC-1.2: `--llm-model` flag accepts model name (default: glm-4-plus)
- [ ] AC-1.3: `--llm-temperature` flag accepts float 0.0-1.0 (default: 0.7)
- [ ] AC-1.4: CLI flags properly propagate to ContentAnalyzer config

### US-2: Automatic Fallback on LLM Failure
**As a** developer
**I want to** see automatic fallback to template expansion when LLM fails
**So that** the system remains resilient and never blocks content improvement

**Acceptance Criteria:**
- [ ] AC-2.1: On API timeout (>5s), system falls back to template with log warning
- [ ] AC-2.2: On API error (rate limit, auth failure), system falls back to template
- [ ] AC-2.3: Fallback content includes `fallback_used=True` flag in ExpansionResult
- [ ] AC-2.4: Fallback confidence set to 0.3 (lower than LLM 0.5+)

### US-3: Review Expansion Quality Metrics
**As a** developer
**I want to** review expansion quality metrics in logs and results
**So that** I can evaluate LLM effectiveness vs template approach

**Acceptance Criteria:**
- [ ] AC-3.1: ExpansionResult includes `confidence` score (0.0-1.0)
- [ ] AC-3.2: Confidence calculation includes length ratio check (target 2-3x)
- [ ] AC-3.3: Confidence calculation includes structure markers (##, -)
- [ ] AC-3.4: Logs include model used, tokens consumed, fallback status

### US-4: Content Backups Before Modification
**As a** developer
**I want to** have automatic content backups created before modification
**So that** I can recover original content if LLM output is unsatisfactory

**Acceptance Criteria:**
- [ ] AC-4.1: SafetyConfig defaults `require_backup=True`
- [ ] AC-4.2: Backups saved to configurable directory (default: /tmp/wp_evolution_backups)
- [ ] AC-4.3: Backup filename format: `post_{id}_{timestamp}.json`
- [ ] AC-4.4: ContentBackup.load(post_id) returns most recent backup
- [ ] AC-4.5: Backup disabled only with explicit `--no-backup` flag

## Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-1 | LLMExpansionService wraps ZAIBridge.chat() with async support | P1 | Unit test verifies chat() called with "coder" persona |
| FR-2 | ContentAnalyzer accepts `llm_enabled` flag in `__init__` | P1 | Constructor accepts llm_enabled: bool = False |
| FR-3 | SafetyConfig provides backup and validation settings | P1 | Defaults: require_backup=True, min_confidence=0.7 |
| FR-4 | CLI provides `--llm`, `--llm-model`, `--llm-temperature` flags | P1 | argparse accepts and parses all three flags |
| FR-5 | On LLM error, fallback to template within 30s timeout | P1 | Test with invalid API key returns template content |
| FR-6 | Confidence scoring validates LLM output quality | P2 | Score formula: base 0.5 + length_ratio + structure + relevance |
| FR-7 | BridgeService integrates safety validation | P2 | validate_proposal_safety() called before execution |
| FR-8 | ContentBackup saves/loads JSON with metadata | P2 | Backup file includes post_id, content, timestamp, restored flag |
| FR-9 | ZAI_API_KEY environment variable read for authentication | P2 | Falls back to mock mode if not set |
| FR-10 | Logging includes expansion metrics | P3 | Log: model, tokens, confidence, fallback status |

## Non-Functional Requirements

| ID | Requirement | Metric | Target |
|----|-------------|--------|--------|
| NFR-1 | Response Time | LLM call duration | < 5s (with fallback at 30s) |
| NFR-2 | Data Safety | Zero data loss | 100% backup before modification |
| NFR-3 | Test Coverage | pytest --cov | > 80% on new modules |
| NFR-4 | Code Quality | make lint | 0 errors |
| NFR-5 | Reliability | Fallback success rate | 100% (never block on LLM) |
| NFR-6 | Observability | Log coverage | All expansion paths logged |

## Glossary

| Term | Definition |
|------|------------|
| **LLM** | Large Language Model (GLM-4 via ZAI Bridge) |
| **ZAI Bridge** | Python wrapper for Zhipu AI GLM-4 API with retry and mock support |
| **ContentAnalyzer** | Class that analyzes WordPress posts and proposes improvements |
| **SafetyConfig** | Dataclass with backup requirements, confidence thresholds, limits |
| **ExpansionResult** | Dataclass with expanded content, confidence, model used, fallback flag |
| **Template Mode** | Default mode using hardcoded expansion templates |
| **LLM Mode** | Optional mode using GLM-4 for contextual expansion |

## Out of Scope

- Multi-model support (GPT-4, Claude, etc.) - only GLM-4 via ZAI Bridge
- Streaming responses - blocking call with timeout sufficient
- Human review UI - CLI only for now
- WordPress REST API integration - assume posts provided as dicts
- Content diff visualization - logs only
- Batch expansion - single post at a time
- Cost tracking - API usage not metered

## Dependencies

| Dependency | Type | Status | Notes |
|------------|------|--------|-------|
| zhipuai SDK | Optional | Available | Falls back to mock mode if missing |
| ZAI_API_KEY | Environment | Required for LLM | Mock mode available for testing |
| asyncio | Standard Library | Available | Python 3.12 |
| pytest | Dev | Available | Test framework |

## User Decisions

> Interview responses captured during requirements gathering

| Question | Response |
|----------|----------|
| Primary users | Internal developers only |
| Priority tradeoffs | Prioritize code quality over speed |
| Success criteria | Feature works as specified |
| Temperature setting | 0.7 (per plan suggestion) |
| Max tokens | 1024 (per plan suggestion) |
| Backup retention | /tmp (temporary, per plan) |

## Unresolved Questions

1. **Backup retention policy** - Currently /tmp with no cleanup. Need retention period?
2. **Rate limiting specifics** - Plan mentions 10/hour default. Is this sufficient?
3. **Mock mode behavior** - Should mock return realistic content or simple template?

## Success Criteria

- All 7 TDD tasks from implementation plan pass
- `pytest tests/test_llm_* tests/test_safety_config.py -v` passes
- `--llm` flag produces measurably different content than template
- Fallback works within 30s on invalid API key
- Zero data loss: backup exists for every modification

## Next Steps

1. Create `LLMExpansionService` with ZAIBridge integration (Task 1)
2. Integrate service into `ContentAnalyzer` with feature flag (Task 2)
3. Add `SafetyConfig` and `ContentBackup` classes (Task 3)
4. Wire safety into `BridgeService` (Task 4)
5. Add CLI flags for LLM configuration (Task 5)
6. Write integration tests for full flow (Task 6)
7. Document usage in README_LLM_EXPANSION.md (Task 7)
