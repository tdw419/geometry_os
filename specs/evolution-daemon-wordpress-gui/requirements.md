---
spec: evolution-daemon-wordpress-gui
phase: requirements
created: 2026-02-21T11:32:00Z
generated: auto
---

# Requirements: Evolution Daemon WordPress GUI Integration

## Summary

Enable Evolution Daemon to autonomously analyze, propose, and execute WordPress content improvements via Playwright bridge with memory sync.

## User Stories

### US-1: Content Analysis
As an Evolution Daemon, I want to analyze WordPress posts so that I can identify improvement opportunities.

**Acceptance Criteria**:
- AC-1.1: Analyzer returns ContentAnalysis with word_count, readability_score, issues, strengths
- AC-1.2: Empty posts return None (skip analysis)
- AC-1.3: Readability score normalized to 0.0-1.0 range
- AC-1.4: Issues list includes specific problems (e.g., "Content too short")

### US-2: Improvement Proposals
As an Evolution Daemon, I want to propose actionable improvements so that WordPress content quality improves over time.

**Acceptance Criteria**:
- AC-2.1: Proposal includes post_id, improvement_type, suggested_content, confidence
- AC-2.2: improvement_type in ["expand", "enhance", "correct"]
- AC-2.3: Confidence score 0.0-1.0 based on analysis severity
- AC-2.4: Target selector for Playwright automation included

### US-3: Evolution Cycles
As a system operator, I want evolution cycles to run automatically so that content improves without manual intervention.

**Acceptance Criteria**:
- AC-3.1: Agent fetches posts from WordPress via ai-publisher.php
- AC-3.2: Cycle returns EvolutionCycleResult with counts and proposals
- AC-3.3: Strong posts (high readability, good length) get low confidence proposals
- AC-3.4: Weak posts get actionable high-confidence proposals

### US-4: Playwright Execution
As an Evolution Daemon, I want to execute approved changes via Playwright so that WordPress content is updated automatically.

**Acceptance Criteria**:
- AC-4.1: Executor connects to Playwright bridge via WebSocket
- AC-4.2: Navigate to post edit page via WordPress admin URL
- AC-4.3: Update content field with proposed improvements
- AC-4.4: Click publish button to save changes

### US-5: Memory Sync
As a Memory Beams user, I want WordPress changes to sync to vector memory so that Memory Beams reflect updated content.

**Acceptance Criteria**:
- AC-5.1: Memory sync triggered after successful improvement execution
- AC-5.2: WordPressMemoryProvider.sync_posts() called on changes
- AC-5.3: Graceful fallback if memory provider unavailable

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | ContentAnalyzer with readability scoring | Must | US-1 |
| FR-2 | ImprovementProposal generation with confidence | Must | US-2 |
| FR-3 | WordPressEvolutionAgent with async cycles | Must | US-3 |
| FR-4 | PlaywrightActionExecutor with WebSocket | Must | US-4 |
| FR-5 | WPEvolutionBridgeService orchestrator | Must | US-3, US-4 |
| FR-6 | Memory sync after improvements | Should | US-5 |
| FR-7 | CLI entry point with args | Should | US-3 |
| FR-8 | Configurable cycle interval | Should | US-3 |
| FR-9 | Auto-execute mode with min_confidence filter | Should | US-3, US-4 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Cycle latency < 30s for 20 posts | Performance |
| NFR-2 | WebSocket connection resilience | Reliability |
| NFR-3 | Safety pipeline integration (V11+) | Security |
| NFR-4 | Structured logging with cycle metrics | Observability |

## Out of Scope

- Multi-site WordPress support (single localhost:8080 only)
- Image/media content analysis (text only)
- Real-time collaborative editing
- Custom post types (posts only)

## Dependencies

- Visual Bridge (port 8768) running
- WordPress at localhost:8080 with ai-publisher.php
- Playwright bridge at tile (3200, 1200)
- Evolution Daemon V11+ safety pipeline
