---
spec: swarm-neb-bridge-completion
phase: research
created: 2026-02-22T12:00:00Z
generated: auto
---

# Research: SwarmNEBBridge Completion

## Executive Summary

Complete SwarmNEBBridge with subscription methods for real-time consensus notifications. Pattern exists in TaskBoard + SwarmAgent integration. Feasibility: High.

## Codebase Analysis

### Existing Patterns

| File | Pattern | Relevance |
|------|---------|-----------|
| `systems/swarm/swarm_neb_bridge.py` | Core bridge with create_proposal, create_vote, evaluate_consensus | Direct modification target |
| `systems/swarm/neb_bus.py` | NEBBus.subscribe(pattern, callback) -> sub_id | API to wrap |
| `systems/swarm/swarm_node.py` | SwarmNode with broadcast_proposal, collect_votes | Delegated operations |
| `tests/swarm/test_swarm_agent_neb.py` | SwarmAgent.subscribe_to_events(bus) pattern | Test pattern to follow |

### Key API Signatures

```python
# NEBBus.subscribe returns subscription_id
def subscribe(self, pattern: str, callback: Callable[[NEBSignal], None]) -> str

# NEBBus.unsubscribe returns bool
def unsubscribe(self, subscription_id: str) -> bool

# SwarmAgent pattern for event subscription
agent.subscribe_to_events(bus)  # Uses "task.**" wildcard
```

### Event Topics Published

| Method | Topic Pattern | Payload |
|--------|---------------|---------|
| create_proposal | `swarm.proposal.{proposal_id}` | proposal_id, title, description, proposer |
| create_vote | `swarm.vote.{proposal_id}` | proposal_id, voter, approve, confidence |
| evaluate_consensus | `swarm.consensus.{proposal_id}` | proposal_id, weighted_approval, approved, vote_count |

### Dependencies

- NEBBus (already imported via TYPE_CHECKING)
- NEBSignal (passed to callbacks)
- tempfile for test isolation (pytest fixture pattern)

### Constraints

- Must raise RuntimeError when subscribing without event_bus
- Must gracefully degrade (work without event_bus for core ops)
- Wildcard patterns: `swarm.proposal.*`, `swarm.vote.*`, `swarm.consensus.*`

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Pattern exists in SwarmAgent, straightforward delegation |
| Effort Estimate | S | 4 methods, 7 tests, 1 export |
| Risk Level | Low | No breaking changes, additive only |

## Recommendations

1. Follow SwarmAgent.subscribe_to_events pattern for consistency
2. Use RuntimeError for missing event_bus (matches Python conventions)
3. Reuse wildcard matching from NEBBus (already tested)
