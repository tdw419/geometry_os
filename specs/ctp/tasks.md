---
spec: ctp
phase: tasks
total_tasks: 16
created: 2026-02-24T00:00:00Z
generated: auto
---

# Tasks: CTP (Cognitive Transmission Protocol)

## Phase 1: Make It Work (POC)

Focus: Implement core CTP components with TDD approach. Skip full integration, validate types and parsing work.

- [x] 1.1 Create CTP types and constants
  - **Do**: Create `systems/swarm/ctp/__init__.py` and `systems/swarm/ctp/types.py` with CTPVersion, TrustLevel, IntentType, ContextHash, CTPSignal classes
  - **Files**: `systems/swarm/ctp/__init__.py`, `systems/swarm/ctp/types.py`
  - **Done when**: CTPVersion.VERSION == "CTP/1.0", TrustLevel enum works, CTPSignal.to_ascii() and from_ascii() roundtrip
  - **Verify**: `pytest tests/swarm/ctp/test_types.py -v`
  - **Commit**: `feat(ctp): add CTP types, constants, and ASCII serialization`
  - _Requirements: FR-1_
  - _Design: Component types.py_

- [x] 1.2 Implement ASCII parser
  - **Do**: Create `systems/swarm/ctp/parser.py` with CTPParser class supporting parse() and parse_partial()
  - **Files**: `systems/swarm/ctp/parser.py`
  - **Done when**: Parser handles headers, payload, raises ParseError on malformed input, partial parse works on truncated messages
  - **Verify**: `pytest tests/swarm/ctp/test_parser.py -v`
  - **Commit**: `feat(ctp): add ASCII parser with partial parse resilience`
  - _Requirements: FR-2, NFR-4_
  - _Design: Component parser.py_

- [x] 1.3 Implement trust manager
  - **Do**: Create `systems/swarm/ctp/trust_manager.py` with AgentRegistry and TrustManager classes
  - **Files**: `systems/swarm/ctp/trust_manager.py`
  - **Done when**: Agent registration works, capability checking works, rate limiting enforces limits per trust level
  - **Verify**: `pytest tests/swarm/ctp/test_trust_manager.py -v`
  - **Commit**: `feat(ctp): add trust manager with rate limiting`
  - _Requirements: FR-3, US-4_
  - _Design: Component trust_manager.py_

- [x] 1.4 Implement CTP gateway core
  - **Do**: Create `systems/swarm/ctp/gateway.py` with CTPGateway and CTPSession classes
  - **Files**: `systems/swarm/ctp/gateway.py`
  - **Done when**: Gateway translates CTP to Telepathy, handles HELLO handshake, validates trust, builds WELCOME/REJECT responses
  - **Verify**: `pytest tests/swarm/ctp/test_gateway.py -v`
  - **Commit**: `feat(ctp): add gateway core with Telepathy translation`
  - _Requirements: FR-4, FR-8, US-6_
  - _Design: Component gateway.py_

- [x] 1.5 Implement minimal client
  - **Do**: Create `systems/swarm/ctp/client.py` with CTPClient class
  - **Files**: `systems/swarm/ctp/client.py`
  - **Done when**: Client builds HELLO/QUERY messages, parses WELCOME/REJECT, async connect/query work
  - **Verify**: `pytest tests/swarm/ctp/test_client.py -v`
  - **Commit**: `feat(ctp): add minimal client for device onboarding`
  - _Requirements: FR-5, NFR-2_
  - _Design: Component client.py_

- [ ] 1.6 POC Checkpoint
  - **Do**: Verify all core components work together - types, parser, trust, gateway, client
  - **Done when**: Can build CTP message, parse it, validate trust, translate to Telepathy
  - **Verify**: `pytest tests/swarm/ctp/test_types.py tests/swarm/ctp/test_parser.py tests/swarm/ctp/test_trust_manager.py tests/swarm/ctp/test_gateway.py tests/swarm/ctp/test_client.py -v`
  - **Commit**: `feat(ctp): complete POC core components`

## Phase 2: Simulation and Validation

