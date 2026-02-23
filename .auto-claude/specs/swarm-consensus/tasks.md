# Swarm Consensus - Tasks

## Task 1: Create Swarm Proposal and Vote Data Structures
- [x] Create `systems/swarm/consensus.py`
- [x] Create `tests/test_swarm_consensus.py`
- [x] SwarmProposal, SwarmVote dataclasses
- [x] TDD approach

## Task 2: Create Weighted Confidence Strategy
- [x] Add WeightedConfidenceCalculator to consensus.py
- [x] Formula: sum(confidence*approve) / sum(confidence)

## Task 3: Create Swarm Channel
- [x] Create `systems/swarm/swarm_channel.py`
- [x] Clipboard-based communication

## Task 4: Create Swarm Node
- [x] Create `systems/swarm/swarm_node.py`
- [x] Create `tests/test_swarm_node.py`
- [x] Node coordination logic (create_proposal, create_vote, broadcast, collect, evaluate)
- [x] TDD approach - 14 tests passing
- [x] propose_and_vote convenience method

## Task 5: Integration Tests
- Create `tests/test_swarm_integration.py`

## Task 6: CLI Tool
- Create `systems/swarm/swarm_cli.py`
