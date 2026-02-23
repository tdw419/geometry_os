# Swarm Consensus - Tasks

## Task 1: Create Swarm Proposal and Vote Data Structures
- [x] Create `systems/swarm/consensus.py`
- [x] Create `tests/test_swarm_consensus.py`
- [x] SwarmProposal, SwarmVote dataclasses
- [x] TDD approach

## Task 2: Create Weighted Confidence Strategy
- Add WeightedConfidenceCalculator to consensus.py
- Formula: sum(confidence*approve) / sum(confidence)

## Task 3: Create Swarm Channel
- Create `systems/swarm/swarm_channel.py`
- Clipboard-based communication

## Task 4: Create Swarm Node
- Create `systems/swarm/swarm_node.py`
- Node coordination logic

## Task 5: Integration Tests
- Create `tests/test_swarm_integration.py`

## Task 6: CLI Tool
- Create `systems/swarm/swarm_cli.py`
