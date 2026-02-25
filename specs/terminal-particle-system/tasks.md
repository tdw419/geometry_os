---
spec: terminal-particle-system
phase: tasks
total_tasks: 9
created: 2026-02-25T00:00:00Z
generated: auto
---

# Tasks: terminal-particle-system

## Phase 1: Make It Work (POC)

Focus: Validate particle system works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Create TerminalWindowParticle.js
  - **Do**: Create class extending PIXI.Container. Wrap TerminalWindow with spatial props (x, y, scale, zIndex). Add serialize() method returning `{id, x, y, scale, zIndex}`. Add static `deserialize(data)` factory.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/TerminalWindowParticle.js`
  - **Done when**: Class instantiates with TerminalWindow, serializes correctly
  - **Verify**: `node -e "const T=require('./TerminalWindowParticle.js'); console.log(new T({x:100,y:100}).serialize())"`
  - **Commit**: `feat(visual-shell): add TerminalWindowParticle class`
  - _Requirements: FR-1_
  - _Design: TerminalWindowParticle component_

- [x] 1.2 Create ParticleManager.js
  - **Do**: Create manager class with particles Map. Implement createParticle(options), destroyParticle(id), focusParticle(id), cycleFocus(). Track focusedParticleId. Add bringToFront logic.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/ParticleManager.js`
  - **Done when**: Manager creates/destroys particles, cycles focus
  - **Verify**: Console log in browser after creating 3 particles
  - **Commit**: `feat(visual-shell): add ParticleManager for lifecycle`
  - _Requirements: FR-2_
  - _Design: ParticleManager component_

- [x] 1.3 Integrate ParticleManager in application.js
  - **Do**: In GeometryOSApplication constructor, add `this.particleManager = null`. In initialize(), create ParticleManager with worldContainer. Replace existing terminalWindows array logic with particleManager calls.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/application.js`
  - **Done when**: createTerminalWindow() uses ParticleManager
  - **Verify**: Open app, create terminal via existing button/menu
  - **Commit**: `feat(visual-shell): integrate ParticleManager in main app`
  - _Requirements: FR-2_
  - _Design: Data Flow_

- [x] 1.4 Add keyboard shortcuts
  - **Do**: In application.js, add keydown listener. Ctrl+Shift+N calls createTerminalWindow(). Ctrl+Shift+W calls particleManager.destroyFocused(). Ctrl+Tab calls particleManager.cycleFocus().
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/application.js`
  - **Done when**: Shortcuts create/close/cycle terminals
  - **Verify**: Press Ctrl+Shift+N in browser, see new terminal
  - **Commit**: `feat(visual-shell): add terminal keyboard shortcuts`
  - _Requirements: FR-3_
  - _Design: Data Flow step 1_

- [ ] 1.5 Update index.html to load new scripts
  - **Do**: Add script tags for TerminalWindowParticle.js and ParticleManager.js before application.js.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/index.html`
  - **Done when**: Scripts load without 404 errors
  - **Verify**: Check browser console for errors
  - **Commit**: `feat(visual-shell): load particle scripts in index.html`
  - _Requirements: FR-1, FR-2_

- [ ] 1.6 POC Checkpoint
  - **Do**: Verify full flow: Ctrl+Shift+N creates terminal, drag works, Ctrl+Tab cycles, Ctrl+Shift+W closes.
  - **Done when**: Multi-terminal workflow works manually
  - **Verify**: Manual test all shortcuts and drag
  - **Commit**: `feat(visual-shell): complete terminal particle POC`

## Phase 2: Refactoring

After POC validated, clean up code.

- [x] 2.1 Add NEB WebSocket integration
  - **Do**: In ParticleManager constructor, accept nebSocket option. On particle events, publish to NEB via socket.send(JSON.stringify({topic, payload})). Topics: terminal.particle.created/moved/focused/destroyed.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/ParticleManager.js`
  - **Done when**: Events published on particle actions
  - **Verify**: WebSocket monitor shows events on actions
  - **Commit**: `feat(visual-shell): add NEB event publishing`
  - _Requirements: FR-4_
  - _Design: NEB Integration_

- [x] 2.2 Add localStorage persistence
  - **Do**: In ParticleManager, add saveLayout() with 500ms debounce. Save to localStorage key 'terminal-particle-layout'. Add restoreLayout() called on init. Handle invalid data gracefully.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/ParticleManager.js`
  - **Done when**: Layout persists across page reload
  - **Verify**: Create terminals, reload, terminals restored
  - **Commit**: `feat(visual-shell): add layout persistence`
  - _Requirements: FR-5_
  - _Design: Technical Decisions - Persistence_

## Phase 3: Testing

- [ ] 3.1 Write integration tests
  - **Do**: Create test file with pytest. Test: particle serialization roundtrip, NEB event publishing, focus cycling, layout persistence mock. Follow pattern in test_terminal_neb_integration.py.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/api/tests/test_terminal_particle_integration.py`
  - **Done when**: Tests pass, cover main flows
  - **Verify**: `pytest systems/visual_shell/api/tests/test_terminal_particle_integration.py -v`
  - **Commit**: `test(visual-shell): add particle integration tests`
  - _Requirements: AC-1.1 through AC-5.3_

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run lint, type checks, tests. Fix any issues.
  - **Verify**: All commands pass
  - **Done when**: No errors
  - **Commit**: `fix(visual-shell): address lint issues` (if needed)

- [ ] 4.2 Add documentation
  - **Do**: Create docs/TERMINAL_PARTICLE_SYSTEM.md with architecture, keyboard shortcuts, NEB events, localStorage format.
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/docs/TERMINAL_PARTICLE_SYSTEM.md`
  - **Done when**: Document covers all features
  - **Verify**: Read through for completeness
  - **Commit**: `docs(visual-shell): add Terminal Particle System docs`

- [ ] 4.3 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: No NEB integration, no persistence, basic styling
- **Production TODOs**: Add scale clamping, improve error handling, add visual focus indicator animation