After POC validated, add simulation runner for design validation.

- [ ] 2.1 Implement simulation runner
  - **Do**: Create `systems/swarm/ctp/simulation.py` with CTPSimulationRunner class implementing 4 validation phases
  - **Files**: `systems/swarm/ctp/simulation.py`
  - **Done when**: All 4 phases run (ARCHITECTURE_VALIDATE, PERFORMANCE_PREDICT, EDGE_CASE_EXPLORE, HILBERT_COHERENCE), generate_report() produces JSON report
  - **Verify**: `pytest tests/swarm/ctp/test_simulation.py -v`
  - **Commit**: `feat(ctp): add simulation runner for validation phases`
  - _Requirements: FR-6, NFR-6_
  - _Design: Component simulation.py_

- [ ] 2.2 Run simulation validation
  - **Do**: Execute CTPSimulationRunner.run_all() and verify all phases pass
  - **Done when**: overall_status == "PASS", overhead_percent < 20, coherence_score > 0.99
  - **Verify**: `python -c "from systems.swarm.ctp import CTPSimulationRunner; r = CTPSimulationRunner(); print(r.run_all())"`
  - **Commit**: `test(ctp): simulation validation passes`

## Phase 3: Testing

- [ ] 3.1 Add integration tests
  - **Do**: Create `tests/swarm/ctp/test_integration.py` with end-to-end flow tests
  - **Files**: `tests/swarm/ctp/test_integration.py`
  - **Done when**: Tests cover full handshake, query flow, rate limiting, trust enforcement, ASCII roundtrip
  - **Verify**: `pytest tests/swarm/ctp/test_integration.py -v`
  - **Commit**: `test(ctp): add integration tests for end-to-end flows`
  - _Requirements: FR-10, AC-1.1 through AC-6.4_

- [ ] 3.2 Run full test suite
  - **Do**: Execute all CTP tests
  - **Done when**: All 57+ tests pass
  - **Verify**: `pytest tests/swarm/ctp/ -v --tb=short`
  - **Commit**: None (validation only)

## Phase 4: Quality Gates

- [ ] 4.1 Update module exports
  - **Do**: Update `systems/swarm/ctp/__init__.py` to export all public components
  - **Files**: `systems/swarm/ctp/__init__.py`
  - **Done when**: All components importable from `systems.swarm.ctp`
  - **Verify**: `python -c "from systems.swarm.ctp import CTPGateway, CTPClient, CTPSimulationRunner; print('OK')"`
  - **Commit**: `feat(ctp): export all CTP components`
  - _Design: Module exports_

- [ ] 4.2 Final validation
  - **Do**: Run simulation and full test suite, create final commit
  - **Done when**: Simulation passes, all tests pass
  - **Verify**: `pytest tests/swarm/ctp/ -v` and simulation run_all()
  - **Commit**: `feat(ctp): complete CTP implementation with simulation validation`

## Notes

- **POC shortcuts taken**: TCP transport instead of QUIC, no signature verification, no binary payload optimization
- **Production TODOs**: Add QUIC transport, implement ed25519 signing, optimize PixelRTS fragment transport, add full consensus voting

## Task Summary

| Phase | Tasks | Estimated Time |
|-------|-------|----------------|
| Phase 1: POC | 6 tasks | 3-4 hours |
| Phase 2: Simulation | 2 tasks | 1 hour |
| Phase 3: Testing | 2 tasks | 1 hour |
| Phase 4: Quality | 2 tasks | 30 min |
| **Total** | **12 implementation tasks** | **5-6 hours** |

## Test Coverage Summary

| Test File | Tests | Focus |
|-----------|-------|-------|
| test_types.py | 10 | Types, constants, serialization |
| test_parser.py | 8 | ASCII parsing, partial parse |
| test_trust_manager.py | 9 | Trust levels, rate limiting |
| test_gateway.py | 8 | Handshake, translation |
| test_client.py | 8 | Client message building, connect |
| test_simulation.py | 8 | 4 validation phases |
| test_integration.py | 6 | E2E flows |
| **Total** | **57** | |
