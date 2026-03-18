# ASCII-First Refactor Tasks

## Phase 1: Core Separation (2 hours)

### Task 1.1: Extract Core Business Logic
- **Assignee**: core-architect
- **Dependencies**: None
- **Files**:
  - Create: `src/core/providers/registry.ts`, `src/core/providers/types.ts`
  - Create: `src/core/scanner/SourceScanner.ts`
  - Create: `src/core/scheduler/SchedulerEngine.ts`
  - Create: `src/core/config/ConfigManager.ts`
  - Create: `src/core/llm/LLMClient.ts`
  - Modify: `src/bun/index.ts` (remove business logic)
- **Steps**:
  1. Create directory structure
  2. Move provider files from `src/bun/ai/providers/`
  3. Move scanner from `src/bun/scanner/`
  4. Move scheduler from `src/bun/scheduler/`
  5. Move config from `src/bun/config/`
  6. Move LLM client from `src/bun/ai/`
  7. Update all imports
  8. Run `npx tsc --noEmit` to verify
- **Commit**: `refactor: extract core business logic from presentation layer`

### Task 1.2: Create Core Index
- **Assignee**: core-architect
- **Dependencies**: Task 1.1
- **Files**:
  - Create: `src/core/index.ts`
  - Create: `tests/core/index.test.ts`
- **Steps**:
  1. Write test for exports
  2. Create index.ts with unified exports
  3. Run tests
- **Commit**: `feat(core): add unified core module exports`

---

## Phase 2: ASCII State Machine (2 hours)

### Task 2.1: Create Central State Store
- **Assignee**: state-architect
- **Dependencies**: Task 1.2
- **Files**:
  - Create: `src/ascii/state/store.ts`
  - Create: `src/ascii/state/types.ts`
  - Create: `tests/ascii/state/store.test.ts`
- **Steps**:
  1. Write failing test for AsciiStateStore
  2. Define AsciiState and AsciiStateData types
  3. Implement store with transition(), subscribe(), getState()
  4. Run tests
- **Commit**: `feat(ascii): add central state store with subscription model`

### Task 2.2: Refactor StateManager to use Store
- **Assignee**: state-architect
- **Dependencies**: Task 2.1
- **Files**:
  - Modify: `src/bun/ascii-state-manager.ts`
  - Create: `tests/ascii/state/manager.test.ts`
- **Steps**:
  1. Write failing test for StateManager delegation
  2. Refactor StateManager to use AsciiStateStore
  3. Add subscribe sync for currentState
  4. Run tests
- **Commit**: `refactor(ascii): StateManager now delegates to AsciiStateStore`

---

## Phase 3: Template-Driven Rendering (1.5 hours)

### Task 3.1: Create ASCII Templates
- **Assignee**: template-engineer
- **Dependencies**: Task 2.2
- **Files**:
  - Create: `src/ascii/states/dashboard.ascii`
  - Create: `src/ascii/states/sources.ascii`
  - Create: `src/ascii/states/config.ascii`
  - Create: `src/ascii/states/history.ascii`
  - Create: `src/ascii/states/providers.ascii`
- **Steps**:
  1. Create dashboard template with {{variable}} syntax
  2. Create sources template with {{#each}} loops
  3. Create remaining state templates
  4. Ensure consistent layout (header, nav, content, footer)
- **Commit**: `feat(ascii): add ASCII templates for all states`

### Task 3.2: Refactor AsciiGenerator
- **Assignee**: template-engineer
- **Dependencies**: Task 3.1
- **Files**:
  - Modify: `src/bun/ascii-generator.ts`
  - Create: `tests/ascii/generator.test.ts`
- **Steps**:
  1. Write failing test for render(state, data) method
  2. Implement template loading and variable substitution
  3. Support {{#each}} and {{#if}} patterns
  4. Run tests
- **Commit**: `refactor(ascii): AsciiGenerator uses template-driven rendering`

---

## Phase 4: API Layer (1 hour)

### Task 4.1: Refactor HTTP API
- **Assignee**: api-engineer
- **Dependencies**: Task 3.2
- **Files**:
  - Modify: `src/bun/api.ts`
  - Create: `tests/api.test.ts`
- **Steps**:
  1. Write failing test for `/view` endpoint
  2. Write failing test for `/control` endpoint
  3. Inject AsciiStateStore and AsciiGenerator as dependencies
  4. Implement `/view` to render current state
  5. Implement `/control` to delegate to store.transition()
  6. Run tests
- **Commit**: `refactor(api): HTTP API reads from ASCII state store`

---

## Phase 5: GUI Integration (1 hour)

### Task 5.1: GUI Reads from ASCII Store
- **Assignee**: gui-integrator
- **Dependencies**: Task 4.1
- **Files**:
  - Modify: `src/mainview/index.ts`
  - Modify: `src/mainview/index.html`
- **Steps**:
  1. Add data-label attributes to GUI buttons
  2. Subscribe to AsciiStateStore in mainview
  3. Update tab highlighting based on state changes
  4. Test GUI mirrors ASCII state
- **Commit**: `feat(gui): GUI now mirrors ASCII state store`

---

## Phase 6: MCP Bridge (0.5 hours)

### Task 6.1: Update MCP Bridge
- **Assignee**: mcp-specialist
- **Dependencies**: Task 4.1
- **Files**:
  - Modify: `mcp_ascii_bridge/src/server.py`
- **Steps**:
  1. Verify ascii_view tool works with new `/view`
  2. Verify ascii_control tool works with new `/control`
  3. Verify ascii_navigate tool works
  4. Test with MCP client
- **Commit**: `feat(mcp): update MCP bridge for ASCII-first architecture`

---

## Phase 7: Documentation & Cleanup (1 hour)

### Task 7.1: Update Documentation
- **Assignee**: doc-writer
- **Dependencies**: Task 5.1, Task 6.1
- **Files**:
  - Update: `README.md`
  - Update: `docs/architecture.md`
- **Steps**:
  1. Document ASCII-First architecture in README
  2. Update architecture.md with new component diagram
  3. Add usage examples for `/view` and `/control`
- **Commit**: `docs: update documentation for ASCII-first architecture`

### Task 7.2: Remove Dead Code
- **Assignee**: cleanup-specialist
- **Dependencies**: Task 7.1
- **Files**: Various
- **Steps**:
  1. Run `npx ts-prune` to find unused exports
  2. Remove duplicate state management code
  3. Remove old GUI-only code paths
  4. Run all tests to verify nothing broken
- **Commit**: `chore: remove dead code after ASCII-first refactor`

---

## Summary

| Phase | Tasks | Est. Time |
|-------|-------|-----------|
| Phase 1: Core Separation | 2 | 2h |
| Phase 2: ASCII State Machine | 2 | 2h |
| Phase 3: Template-Driven Rendering | 2 | 1.5h |
| Phase 4: API Layer | 1 | 1h |
| Phase 5: GUI Integration | 1 | 1h |
| Phase 6: MCP Bridge | 1 | 0.5h |
| Phase 7: Documentation & Cleanup | 2 | 1h |
| **Total** | **11** | **~10h** |
