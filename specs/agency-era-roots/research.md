---
spec: agency-era-roots
phase: research
created: 2026-02-23T12:34:06-06:00
generated: auto
---

# Research: agency-era-roots

## Executive Summary

EpisodicMemory and RecursiveGrowth are feasible additions to the swarm system. Leverage existing NEB infrastructure for embeddings, SubscriptionManager for semantic matching, and evolution_daemon patterns for self-improvement loops. Vector storage can use simple JSON-based persistence initially.

## Codebase Analysis

### Existing Patterns

- **NEBBus/NEBSignal** (`systems/swarm/neb_bus.py`): Event bus with embedding support - `NEBSignal.embedding: Optional[List[float]]`
- **SubscriptionManager** (`systems/swarm/subscription_manager.py`): Semantic matching via cosine similarity - `subscribe_semantic()` with threshold
- **GuildAgent** (`systems/swarm/guilds/base.py`): Base class for specialized agents with event_bus integration
- **SwarmAgent** (`systems/swarm/swarm_agent.py`): Task execution loop with claim/execute/complete pattern
- **EvolutionDaemon** (`systems/evolution_daemon/evolution_daemon.py`): Self-improvement pipeline with V11-V15 stages
- **PatternRecognizer** (`systems/evolution_daemon/pattern_recognizer.py`): Pattern detection framework
- **Senses** (`systems/swarm/senses/`): FilesystemSense, WebSense - extensible perception

### Dependencies

- `numpy`: Cosine similarity calculations (already used in SubscriptionManager)
- `dataclasses`: Structured data (NEBSignal, Task, etc.)
- `json`: Persistence format
- `asyncio`: Async patterns from evolution_daemon

### Constraints

- No external vector DB required initially - JSON file storage acceptable for POC
- Must integrate with existing NEBBus event flow
- Must not break existing swarm tests (72 passing)
- GuildAgents need minimal changes - memory accessed via mixin/composition

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Building on existing NEB/embedding infrastructure |
| Effort Estimate | M | ~15 tasks across 4 phases |
| Risk Level | Low | Additive changes, no breaking modifications |

## Key Integration Points

1. **EpisodicMemory** stores experiences with embeddings
2. **RecursiveGrowth** uses EvolutionDaemon patterns
3. Both integrate via NEBBus events (`memory.*`, `growth.*` topics)

## Recommendations

1. Create `systems/swarm/memory/` module for EpisodicMemory
2. Use simple JSON persistence initially (`.geometry/episodic_memory.json`)
3. Add memory access methods to GuildAgent via composition
4. Leverage NEBBus `subscribe_semantic()` for pattern recognition
