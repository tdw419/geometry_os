# Compositor Integration Daemon

## Status
- **State**: PROPOSED
- **Priority**: HIGH
- **Complexity**: 7/10
- **Impact**: High - Enables automated Rust ↔ PixiJS bridge development

## Summary

Create an autonomous daemon that uses LM Studio to help build the integration layer between the Vectorland Rust compositor (`systems/infinite_map_rs`) and the PixiJS visual shell (`systems/visual_shell`). This daemon will automate the creation of:

1. **WebSocket bridge** for camera synchronization
2. **Manifest writer** in Rust for shared tile state
3. **Coordinate system unification** between both systems
4. **Real-time state synchronization** protocols

## Motivation

Currently, we have two powerful infinite map systems operating independently:

- **Vectorland Compositor** (Rust/Smithay/WGPU): Production Wayland compositor with native window management
- **PixiJS Visual Shell** (JavaScript/WebGL): Web-based overlay with dynamic visualizations

Merging these requires significant boilerplate code for:
- Inter-process communication (WebSocket/Unix sockets)
- Shared state management (manifest.json)
- Camera synchronization
- Coordinate system alignment

An LM Studio-powered daemon can accelerate this integration by:
- Generating Rust WebSocket server code
- Creating JavaScript client code
- Writing serialization/deserialization logic
- Implementing state synchronization protocols

## Technical Design

### Architecture

```
┌─────────────────────────────────────────────────────────┐
│     Compositor Integration Daemon (Python)              │
│  ┌──────────────────────────────────────────────────┐  │
│  │  LM Studio Bridge                                 │  │
│  │  - Code generation for Rust                       │  │
│  │  - Code generation for JavaScript                 │  │
│  │  - Protocol design                                │  │
│  └──────────────────────────────────────────────────┘  │
│                         ↓                              │
│  ┌──────────────────────────────────────────────────┐  │
│  │  Task Processor                                   │  │
│  │  - Reads OpenSpec tasks                          │  │
│  │  - Generates solutions                           │  │
│  │  - Validates code                                │  │
│  │  - Applies changes                               │  │
│  └──────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
                          ↓
        ┌─────────────────────────────────┐
        │  Generated Code                 │
        ├─────────────────────────────────┤
        │  Rust:                          │
        │  - websocket_bridge.rs          │
        │  - manifest_writer.rs           │
        │  - camera_sync.rs               │
        │                                 │
        │  JavaScript:                    │
        │  - compositor_client.js         │
        │  - camera_sync.js               │
        │  - state_manager.js             │
        └─────────────────────────────────┘
```

### Components

#### 1. Compositor Integration Daemon (`systems/daemons/compositor_integration_daemon.py`)

**Responsibilities:**
- Monitor OpenSpec tasks for compositor integration work
- Use LM Studio to generate Rust and JavaScript code
- Validate generated code (Rust: cargo check, JS: eslint)
- Apply code to appropriate files
- Mark tasks as complete in OpenSpec

**Key Methods:**
```python
class CompositorIntegrationDaemon:
    def scan_integration_tasks() -> List[Task]
    def generate_rust_websocket_server() -> str
    def generate_js_websocket_client() -> str
    def generate_manifest_writer() -> str
    def generate_camera_sync() -> str
    def validate_rust_code(code: str) -> bool
    def validate_js_code(code: str) -> bool
    def apply_solution(code: str, target_file: Path) -> bool
```

#### 2. WebSocket Bridge (Rust)

**File**: `systems/infinite_map_rs/src/websocket_bridge.rs`

**Purpose**: Serve WebSocket connections from PixiJS shell

**Features**:
- Camera state broadcasting
- Manifest update notifications
- Window state synchronization
- Input event forwarding

#### 3. Manifest Writer (Rust)

**File**: `systems/infinite_map_rs/src/manifest_writer.rs`

**Purpose**: Write tile updates to shared manifest.json

**Features**:
- Atomic file writes
- JSON serialization
- Timestamp tracking
- Tile coordinate mapping

#### 4. Compositor Client (JavaScript)

**File**: `systems/visual_shell/web/compositor_client.js`

**Purpose**: Connect PixiJS shell to Rust compositor

**Features**:
- WebSocket connection management
- Camera state synchronization
- Manifest polling/subscription
- Reconnection logic

### Integration Points

1. **Shared Coordinate System**
   - Both systems use `gridSize: 100`
   - World coordinates map 1:1
   - Camera position synced via WebSocket

2. **Shared Manifest**
   - Location: `systems/builder/map/manifest.json`
   - Format: `{ "x,y": { "brick": "name.png", "timestamp": 123456 } }`
   - Rust writes, PixiJS reads

3. **WebSocket Protocol**
   - Port: 8765 (configurable)
   - Messages: JSON-encoded
   - Types: `CameraUpdate`, `ManifestUpdate`, `WindowUpdate`

## Implementation Plan

See [tasks.md](./tasks.md) for detailed task breakdown.

### Phase 1: Daemon Foundation
- Create daemon skeleton
- Integrate LM Studio bridge
- Implement OpenSpec task scanning

### Phase 2: Rust Code Generation
- Generate WebSocket server
- Generate manifest writer
- Generate camera sync module

### Phase 3: JavaScript Code Generation
- Generate WebSocket client
- Generate camera sync
- Generate state manager

### Phase 4: Validation & Testing
- Implement Rust validation (cargo check)
- Implement JS validation (eslint)
- Create integration tests

### Phase 5: Deployment
- Add to daemon_orchestrator.py
- Add to manage_daemons.sh
- Create systemd service

## Success Criteria

- [ ] Daemon successfully generates Rust WebSocket server code
- [ ] Daemon successfully generates JavaScript WebSocket client code
- [ ] Generated Rust code compiles without errors
- [ ] Generated JavaScript code passes linting
- [ ] Camera synchronization works in real-time
- [ ] Manifest updates propagate from Rust to PixiJS
- [ ] Integration tests pass
- [ ] Daemon runs autonomously via manage_daemons.sh

## Dependencies

- **LM Studio**: Running locally at http://localhost:1234
- **Rust toolchain**: cargo, rustc
- **Node.js**: For JavaScript validation (optional)
- **OpenSpec**: For task management

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| LM Studio generates invalid code | High | Implement validation before applying |
| WebSocket protocol mismatch | Medium | Use strict JSON schema validation |
| Performance overhead | Low | Use efficient serialization, limit update frequency |
| Daemon crashes | Medium | Implement proper error handling, restart logic |

## Future Enhancements

- Support for multiple compositor backends (DRM, Winit)
- Hot-reload of generated code
- Visual debugging UI for WebSocket traffic
- Automatic protocol version negotiation
- Support for other LLM backends (Ollama, OpenAI)

## References

- [Vectorland Compositor README](../../systems/infinite_map_rs/README.md)
- [PixiJS Infinite Map](../../systems/visual_shell/web/infinite_map.js)
- [LM Studio Bridge](../../systems/neural_substrate/lm_studio_bridge.py)
- [Existing Compositor Daemon](../../systems/vectorland/lm_studio_compositor_daemon.py)
