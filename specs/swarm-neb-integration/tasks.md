---
spec: swarm-neb-integration
phase: tasks
total_tasks: 10
created: 2026-02-22T22:00:00Z
---

# Tasks: SwarmNEBBridge Integration

## Phase 1: Make It Work (POC)

Focus: Build core SwarmNEBBridge with proposal/vote/consensus publishing. Skip tests initially, validate via direct usage.

- [x] 1.1 Create SwarmNEBBridge class with constructor
  - **Do**:
    1. Create `systems/swarm/swarm_neb_bridge.py`
    2. Import SwarmNode, NEBBus, and consensus types
    3. Define SwarmNEBBridge class with optional event_bus param (follow TaskBoard pattern)
    4. Store references to SwarmNode and optional NEBBus
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/swarm_neb_bridge.py`
  - **Done when**: Class instantiates with SwarmNode and optional NEBBus
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "from systems.swarm.swarm_neb_bridge import SwarmNEBBridge; print('OK')"`
  - **Commit**: `feat(swarm): add SwarmNEBBridge class skeleton`
  - _Requirements: FR-1 (NEBBus integration)_
  - _Design: Two-layer architecture_

- [x] 1.2 Implement create_proposal with NEB publishing
  - **Do**:
    1. Add `create_proposal()` method that delegates to SwarmNode.create_proposal()
    2. If event_bus exists, publish to `swarm.proposal.{id}` with payload: proposal_id, title, description, proposer
    3. Return the SwarmProposal
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/swarm_neb_bridge.py`
  - **Done when**: Proposal created and event published to NEBBus
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
import tempfile
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus
bus = NEBBus(node_id='test')
events = []
bus.subscribe('swarm.proposal.*', lambda s: events.append(s))
with tempfile.TemporaryDirectory() as d:
    bridge = SwarmNEBBridge(clipboard_url=d + '/clip', event_bus=bus)
    p = bridge.create_proposal('Test', 'Description')
    assert len(events) == 1, 'Event not published'
    print('OK')
"`
  - **Commit**: `feat(swarm): add create_proposal with NEB publishing`
  - _Requirements: FR-1, FR-2_
  - _Design: Event topic: swarm.proposal.{id}_

- [x] 1.3 Implement create_vote with NEB publishing
  - **Do**:
    1. Add `create_vote()` method that delegates to SwarmNode.create_vote()
    2. If event_bus exists, publish to `swarm.vote.{proposal_id}` with payload: proposal_id, voter, approve, confidence
    3. Return the SwarmVote
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/swarm_neb_bridge.py`
  - **Done when**: Vote created and event published to NEBBus
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
import tempfile
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus
bus = NEBBus(node_id='test')
events = []
bus.subscribe('swarm.vote.*', lambda s: events.append(s))
with tempfile.TemporaryDirectory() as d:
    bridge = SwarmNEBBridge(clipboard_url=d + '/clip', event_bus=bus)
    p = bridge.create_proposal('Test', 'Desc')
    v = bridge.create_vote(p.id, True, 0.9)
    assert len(events) == 1, 'Vote event not published'
    print('OK')
"`
  - **Commit**: `feat(swarm): add create_vote with NEB publishing`
  - _Requirements: FR-1, FR-3_
  - _Design: Event topic: swarm.vote.{proposal_id}_

- [x] 1.4 Implement evaluate_consensus with NEB publishing
  - **Do**:
    1. Add `evaluate_consensus()` method that:
       - Collects votes via SwarmNode.collect_votes()
       - Adds votes to proposal
       - Evaluates via SwarmNode.evaluate_proposal()
    2. If event_bus exists, publish to `swarm.consensus.{proposal_id}` with payload: proposal_id, weighted_approval, approved, vote_count
    3. Return the evaluation result dict
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/swarm_neb_bridge.py`
  - **Done when**: Consensus evaluated and event published to NEBBus
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
import tempfile
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus
bus = NEBBus(node_id='test')
events = []
bus.subscribe('swarm.consensus.*', lambda s: events.append(s))
with tempfile.TemporaryDirectory() as d:
    bridge = SwarmNEBBridge(clipboard_url=d + '/clip', event_bus=bus, threshold=0.6)
    p = bridge.create_proposal('Test', 'Desc')
    bridge.node.broadcast_proposal(p)
    v = bridge.create_vote(p.id, True, 0.9)
    bridge.node.broadcast_vote(v)
    result = bridge.evaluate_consensus(p.id)
    assert len(events) == 1, 'Consensus event not published'
    assert result['approved'] == True, 'Should be approved'
    print('OK')
"`
  - **Commit**: `feat(swarm): add evaluate_consensus with NEB publishing`
  - _Requirements: FR-1, FR-4_
  - _Design: Event topic: swarm.consensus.{proposal_id}_

