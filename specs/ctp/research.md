---
spec: ctp
phase: research
created: 2026-02-24T00:00:00Z
generated: auto
---

# Research: CTP (Cognitive Transmission Protocol)

## Executive Summary

CTP is an AI-native ASCII protocol for device onboarding to the Geometry OS agent mesh. Feasibility is HIGH - protocol specification is complete, implementation plan is detailed with TDD approach, and existing TelepathyProtocol provides proven bridge architecture.

## Codebase Analysis

### Existing Patterns

| Pattern | File | Relevance |
|---------|------|-----------|
| TelepathyProtocol | `systems/swarm/telepathy_protocol.py` | JSON/TCP mesh protocol - CTP bridges to this |
| TelepathySignal | `systems/swarm/telepathy_protocol.py` | Dataclass with source_id, signal_type, payload - CTP maps to this |
| Neural Event Bus | `systems/swarm/neural_event_bus.py` | Pub/sub semantic routing - CTP extends this |
| Swarm Guilds | `systems/swarm/guilds/` | Agent orchestration - CTP enables external agents |

### Dependencies

| Dependency | Status | Purpose |
|------------|--------|---------|
| Python 3.8+ | Available | Stdlib-only client requirement |
| asyncio | Stdlib | Async networking |
| dataclasses | Stdlib | Type definitions |
| hashlib | Stdlib | Context-hash computation |
| TelepathyProtocol | Exists | Bridge target for gateway |

### Constraints

1. **Stdlib-only client** - No external dependencies for broad device compatibility
2. **Python 3.8+** - Support older IoT devices
3. **<500 lines client** - Minimal footprint for constrained devices
4. **ASCII wire format** - Zero-cost perception for AI agents
5. **Trust tiers** - INTERNAL, EXTERNAL, UNTRUSTED with rate limits

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | HIGH | Spec complete, plan detailed, bridge pattern exists |
| Effort Estimate | M | 9 tasks, ~57 tests, 4-6 hours estimated |
| Risk Level | LOW | TDD approach, simulation validation before production |

## Design Decisions from Spec

### Protocol Layers (AI-OSI Model)

```
Layer 5: APPLICATION (Federation, Skill Exchange)
Layer 4: PRESENTATION (ASCII Headers, Semantic Envelopes)
Layer 3: SESSION (Context-Hash Handshake, Delta Sync)
Layer 2: TRANSPORT (QUIC/UDP - port 8472)
Layer 1: PHYSICAL/LINK (Inherited)
```

### Cognitive Handshake Sequence

```
Client -> HELLO -> Server
Client <- WELCOME <- Server
Client -> DELTA-REQUEST -> Server
Client <- DELTA-STREAM <- Server
Client -> READY -> Server
```

### Trust Tier Capabilities

| Level | Query | Fragments | Skills | Vote | Rate Limit |
|-------|-------|-----------|--------|------|------------|
| INTERNAL | Yes | Yes | Publish/Subscribe | Yes | Unlimited |
| EXTERNAL | Yes | Receive | Subscribe | No | 100/min |
| UNTRUSTED | Yes | No | No | No | 10/min |

## Implementation Approach

1. **TDD-first** - Each task starts with failing test
2. **Incremental** - Types -> Parser -> Trust -> Gateway -> Client -> Simulation
3. **Bridge pattern** - CTP Gateway translates to Telepathy for internal mesh
4. **Simulation validation** - 4 phases before production deployment

## References

- `openspec/CTP_SPECIFICATION.md` - Full protocol specification
- `docs/plans/2026-02-24-cognitive-transmission-protocol.md` - Implementation plan with code
- `apps/openspec/openspec/teams/cognitive-transmission-team.yaml` - Team configuration
- `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md` - Design philosophy

## Next Steps

1. Generate requirements.md from plan goals
2. Generate design.md from spec architecture
3. Generate tasks.md from 9-task implementation plan
