---
spec: swarm-intelligence
phase: requirements
created: 2026-02-22T12:00:00Z
generated: auto
---

# Requirements: swarm-intelligence

## Summary

Decentralized MapReduce-style swarm coordination where agents claim tasks from shared TaskBoard, execute work, and post results. Coordinator splits work (map) and aggregates results (reduce).

## User Stories

### US-1: Parallel Code Analysis
As a **developer**, I want **multiple agents to analyze different code modules in parallel** so that **analysis completes faster**.

**Acceptance Criteria**:
- AC-1.1: TaskBoard can receive N subtasks from map operation
- AC-1.2: Agents claim tasks atomically (no double-claim)
- AC-1.3: Results merge into unified report

### US-2: Competitive Solution Exploration
As a **developer**, I want **agents to try different approaches and pick the best** so that **I get optimal solutions**.

**Acceptance Criteria**:
- AC-2.1: Multiple subtasks with different payloads
- AC-2.2: best_score reduction picks highest-scored result
- AC-2.3: Final result contains winning approach

### US-3: Distributed Review Voting
As a **code reviewer**, I want **multiple agents to vote on decisions** so that **consensus emerges democratically**.

**Acceptance Criteria**:
- AC-3.1: Each reviewer submits decision
- AC-3.2: majority_vote picks most common decision
- AC-3.3: Ties handled gracefully

### US-4: Task Progress Tracking
As a **coordinator**, I want **to track MapReduce job progress** so that **I know when to reduce**.

**Acceptance Criteria**:
- AC-4.1: get_progress() returns completed/total counts
- AC-4.2: Progress percentage calculated
- AC-4.3: is_complete flag when all done

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Task dataclass with status lifecycle (PENDING->CLAIMED->IN_PROGRESS->COMPLETED/FAILED) | Must | US-1 |
| FR-2 | TaskBoard with atomic claim() using file locking | Must | US-1 |
| FR-3 | SwarmAgent with capabilities-based task claiming | Must | US-1 |
| FR-4 | SwarmCoordinator.map() creates subtasks with parent_id | Must | US-2 |
| FR-5 | SwarmCoordinator.reduce() aggregates by parent_id | Must | US-2 |
| FR-6 | Reduction strategies: first, best_score, merge_all, majority_vote | Must | US-2, US-3 |
| FR-7 | get_progress() for job monitoring | Should | US-4 |
| FR-8 | Task serialization to/from JSON | Must | FR-2 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Cross-process safe (file locking) | Reliability |
| NFR-2 | No external dependencies (stdlib only) | Maintainability |
| NFR-3 | Test coverage >= 30 tests | Quality |

## Out of Scope
- TelepathyProtocol P2P communication (Phase 2)
- Database-backed TaskBoard
- Distributed node coordination
- Real-time WebSocket updates

## Dependencies
- Python 3.11+ (dataclasses, fcntl, asyncio)
- File system access for task storage
