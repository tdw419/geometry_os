---
spec: substrate-cloning
phase: tasks
created: 2026-02-19
---

# Tasks: substrate-cloning

## Overview

Convert extracted VM UI structures into native PixelRTS WGSL shaders.

**Plan**: `docs/plans/2026-02-19-substrate-cloning-implementation-v2.md`
**Team**: `apps/openspec/openspec/teams/substrate-cloning-team.yaml`

---

## Tasks

### Task 1: Create UI Transmuter Wrapper
- [x] Write failing test for UITransmuter wrapper
- [x] Create wrapper that imports from conductor/ui_transmuter.py
- [x] Verify tests pass (2 tests)
- **Assignee**: transmuter-engineer
- **Files**: `systems/evolution_daemon/ui_transmuter.py`, `tests/evolution_daemon/test_ui_transmuter.py`

### Task 2: Create SubstrateBrush for Binary Painting
- [ ] Write failing tests for SubstrateBrush and HilbertBrush
- [ ] Implement SubstrateBrush with paint_pixel/paint_rect
- [ ] Implement HilbertBrush with d2xy/xy2d
- [ ] Verify tests pass (5 tests)
- **Assignee**: substrate-engineer
- **Files**: `systems/evolution_daemon/substrate_brush.py`, `tests/evolution_daemon/test_substrate_brush.py`

### Task 3: Create CloneOrchestrator
- [ ] Write failing tests for CloneTask and CloneOrchestrator
- [ ] Implement CloneTask dataclass
- [ ] Implement CloneOrchestrator with request_clone
- [ ] Verify tests pass (4 tests)
- **Assignee**: clone-orchestrator
- **Files**: `systems/evolution_daemon/clone_orchestrator.py`, `tests/evolution_daemon/test_clone_orchestrator.py`

### Task 4: Add clone_tile RPC to LiveTileService
- [ ] Write failing test for clone RPC
- [ ] Add CloneOrchestrator integration to LiveTileService
- [ ] Add clone_tile handler to handle_rpc()
- [ ] Verify tests pass (1 test)
- **Assignee**: clone-orchestrator
- **Files**: `systems/evolution_daemon/live_tile_service.py`, `tests/evolution_daemon/test_live_tile_service_clone.py`

### Task 5: Add Frontend Clone Button
- [ ] Add clone button to AgentController render method
- [ ] Add click handler for clone_tile RPC
- [ ] Add CSS styling
- **Assignee**: frontend-integrator
- **Files**: `systems/visual_shell/web/js/AgentController.js`

### Task 6: E2E Integration Test
- [ ] Write E2E test for full clone pipeline
- [ ] Test empty UI edge case
- [ ] Verify tests pass (2 tests)
- **Assignee**: clone-orchestrator
- **Files**: `tests/evolution_daemon/test_substrate_cloning_e2e.py`

### Task 7: Update Documentation
- [ ] Create SUBSTRATE_CLONING_GUIDE.md
- [ ] Include Python API, RPC API, Glass Box UI instructions
- **Assignee**: clone-orchestrator
- **Files**: `docs/SUBSTRATE_CLONING_GUIDE.md`

---

## Summary

| Task | Component | Tests | Status |
|------|-----------|-------|--------|
| 1 | UITransmuter Wrapper | 2 | ✅ Done |
| 2 | SubstrateBrush | 5 | Pending |
| 3 | CloneOrchestrator | 4 | Pending |
| 4 | LiveTileService RPC | 1 | Pending |
| 5 | Frontend Clone Button | - | Pending |
| 6 | E2E Integration | 2 | Pending |
| 7 | Documentation | - | Pending |
| **Total** | | **14** | |
