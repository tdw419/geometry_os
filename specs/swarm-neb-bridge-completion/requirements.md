---
spec: swarm-neb-bridge-completion
phase: requirements
created: 2026-02-22T12:00:00Z
generated: auto
---

# Requirements: SwarmNEBBridge Completion

## Summary

Add subscription methods to SwarmNEBBridge for real-time notifications of consensus events (proposals, votes, consensus results).

## User Stories

### US-1: React to New Proposals
As a swarm agent, I want to subscribe to proposal events so that I can react when new proposals are created.

**Acceptance Criteria**:
- AC-1.1: subscribe_to_proposals(callback) returns subscription_id
- AC-1.2: Callback receives NEBSignal with topic "swarm.proposal.*"
- AC-1.3: Callback payload includes proposal_id, title, description, proposer
- AC-1.4: RuntimeError raised when no event_bus configured

### US-2: React to Votes
As a swarm agent, I want to subscribe to vote events so that I can track voting progress.

**Acceptance Criteria**:
- AC-2.1: subscribe_to_votes(callback) returns subscription_id
- AC-2.2: Callback receives NEBSignal with topic "swarm.vote.*"
- AC-2.3: Callback payload includes proposal_id, voter, approve, confidence

### US-3: React to Consensus Results
As a swarm agent, I want to subscribe to consensus events so that I can act on approved/rejected proposals.

**Acceptance Criteria**:
- AC-3.1: subscribe_to_consensus(callback) returns subscription_id
- AC-3.2: Callback receives NEBSignal with topic "swarm.consensus.*"
- AC-3.3: Callback payload includes proposal_id, weighted_approval, approved, vote_count

### US-4: Unsubscribe from Events
As a swarm agent, I want to unsubscribe from events so that I can stop receiving notifications.

**Acceptance Criteria**:
- AC-4.1: unsubscribe(subscription_id) returns True if found, False otherwise
- AC-4.2: Unsubscribed callbacks no longer receive events

### US-5: Graceful Degradation
As a developer, I want SwarmNEBBridge to work without event_bus so that core consensus operations remain functional.

**Acceptance Criteria**:
- AC-5.1: create_proposal, create_vote, evaluate_consensus work without event_bus
- AC-5.2: Subscription methods raise RuntimeError without event_bus
- AC-5.3: unsubscribe returns False without event_bus

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | subscribe_to_proposals(callback) -> subscription_id | Must | US-1 |
| FR-2 | subscribe_to_votes(callback) -> subscription_id | Must | US-2 |
| FR-3 | subscribe_to_consensus(callback) -> subscription_id | Must | US-3 |
| FR-4 | unsubscribe(subscription_id) -> bool | Must | US-4 |
| FR-5 | RuntimeError when subscribing without event_bus | Must | US-1, US-5 |
| FR-6 | Core operations work without event_bus | Must | US-5 |
| FR-7 | SwarmNEBBridge exported from systems.swarm module | Must | - |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Subscription overhead < 1ms | Performance |
| NFR-2 | All existing swarm tests continue to pass | Compatibility |

## Out of Scope

- Async/callback scheduling optimization
- Historical event replay
- Persistent subscriptions

## Dependencies

- systems.swarm.neb_bus.NEBBus
- systems.swarm.neb_signal.NEBSignal
