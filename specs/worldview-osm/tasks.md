---
spec: worldview-osm
phase: tasks
total_tasks: 6
created: 2026-02-25T19:35:00Z
generated: auto
---

# Tasks: worldview-osm

## Phase 1: Make It Work (POC)

Focus: Create functional OSM WorldView with all core features. Skip tests, use mock data.

- [ ] 1.1 Create base OSM WorldView HTML
  - **Do**: Create `systems/visual_shell/web/demo_worldview_osm.html` with Leaflet CDN, CSS for green phosphor filter, scanlines, vignette, and HUD overlay
  - **Files**: `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: HTML opens in browser showing dark screen with HUD, scanlines, vignette visible
  - **Verify**: Open file in browser, confirm green HUD with "TECTONIC WORLDVIEW [OSM]" title
  - **Commit**: `feat(worldview): create base OSM WorldView HTML with Geometry OS aesthetic`
  - _Requirements: FR-2, FR-3_
  - _Design: Component A_

- [ ] 1.2 Initialize Leaflet map with OSM tiles
  - **Do**: Add Leaflet map initialization centered on Texas (30.2747, -97.7403), add OSM tile layer, implement coordinate tracking
  - **Files**: `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: Map displays OSM tiles with green filter applied, coordinates update on mouse move
  - **Verify**: Refresh page, confirm tiles load with green tint, mouse movement updates coords in HUD
  - **Commit**: `feat(worldview): add Leaflet map with OSM tiles and coordinate tracking`
  - _Requirements: FR-1, FR-4_
  - _Design: Component A_

- [ ] 1.3 Create Tectonic Node marker system
  - **Do**: Add `window.addTectonicNode()` and `window.updateTectonicNode()` functions, create Leaflet divIcon markers with pulse animation, implement HUD update logic
  - **Files**: `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: Marker functions available globally, pulse animation runs based on load value
  - **Verify**: Console shows no errors, `window.addTectonicNode` defined in browser console
  - **Commit**: `feat(worldview): add Tectonic Node marker system with pulse animation`
  - _Requirements: FR-5, FR-6, FR-7_
  - _Design: Component B_

- [ ] 1.4 Connect WorldViewOrchestrator
  - **Do**: Import WorldViewOrchestrator, create mock GPU system, register three kernels (ALPINE-X86-SF, UBUNTU-ARM-LDN, GOS-CORE-TYO), start 10Hz sync loop
  - **Files**: `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: Three markers appear on map at San Francisco, London, Tokyo coordinates with pulsing
  - **Verify**: Refresh page, confirm three green markers visible on map, HUD shows "ACTIVE KERNELS: 3"
  - **Commit**: `feat(worldview): connect WorldViewOrchestrator with mock GPU system`
  - _Requirements: FR-10_
  - _Design: Component B, Component D_

- [ ] 1.5 Add Memory Tapestry overlay
  - **Do**: Add tapestry HTML container, CSS styling, canvas rendering logic, implement `window.showMemoryTapestry()` to render memory buffer as pixels
  - **Files**: `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: Clicking a marker opens full-screen tapestry overlay with colorful memory visualization
  - **Verify**: Click marker, confirm overlay appears with "MEMORY TAPESTRY: [name]" title, close button works
  - **Commit**: `feat(worldview): add Memory Tapestry overlay for zoom-to-memory`
  - _Requirements: FR-8, FR-9_
  - _Design: Component C_

- [ ] 1.6 Add offline tile cache support
  - **Do**: Create Python tile cache script, add local/online tile fallback logic in HTML, test tile download
  - **Files**: `systems/visual_shell/web/osm_tile_cache.py`, `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: Script downloads tiles, map checks for local tiles first
  - **Verify**: Run `python3 systems/visual_shell/web/osm_tile_cache.py`, confirm tiles in `tiles/` directory, refresh page shows "Using local tile cache" in console
  - **Commit**: `feat(worldview): add offline tile cache support for sovereign operation`
  - _Requirements: FR-11, FR-12_
  - _Design: Component E_

## Phase 2: Refactoring

After POC validated, clean up code.

- [ ] 2.1 Extract marker styles to CSS
  - **Do**: Move inline marker styles to `<style>` block, add CSS variables for colors
  - **Files**: `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: All marker styling in CSS, no inline styles in JS
  - **Verify**: Type check passes, visual appearance unchanged
  - **Commit**: `refactor(worldview): extract marker styles to CSS`
  - _Design: Component B_

- [ ] 2.2 Add error handling
  - **Do**: Add try/catch for tile load failures, graceful degradation for missing tiles
  - **Files**: `systems/visual_shell/web/demo_worldview_osm.html`
  - **Done when**: Offline mode shows gray background, console logs appropriate warnings
  - **Verify**: Disconnect network, refresh page, confirm graceful degradation
  - **Commit**: `refactor(worldview): add error handling for offline scenarios`
  - _Design: Error Handling_

## Phase 3: Testing

- [ ] 3.1 Manual browser testing
  - **Do**: Test in Chrome, Firefox, Safari
  - **Files**: N/A
  - **Done when**: All features work in all browsers
  - **Verify**: Complete verification checklist from plan
  - **Commit**: No commit needed

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all quality checks locally
  - **Verify**: HTML valid, no console errors, features work
  - **Done when**: All verification checklist items pass
  - **Commit**: `fix(worldview): address lint/type issues` (if needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: Mock GPU system instead of real, linear memory scan instead of Hilbert curve
- **Production TODOs**: Connect to real GPUExecutionSystem, add Hilbert-curve memory viz, add satellite layer
