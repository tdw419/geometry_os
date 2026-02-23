---
spec: wordpress-truth-daemon
phase: requirements
created: 2026-02-22T12:00:00Z
generated: auto
---

# Requirements: WordPress Truth Daemon

## Summary
Daemon extracts factual claims from WordPress content, scores using hybrid CTRM formula, stores in CTRM database with periodic verification.

## User Stories

### US-1: Content Discovery
As a **system administrator**, I want **WordPress content polled automatically** so that **new posts are processed for truth extraction**.

**Acceptance Criteria**:
- AC-1.1: Daemon polls WordPress every 60 seconds (configurable)
- AC-1.2: Filters by post_types: post, page, research_document
- AC-1.3: Only processes content modified since last poll
- AC-1.4: Batches requests to limit load (max 5 posts per cycle)

### US-2: Claim Extraction
As a **truth system**, I want **LLM extraction of factual claims** so that **atomic truths are captured from content**.

**Acceptance Criteria**:
- AC-2.1: Extracts discrete, atomic factual assertions
- AC-2.2: LLM assigns confidence score (0.0-1.0) per claim
- AC-2.3: Classifies evidence type: E1 (Physical), E2 (Textual), E3 (Logical)
- AC-2.4: Handles empty/short content gracefully (returns empty list)
- AC-2.5: Limits content to 4000 chars for token efficiency

### US-3: Hybrid Scoring
As a **CTRM system**, I want **multi-factor confidence scoring** so that **truths reflect source reliability**.

**Acceptance Criteria**:
- AC-3.1: Combines LLM confidence (40%), author role (30%), source type (20%), corroboration (10%)
- AC-3.2: Admin role boosts confidence vs contributor
- AC-3.3: Research documents weighted higher than comments
- AC-3.4: Corroboration boost: +0.05 per similar truth, max +0.2
- AC-3.5: Calculates distance_from_center (50-90 range)

### US-4: Truth Storage
As a **CTRM database**, I want **truths stored with metadata** so that **provenance is preserved**.

**Acceptance Criteria**:
- AC-4.1: Stores in ctrm_truths table via CTRMDatabase
- AC-4.2: Category set to "wordpress_extracted"
- AC-4.3: Metadata includes source_url, source_type, triad_components
- AC-4.4: Embedding generated for semantic search

### US-5: WordPress Feedback
As a **WordPress admin**, I want **CTRM scores written to post meta** so that **content quality is visible in CMS**.

**Acceptance Criteria**:
- AC-5.1: Updates _ctrm_score (average confidence of extracted truths)
- AC-5.2: Updates _ctrm_truth_count (number of truths extracted)
- AC-5.3: Updates _last_extraction_time (ISO timestamp)

### US-6: Periodic Verification
As a **system**, I want **hourly truth verification cycles** so that **confidence decays or strengthens over time**.

**Acceptance Criteria**:
- AC-6.1: Runs verification every 3600 seconds (configurable)
- AC-6.2: Uses CTRMTruthManager.verify_foundational_truths()
- AC-6.3: Respects max_tokens_per_cycle budget (5000 default)
- AC-6.4: Logs verification results

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Poll WordPress for modified content via ai-publisher.php | Must | US-1 |
| FR-2 | Extract claims using LM Studio with structured JSON output | Must | US-2 |
| FR-3 | Calculate hybrid score using triad formula | Must | US-3 |
| FR-4 | Store truths in CTRMDatabase with category=wordpress_extracted | Must | US-4 |
| FR-5 | Update WordPress post meta with CTRM scores | Should | US-5 |
| FR-6 | Run hourly verification cycles | Should | US-6 |
| FR-7 | Support configurable poll interval, batch size, model | Should | US-1 |
| FR-8 | Graceful degradation when LM Studio unavailable | Should | US-2 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Poll cycle completes within poll_interval seconds | Performance |
| NFR-2 | Token usage tracked per extraction | Observability |
| NFR-3 | Daemon responds to SIGTERM/SIGINT for clean shutdown | Reliability |
| NFR-4 | All operations logged with timestamps | Observability |
| NFR-5 | Database uses WAL mode for concurrency | Reliability |

## Out of Scope

- Real-time WebSocket push to WordPress
- Multi-site WordPress support (single localhost:8080 only)
- Custom embedding model (uses LM Studio default)
- Truth deletion/archival policies
- WordPress authentication beyond daemon mode

## Dependencies

| Dep | Type | Notes |
|-----|------|-------|
| WordPress + ai-publisher.php | External | Must have getModifiedContent, updatePostMeta, getPostAuthor endpoints |
| LM Studio running | External | Local model loaded (microsoft/phi-4 preferred) |
| CTRMDatabase | Internal | src/ctrm_core/database.py |
| CTRMTruthManager | Internal | src/ctrm_core/truth_manager.py |
| LMStudioIntegration | Internal | src/lm_studio/integration.py |
