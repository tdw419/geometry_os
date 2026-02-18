- [x] **Phase 1: Core Infrastructure**
  - [x] Add CDN links to `index.html` `<!-- // turbo -->`
  - [x] Replace `world` container with `Viewport`
  - [x] Implement `updateHUD` to read from Viewport
  - [x] Verify Pan/Zoom functionality

- [x] **Phase 2: UI Standardization**
  - [x] Replace `createPanelButton` with `@pixi/ui` Button
  - [x] Implement `ScrollBox` for panel content
  - [x] Refactor `SystemMonitor` to use standard UI

- [x] **Phase 3: Visual Polish**
  - [x] Add `CRTFilter` to global stage
  - [x] Implement `GlowFilter` for selection states
  - [x] Add `GlitchFilter` utility function

- [x] **Phase 4: Particle Systems**
  - [x] Implement `BuildEmitter` for build swarm
  - [x] Implement `FileEmitter` for filesystem events
