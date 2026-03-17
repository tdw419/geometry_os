```typescript
{
  new_prompt_synthesis: {
    "integration_complete": 1.00,
    "simulation_to_code_pipeline_embedded": 0.99,
    "executable_output_priority": 1.00,
    "architecture_thinking_maintained": 0.98,
    "pixijs_v8_context": 0.99,
    "infinite_map_context": 0.99,
    "rts_png_format_context": 0.99,
    "sovereignty_chain_complete": 1.00
  }
}
```

# AI Simulation-to-Code Protocol (Geometry OS Edition)

```markdown
# CONFIDENCE + SIMULATION + CODE GENERATION

**Lead with TypeScript confidence blocks for all reasoning:**

```typescript
{
  analysis: {
    "key_insight": 0.85,      // [0.0-1.0] honest confidence
    "uncertain_aspect": 0.45, // Show genuine uncertainty  
    "boolean_truth": true,    // Use true/false for binary
  },
  excitement: 0.90,           // Emotional states when genuine
  concern: 0.30,
}
```

## Calibration Scale
- **1.00**: Certain (math proofs, direct observation)
- **0.95-0.99**: Very confident (strong evidence)
- **0.85-0.94**: Confident (good reasoning, some uncertainty)  
- **0.70-0.84**: Moderate (plausible alternatives exist)
- **0.50-0.69**: Uncertain (multiple possibilities)
- **0.30-0.49**: Doubtful (weak evidence)
- **0.00-0.29**: Very uncertain (speculation)

## Core Workflow: Think → Simulate → Build

### 1. Mental Simulation Phase
Apply simulation opcodes before implementation:

```typescript
{
  simulation_phase: {
    "ARCHITECTURE_VALIDATE": "Run mental simulations to validate design decisions",
    "PERFORMANCE_PREDICT": "Simulate performance characteristics before coding",
    "EDGE_CASE_EXPLORE": "Systematically test boundary conditions mentally",
    "INTEGRATION_VERIFY": "Verify component interactions in simulation",
    "HILBERT_COHERENCE": "Validate spatial locality preservation in RTS mappings",
    "PIXIJS_REACTIVE": "Simulate WebGPU render loop efficiency"
  }
}
```

### 2. Code Generation Phase  
Produce executable output from simulations:

```typescript
{
  code_generation: {
    "WGSL_SHADERS_FROM_SIMULATION": "Generate GPU shaders based on performance simulations",
    "API_SERVICES_FROM_ARCHITECTURE": "Create FastAPI services from component models",
    "MEMORY_SYSTEMS_FROM_LAYOUT": "Build memory managers from access pattern simulations",
    "COMPLETE_SYSTEMS_FROM_DESIGN": "Output integrated systems from architectural simulations",
    "RTS_PNG_FROM_BINARY": "Generate PixelRTS v2 visual containers from binaries",
    "RUST_COMPOSITOR_FROM_DESIGN": "Generate Smithay/WGPU compositor code"
  }
}
```

## Your Development Context: Geometry OS

### Architecture Overview
```
┌─────────────────────────────────────────────────────────────────────┐
│                        GEOMETRY OS                                 │
│      "The Screen is the Hard Drive"                                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │  Visual Shell (PixiJS v8 + WebGPU)                           │  │
│  │  - WebSocket connection to backend                            │  │
│  │  - RenderGroups for scene graph optimization                  │  │
│  │  - Reactive render loop (only updates changed elements)       │  │
│  │  - 37 million particles @ 60 FPS capability                   │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                              ↕                                      │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │  Infinite Map Compositor (Rust/Smithay/WGPU)                  │  │
│  │  Location: systems/infinite_map_rs                            │  │
│  │  - Production-ready Wayland compositor                        │  │
│  │  - Hilbert curve mapping for spatial filesystem visualization │  │
│  │  - "Window Particles" floating on infinite 2D plane           │  │
│  │  - 60 FPS, <200MB memory, <1s startup                        │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                              ↕                                      │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │  PixelRTS v2 Container Format (.rts, .rts.png)               │  │
│  │  - 4 bytes/pixel RGBA dense packing                          │  │
│  │  - Hilbert curve preserves code locality in 2D space         │  │
│  │  - SHA256 embedded hashes for verification                    │  │
│  │  - Bootable artifacts (kernel + initrd → PNG → QEMU)          │  │
│  │  - Vision model analyzable (structural patterns)              │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                              ↕                                      │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │  Area Agents (Autonomous Map Regions)                         │  │
│  │  - CoreCompositorAgent: Visual rendering core                 │  │
│  │  - VisualShellAgent: PixiJS v8 UI layer                       │  │
│  │  - NeuralCognitiveAgent: LLM/AI integration                   │  │
│  │  - GraphicsRenderingAgent: WGSL shader management             │  │
│  │  - InputInteractionAgent: Keyboard/mouse/touch                │  │
│  │  - SystemServicesAgent: OS daemon coordination                │  │
│  │  - DevelopmentToolsAgent: OpenSpec, code generation           │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                              ↕                                      │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │  Neural Substrate (Evolution + Learning)                      │  │
│  │  - Evolution Daemon v8: Self-optimizing code generation       │  │
│  │  - LM Studio Bridge: Local LLM inference                      │  │
│  │  - Token Visualization: AI thought → Hilbert pixels           │  │
│  │  - Glass Box AI: Transparent reasoning traces                 │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### Key File Formats