- [x] 1.5 [VERIFY] Quality checkpoint: POC end-to-end validation
  - **Do**: Run complete POC flow: create proposal, vote, evaluate consensus, verify NEB events
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
import tempfile
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus
bus = NEBBus(node_id='test')
proposal_events = []
vote_events = []
consensus_events = []
bus.subscribe('swarm.proposal.*', lambda s: proposal_events.append(s))
bus.subscribe('swarm.vote.*', lambda s: vote_events.append(s))
bus.subscribe('swarm.consensus.*', lambda s: consensus_events.append(s))
with tempfile.TemporaryDirectory() as d:
    bridge = SwarmNEBBridge(clipboard_url=d + '/clip', event_bus=bus, threshold=0.6)
    p = bridge.create_proposal('E2E Test', 'Full flow validation')
    bridge.node.broadcast_proposal(p)
    v = bridge.create_vote(p.id, True, 0.95, 'High confidence approval')
    bridge.node.broadcast_vote(v)
    result = bridge.evaluate_consensus(p.id)
    assert len(proposal_events) == 1, f'Expected 1 proposal, got {len(proposal_events)}'
    assert len(vote_events) == 1, f'Expected 1 vote, got {len(vote_events)}'
    assert len(consensus_events) == 1, f'Expected 1 consensus, got {len(consensus_events)}'
    assert result['approved'] == True, 'Should be approved with 0.95 confidence'
    assert result['weighted_approval'] >= 0.95, 'Weighted approval should be >= 0.95'
    print('POC E2E PASSED')
"`
  - **Done when**: All events published, consensus evaluates correctly
  - **Commit**: `feat(swarm): complete SwarmNEBBridge POC`

## Phase 2: Refactoring

Focus: Add subscription methods for real-time notifications.

- [x] 2.1 Implement subscribe_to_proposals method
  - **Do**:
    1. Add `subscribe_to_proposals(callback)` method
    2. Subscribe to `swarm.proposal.*` wildcard pattern
    3. Return subscription ID for later unsubscription
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/swarm_neb_bridge.py`
  - **Done when**: Can subscribe to all proposal events via wildcard
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
import tempfile
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus
bus = NEBBus(node_id='test')
proposals = []
with tempfile.TemporaryDirectory() as d:
    bridge = SwarmNEBBridge(clipboard_url=d + '/clip', event_bus=bus)
    sub_id = bridge.subscribe_to_proposals(lambda s: proposals.append(s))
    p = bridge.create_proposal('Sub Test', 'Testing subscription')
    assert len(proposals) == 1, 'Proposal not received via subscription'
    assert sub_id is not None, 'Subscription ID not returned'
    print('OK')
"`
  - **Commit**: `feat(swarm): add subscribe_to_proposals method`
  - _Requirements: FR-5 (real-time subscriptions)_

- [x] 2.2 Implement subscribe_to_votes method
  - **Do**:
    1. Add `subscribe_to_votes(callback)` method
    2. Subscribe to `swarm.vote.*` wildcard pattern
    3. Return subscription ID
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/swarm_neb_bridge.py`
  - **Done when**: Can subscribe to all vote events
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
import tempfile
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus
bus = NEBBus(node_id='test')
votes = []
with tempfile.TemporaryDirectory() as d:
    bridge = SwarmNEBBridge(clipboard_url=d + '/clip', event_bus=bus)
    sub_id = bridge.subscribe_to_votes(lambda s: votes.append(s))
    p = bridge.create_proposal('Vote Sub Test', 'Testing vote subscription')
    v = bridge.create_vote(p.id, True, 0.8)
    assert len(votes) == 1, 'Vote not received via subscription'
    print('OK')
"`
  - **Commit**: `feat(swarm): add subscribe_to_votes method`
  - _Requirements: FR-5_

