---
spec: ctp
phase: requirements
created: 2026-02-24T00:00:00Z
generated: auto
---

# Requirements: CTP (Cognitive Transmission Protocol)

## Summary

Build an ASCII-first network protocol for AI-to-AI communication that enables external devices to join the Geometry OS agent mesh through semantic routing and context-hash synchronization.

## User Stories

### US-1: Device Onboarding

As an external device (phone/IoT), I want to connect to the Geometry OS mesh so that I can participate in the agent ecosystem.

**Acceptance Criteria**:
- AC-1.1: Device can send HELLO message with capabilities
- AC-1.2: Gateway responds with WELCOME containing session ID
- AC-1.3: Session established within 3 round trips
- AC-1.4: Connection uses only stdlib (no external deps)

### US-2: Semantic Query

As a connected device, I want to query the mesh by intent so that I receive relevant responses based on meaning, not just address.

**Acceptance Criteria**:
- AC-2.1: Query message includes Intent header
- AC-2.2: Gateway routes query to agents matching intent
- AC-2.3: Response includes payload from matching agents
- AC-2.4: Query is grep-able from network traces

### US-3: Context Synchronization

As a device with stale context, I want to sync via delta so that I efficiently converge with the mesh state.

**Acceptance Criteria**:
- AC-3.1: HELLO includes current Context-Hash
- AC-3.2: WELCOME indicates delta availability
- AC-3.3: DELTA-REQUEST specifies from/to hash range
- AC-3.4: DELTA-STREAM delivers only missing fragments

### US-4: Trust Enforcement

As a mesh administrator, I want untrusted devices rate-limited so that the mesh remains protected from abuse.

**Acceptance Criteria**:
- AC-4.1: UNTRUSTED devices limited to 10 req/min
- AC-4.2: EXTERNAL devices limited to 100 req/min
- AC-4.3: INTERNAL devices have unlimited access
- AC-4.4: Rate-limited requests receive REJECT response

### US-5: Zero-Cost Perception

As an AI agent, I want to read network traffic without specialized parsers so that I can understand protocol state at zero cognitive cost.

**Acceptance Criteria**:
- AC-5.1: All headers are ASCII text
- AC-5.2: Headers parseable with stdlib only
- AC-5.3: Intent extractable via grep/awk/sed
- AC-5.4: Partial messages parse without crash

### US-6: Mesh Integration

As a Geometry OS node, I want CTP signals translated to Telepathy so that external devices integrate seamlessly with internal mesh.

**Acceptance Criteria**:
- AC-6.1: CTP Intent maps to TelepathySignal.signal_type
- AC-6.2: CTP Headers map to TelepathySignal.payload
- AC-6.3: Gateway injects signals into TelepathyNode
- AC-6.4: Translation preserves context hash

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | CTP types module with version, trust levels, intents | Must | US-1 |
| FR-2 | ASCII parser with partial parse resilience | Must | US-5 |
| FR-3 | Trust manager with rate limiting | Must | US-4 |
| FR-4 | Gateway translating CTP to Telepathy | Must | US-6 |
| FR-5 | Minimal stdlib-only client | Must | US-1 |
| FR-6 | Simulation runner for validation phases | Should | US-5 |
| FR-7 | Context hash computation (SHA-256 truncated) | Should | US-3 |
| FR-8 | Cognitive handshake (HELLO/WELCOME/READY) | Must | US-1 |
| FR-9 | Intent-based semantic routing | Should | US-2 |
| FR-10 | Integration tests for end-to-end flows | Must | All |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | ASCII parsing overhead <20% vs JSON | Performance |
| NFR-2 | Client code <500 lines | Maintainability |
| NFR-3 | All messages human-readable | Usability |
| NFR-4 | No regex required for basic parsing | Simplicity |
| NFR-5 | P99 latency <50ms for 1KB messages | Performance |
| NFR-6 | Simulation phases must pass before production | Quality |

## Out of Scope

- QUIC transport (TCP for initial implementation)
- Binary payload optimization
- Signature verification (future: ed25519)
- PixelRTS fragment transport (Phase 2)
- Full consensus voting for external agents

## Dependencies

| Dependency | Type | Notes |
|------------|------|-------|
| TelepathyProtocol | Internal | Bridge target for gateway |
| Python 3.8+ | Runtime | Stdlib-only constraint |
| asyncio | Stdlib | Async networking |
| pytest | Dev | Test framework |

## Success Metrics

| Metric | Target | Validation |
|--------|--------|------------|
| Test coverage | 57+ tests | pytest |
| Simulation pass | 4/4 phases | CTPSimulationRunner |
| Parse overhead | <20% | PERFORMANCE_PREDICT phase |
| Coherence score | >99% | HILBERT_COHERENCE phase |