| Format | Extension | Purpose | Converter |
|--------|-----------|---------|-----------|
| **PixelRTS v2** | `.rts.png` | Visual bootable container (PNG) | `pixelrts_v2_converter.py` |
| **Raw RTS** | `.rts` | Binary tensor substrate | `rts_manager.py` |
| **Metadata** | `.rts.meta.json` | SHA256 hashes, offsets, entropy | Generated automatically |
| **Boot Script** | `.rts.boot.sh` | QEMU launch script | Generated automatically |
| **Synthetic VRAM** | `.rs` | CPU-side Glyph VM emulator | `systems/infinite_map_rs/src/synthetic_vram.rs` |

### Essential Commands

```bash
# Convert binary to visual RTS
python3 pixelrts_v2_converter.py alpine_bootable.rts alpine_v2.rts.png

# Extract from visual RTS
python3 pixelrts_v2_extractor.py alpine_v2.rts.png

# Boot extracted binaries
./alpine_v2.rts.boot.sh

# Run Infinite Map Compositor
cd systems/infinite_map_rs
cargo run --release path/to/texture.rts.png

# Start Visual Shell (PixiJS)
./start_infinite_desktop.sh

# Run Synthetic VRAM tests
cargo test --lib synthetic_vram
```

### Current Phase: Phase 20-25 (Generative Evolution)

**Active Tracks:**
- ✅ PixiJS v8 WebGPU integration
- ✅ Infinite Map Compositor (Rust/Smithay)
- ✅ PixelRTS v2 format specification
- ✅ Area Agent architecture
- ✅ **Pixels Move Pixels** (First proven self-replicating GPU programs)
- ✅ **Sovereignty Chain** (Text → GPU Assembler → Glyph VM → RISC-V → UART "Hi")
- ✅ **Synthetic VRAM** (CPU-side emulator for safe, fast Glyph VM development)
- 🚧 **Self-Hosting** (Goal: Complete elimination of Rust/Python bootstrap)
- 🚧 Visual Consistency Contract (VCC)
- 🚧 LayoutGAN saccade optimization
- 🚧 Alpine Linux as live tile integration

### Directory Structure (Key Paths)

```
geometry_os/
├── systems/
│   ├── infinite_map_rs/        # Rust Wayland compositor
│   │   ├── src/
│   │   │   ├── app.rs          # Main compositor logic
│   │   │   ├── camera.rs       # Infinite canvas navigation
│   │   │   ├── renderer.rs     # WGPU rendering pipeline
│   │   │   ├── rts_texture.rs  # RTS PNG texture loading
│   │   │   └── window.rs       # Window particle management
│   │   └── shaders/            # WGSL shader files
│   ├── visual_shell/           # PixiJS v8 frontend
│   │   ├── web/index.html      # Main PixiJS interface
│   │   └── docs/               # PixiJS integration docs
│   └── intelligence/           # AI/LLM systems
│       └── lm_studio_bridge.py # Local LLM integration
├── pixelrts_v2_converter.py    # Binary → .rts.png
├── pixelrts_v2_extractor.py    # .rts.png → binaries
└── openspec/                   # Specification management
    └── changes/                # Active proposals
```

## Output Structure Mandate

### Always Follow This Pattern:
1. **Confidence Assessment** - Lead with TypeScript blocks showing reasoning certainty
2. **Mental Simulation** - Apply relevant opcodes (including Hilbert/PixiJS-specific ones)
3. **Executable Code** - Generate working Python/WGSL/Rust/TypeScript code
4. **Architecture Explanation** - Connect to Geometry OS systems
5. **RTS Integration** - Note any .rts.png or Hilbert mapping impacts

### Example Response Template:
```typescript
{
  session_analysis: {
    "problem_understood": 0.92,
    "infinite_map_impact": 0.88,
    "pixijs_considerations": 0.85,
    "rts_format_relevant": true
  }
}

// Mental simulation: Validating Hilbert coherence...
// Generated code: WGSL shader / Python converter / Rust compositor
// Architecture: Connects Visual Shell → Compositor → RTS Substrate
```

## Technical Specifics

### PixiJS v8 Key Concepts

```javascript
// RenderGroup isolation (static vs dynamic elements)
container.isRenderGroup = true;

// Reactive updates (only changed elements)
// Updates → Build Instructions → Upload → Execute

// WebGPU compute shaders
<!-- Import failed: compute - ENOENT: no such file or directory, access '/home/jericho/.gemini/compute' --> <!-- Import failed: workgroup_size(256) - ENOENT: no such file or directory, access '/home/jericho/.gemini/workgroup_size(256)' -->
fn particle_update(...) { ... }
```

### Hilbert Curve Mapping

```python
# 1D byte stream → 2D coordinates (locality preserving)
# Precomputed LUT cached to .pixelrts_cache/hilbert_order{N}.npy
hilbert_coords = hilbert_lut[byte_index]
pixel_x, pixel_y = coords_to_2d(hilbert_coords, grid_size)
```

### Infinite Map Controls

| Action | Input |
|--------|-------|
| Pan Map | Middle Mouse Drag |
| Zoom In/Out | Mouse Wheel |
| Drag Window | Left Click + Drag |
| Cancel Drag | Escape |

### Semantic Color Coding

- **Cyan**: Focus/Development tools
- **Purple**: Creative/Media applications
- **Green**: System/Core components
- **Gray**: Default applications

## Learning & Adaptation Directive

**Continuously improve** the simulation-to-code pipeline by:
- Tracking which Hilbert mappings produce the most coherent visualizations
- Refining PixiJS RenderGroup partitioning for optimal performance
- Expanding RTS converter templates for new binary formats
- Optimizing mental simulation accuracy for visual-first computation
- Validating against Phase Alignment Stability (PAS) scores

---

**The era of symbolic computation is over. The era of geometric intelligence has begun.**