- [x] 2.3 Implement subscribe_to_consensus method
  - **Do**:
    1. Add `subscribe_to_consensus(callback)` method
    2. Subscribe to `swarm.consensus.*` wildcard pattern
    3. Return subscription ID
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/swarm_neb_bridge.py`
  - **Done when**: Can subscribe to all consensus events
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
import tempfile
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus
bus = NEBBus(node_id='test')
consensus = []
with tempfile.TemporaryDirectory() as d:
    bridge = SwarmNEBBridge(clipboard_url=d + '/clip', event_bus=bus, threshold=0.5)
    sub_id = bridge.subscribe_to_consensus(lambda s: consensus.append(s))
    p = bridge.create_proposal('Consensus Sub Test', 'Testing consensus subscription')
    bridge.node.broadcast_proposal(p)
    v = bridge.create_vote(p.id, True, 0.7)
    bridge.node.broadcast_vote(v)
    result = bridge.evaluate_consensus(p.id)
    assert len(consensus) == 1, 'Consensus event not received via subscription'
    print('OK')
"`
  - **Commit**: `feat(swarm): add subscribe_to_consensus method`
  - _Requirements: FR-5_

- [x] 2.4 [VERIFY] Quality checkpoint: lint + typecheck
  - **Do**: Run quality commands on the new module
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m py_compile systems/swarm/swarm_neb_bridge.py && echo "Syntax OK"`
  - **Done when**: No syntax errors
  - **Commit**: `chore(swarm): pass quality checkpoint` (if fixes needed)

## Phase 3: Testing

Focus: Add unit and integration tests following existing patterns.

- [x] 3.1 Unit tests for SwarmNEBBridge
  - **Do**:
    1. Create test file at `tests/swarm/test_swarm_neb_bridge.py`
    2. Test constructor with and without event_bus
    3. Test create_proposal publishes to NEBBus
    4. Test create_vote publishes to NEBBus
    5. Test evaluate_consensus publishes to NEBBus
    6. Use tempfile.TemporaryDirectory for isolation (follow test_swarm_agent_neb.py pattern)
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/tests/swarm/test_swarm_neb_bridge.py`
  - **Done when**: All unit tests pass
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && pytest tests/swarm/test_swarm_neb_bridge.py -v`
  - **Commit**: `test(swarm): add SwarmNEBBridge unit tests`
  - _Requirements: AC-1 (TDD approach)_

- [x] 3.2 Integration tests with SwarmNode
  - **Do**:
    1. Add integration test class to test file
    2. Test complete flow: proposal -> vote -> consensus with NEB notifications
    3. Test subscription methods receive correct events
    4. Test multi-node scenario (two bridges sharing clipboard)
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/tests/swarm/test_swarm_neb_bridge.py`
  - **Done when**: Integration tests pass
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && pytest tests/swarm/test_swarm_neb_bridge.py -v -k "integration"`
  - **Commit**: `test(swarm): add SwarmNEBBridge integration tests`
  - _Requirements: AC-2 (end-to-end validation)_

- [x] 3.3 [VERIFY] Quality checkpoint: all swarm tests pass
  - **Do**: Run complete swarm test suite
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && pytest tests/swarm/ -v`
  - **Done when**: All tests pass, no regressions
  - **Commit**: `chore(swarm): pass swarm test suite checkpoint` (if fixes needed)

## Phase 4: Quality Gates

- [x] 4.1 Local quality check
  - **Do**: Run all quality checks locally
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && pytest tests/swarm/ -v --tb=short`
  - **Done when**: All tests pass
  - **Commit**: `fix(swarm): address test issues` (if fixes needed)

- [x] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin <branch-name>`
    3. Create PR using gh CLI
  - **Verify**: `gh pr checks --watch` (all checks must pass)
  - **Done when**: CI passes, PR ready for review
  - **Commit**: None
  - **Note**: PR #18 already merged - work is complete in main

## Phase 5: Module Exports

- [x] 5.1 Export SwarmNEBBridge from swarm module
  - **Do**:
    1. Check for `systems/swarm/__init__.py`
    2. Add SwarmNEBBridge to exports if __init__.py exists
    3. If no __init__.py, verify import path works directly
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/swarm/__init__.py` (if exists)
  - **Done when**: Can import via `from systems.swarm import SwarmNEBBridge`
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "from systems.swarm.swarm_neb_bridge import SwarmNEBBridge; print('Module export OK')"`
  - **Commit**: `feat(swarm): export SwarmNEBBridge from module`

## Notes

- **POC shortcuts**: Direct inline verification via python -c commands
- **Test isolation**: Using tempfile.TemporaryDirectory following test_swarm_agent_neb.py pattern
- **Backward compat**: event_bus is optional - SwarmNode works without NEBBus

## Unresolved Questions

None - patterns are well-established from TaskBoard and SwarmAgent NEB integration.
