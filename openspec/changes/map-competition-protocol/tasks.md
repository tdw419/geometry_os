# Tasks: Map Competition Protocol

**Status:** TODO  
**Created:** 2026-02-06  

---

## Phase 1: Protocol Foundation (Week 1)

- [ ] **TASK-MCP-001**: Define JSON message schemas for contender registration
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/schemas/`

- [ ] **TASK-MCP-002**: Define territory claim/report message formats
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/schemas/`

- [ ] **TASK-MCP-003**: Create Arbiter daemon skeleton with WebSocket server
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/arbiter_daemon.py`

- [ ] **TASK-MCP-004**: Implement contender registry (in-memory)
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/contender_registry.py`

---

## Phase 2: Arbiter Implementation (Week 2)

- [ ] **TASK-MCP-005**: Implement territory score calculation algorithm
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/territory_calculator.py`

- [ ] **TASK-MCP-006**: Implement competition cycle state machine
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/competition_state.py`

- [ ] **TASK-MCP-007**: Create territory visualization overlay (WGSL shader)
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `systems/arbiter/shaders/territory_overlay.wgsl`

- [ ] **TASK-MCP-008**: Add Arbiter API endpoints (FastAPI)
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/api.py`

---

## Phase 3: Contender Adapters (Weeks 3-4)

- [ ] **TASK-MCP-009**: Create WGPU contender adapter (Rust)
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/infinite_map_rs/src/contender_adapter.rs`
  - Notes: Adapt existing compositor to competition API

- [ ] **TASK-MCP-010**: Create PixiJS v8 contender wrapper (JS)
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/contenders/pixijs_contender/`
  - Notes: Use existing Visual Shell as base

- [ ] **TASK-MCP-011**: Create tldraw contender wrapper (React)
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `systems/contenders/tldraw_contender/`
  - Notes: Embed tldraw in overlay iframe

- [ ] **TASK-MCP-012**: Create simple Canvas2D contender (baseline)
  - Priority: LOW
  - Owner: TBD
  - Files: `systems/contenders/canvas2d_baseline/`
  - Notes: Minimal viable contender for testing

---

## Phase 4: Evolution Integration (Week 5)

- [ ] **TASK-MCP-013**: Create Evolution Bridge for Arbiter
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/evolution_bridge.py`

- [ ] **TASK-MCP-014**: Implement contender analysis (extract winning patterns)
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `systems/evolution/contender_analyzer.py`

- [ ] **TASK-MCP-015**: Implement contender mutation (generate challengers)
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `systems/evolution/contender_mutator.py`

- [ ] **TASK-MCP-016**: Auto-spawn evolved contenders after coronation
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `systems/arbiter/evolution_bridge.py`

---

## Phase 5: Coronation Ceremony (Week 6)

- [ ] **TASK-MCP-017**: Implement substrate transition animation
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/coronation_handler.py`
  - Notes: Fade, expand, border glow, shrink sequence

- [ ] **TASK-MCP-018**: Implement role promotion/demotion system
  - Priority: HIGH
  - Owner: TBD
  - Files: `systems/arbiter/contender_registry.py`

- [ ] **TASK-MCP-019**: Add coronation event logging and history
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `systems/arbiter/coronation_log.py`

- [ ] **TASK-MCP-020**: Create coronation celebration animation (particle burst)
  - Priority: LOW
  - Owner: TBD
  - Files: `systems/arbiter/shaders/coronation_particles.wgsl`

---

## Phase 6: Testing & Polish

- [ ] **TASK-MCP-021**: Write unit tests for territory calculator
  - Priority: HIGH
  - Owner: TBD
  - Files: `tests/test_territory_calculator.py`

- [ ] **TASK-MCP-022**: Write integration tests for full competition cycle
  - Priority: HIGH
  - Owner: TBD
  - Files: `tests/test_competition_cycle.py`

- [ ] **TASK-MCP-023**: Performance benchmarks for multi-contender rendering
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `benchmarks/contender_perf.py`

- [ ] **TASK-MCP-024**: Documentation and architecture diagrams
  - Priority: MEDIUM
  - Owner: TBD
  - Files: `docs/map_competition_protocol.md`

---

## Stretch Goals

- [ ] **TASK-MCP-S01**: Implement geographic contender (Leaflet/OpenLayers)
  - Priority: LOW
  - Owner: TBD
  - Notes: Earth as one possible map layer

- [ ] **TASK-MCP-S02**: Implement 3D contender (Three.js)
  - Priority: LOW
  - Owner: TBD
  - Notes: 3D terrain as competition layer

- [ ] **TASK-MCP-S03**: Multi-user competitive mode
  - Priority: LOW
  - Owner: TBD
  - Notes: Users can champion their favorite contender

- [ ] **TASK-MCP-S04**: Historical replay of coronation events
  - Priority: LOW
  - Owner: TBD
  - Notes: Time-travel through map evolution

---

## Dependencies

| Task | Depends On |
|------|------------|
| TASK-MCP-005 | TASK-MCP-001, TASK-MCP-002 |
| TASK-MCP-009 | TASK-MCP-003, TASK-MCP-004 |
| TASK-MCP-013 | Neural Evolution Daemon (existing) |
| TASK-MCP-017 | TASK-MCP-005, TASK-MCP-006 |
