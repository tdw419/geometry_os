# Architecture

**Analysis Date:** 2026-02-11

## Pattern Overview

**Overall:** Distributed Spatial Computing with GPU-Native Execution

**Key Characteristics:**
- Multi-language substrate (Rust, Python, TypeScript, WGSL)
- PixelRTS v2 spatial encoding format for all binary data
- GPU-first execution via WebAssembly compute shaders
- Infinite 2D spatial workspace as primary interface metaphor
- Evolutionary daemon-driven self-improvement
- Visual Shell paradigm where UI is the computer

## Layers

**Presentation Layer (Visual Shell):**
- Purpose: Provides infinite 2D spatial interface for all computing activities
- Location: `systems/visual_shell/`, `systems/infinite_map_rs/src/`
- Contains: Window management, input handling, camera controls, compositor
- Depends on: Smithay (Wayland compositor), wgpu (GPU rendering)
- Used by: Desktop environments, neural interfaces, visual tools

**Spatial Encoding Layer (PixelRTS v2):**
- Purpose: Encodes binary data as PNG images using Hilbert space-filling curves
- Location: `systems/pixel_compiler/`, `pixelrts_v2/`
- Contains: Encoder/decoder, metadata management, registry manager
- Depends on: NumPy, PIL/Pillow, fast-hilbert
- Used by: All systems needing persistent storage or visual representation

**Execution Layer (WASM GPU Runtime):**
- Purpose: Executes WebAssembly code directly on GPU via compute shaders
- Location: `pixelrts_v2/runtime/`, `systems/pixel_compiler/wasm_gpu_bridge.py`
- Contains: Wasmtime runtime, WGSL VM shader, bridge to GPU
- Depends on: Wasmtime 28, wgpu-py, wgpu-rs
- Used by: Agents, applications, evolution daemon

**Intelligence Layer (Neural Systems):**
- Purpose: AI-powered decision making, evolution, and orchestration
- Location: `systems/intelligence/`, `systems/evolution/`, `systems/neural_cpu/`
- Contains: Evolution daemon, LLM integration, cognitive agents
- Depends on: Ollama, OpenAI APIs, custom neural models
- Used by: Self-improvement cycles, code analysis, autonomous development

**Storage Layer (VectorFS & Registry):**
- Purpose: Manages spatial data artifacts and metadata
- Location: `systems/pixel_compiler/rts_registry_manager.py`, `truth_management_system/backend/vectorfs/`
- Contains: Cartridge registry, metadata indexing, vector database client
- Depends on: SQLite, ChromaDB/semantic vector stores
- Used by: All systems requiring data persistence

## Data Flow

**PixelRTS Encoding Flow:**

1. Binary data (executables, kernel images, WASM modules) read from disk
2. HilbertCurve generates spatial mapping (2^N x 2^N grid LUT)
3. PixelRTSEncoder packs data into RGBA PNG using dense pixel packing
4. Metadata embedded in PNG tEXt chunks + optional .meta.json sidecar
5. SHA256 hash calculated for integrity verification
6. Result: `.rts.png` file that is both image and executable container

**WASM GPU Execution Flow:**

1. WASM bytecode extracted from `.rts.png` via WASMExtractor
2. Bytecode loaded into GPU storage buffer (`wasm_bytecode`)
3. WGSL compute shader (`wasm_vm.wgsl`) executes on workgroup
4. Workgroup shared memory provides stack, call stack, locals, control stack
5. Instructions executed until max_instructions or return
6. Results read from `globals[0]` (return value) and output buffers
7. Optional trace data collected for debugging

**Evolution Daemon Flow:**

1. Test suite runs at regular intervals (daemon.py monitoring loop)
2. Failed tests detected via pattern matching on output
3. CTRM (Truth Registry Manager) logs failure event
4. Roadmap generated with fix objectives
5. Roadmap processor creates tasks.md
6. Architect agent analyzes code and proposes fixes
7. Fixes applied and validated in self-improvement cycle

## Key Abstractions

**Cartridge:**
- Purpose: Represents any binary artifact as a spatial PNG image
- Examples: `alpine.rts.png`, `fibonacci.wasm.rts.png`
- Pattern: All data becomes visual, manipulable terrain

**Tile:**
- Purpose: Unit of execution in the infinite map workspace
- Examples: `compiler_tile.rs`, `terminal_tile.rs`, `process_tile.rs`
- Pattern: Each application is a window/tile in spatial 2D plane

**Agent:**
- Purpose: Autonomous WASM modules that perform specific tasks
- Examples: `px_grep`, `px_copy`, `px_ps`, `px_alloc`
- Pattern: Function calls become spatial entities

**Frequency Band:**
- Purpose: Organizes daemon communication by urgency/type
- Examples: DaemonFrequencyBand (Critical, Normal, Background)
- Pattern: Priority-based message routing for evolutionary system

## Entry Points

**Infinite Map Application:**
- Location: `systems/infinite_map_rs/src/main.rs`
- Triggers: Direct execution or systemd service
- Responsibilities: Main event loop, camera management, window manager, renderer

**PixelRTS CLI:**
- Location: `systems/pixel_compiler/pixelrts_cli.py`
- Triggers: Command-line invocation (`convert`, `benchmark`, `analyze`)
- Responsibilities: File conversion, benchmarking, pattern detection

**WASM Runtime:**
- Location: `pixelrts_v2/runtime/src/bin/pixelrts_runtime.rs` or `systems/pixel_compiler/wasm_runtime.py`
- Triggers: Loading `.rts.png` files containing WASM
- Responsibilities: WASM extraction, GPU execution, function calling

**Evolution Daemon:**
- Location: `systems/evolution/daemon.py`
- Triggers: Systemd service or manual start
- Responsibilities: Test monitoring, failure detection, improvement triggering

**Truth Management Backend:**
- Location: `truth_management_system/backend/main.py`
- Triggers: FastAPI server startup
- Responsibilities: Vector database, LLM orchestration, agent communication

## Error Handling

**Strategy:** Multi-layered fallback with visual feedback

**Patterns:**
- GPU execution falls back to mock CPU mode if wgpu unavailable
- WASM execution returns ExecutionResult with success/error fields
- Hilbert mapping validates grid sizes are power-of-2
- All PNG encoding includes SHA256 hash verification
- Daemon failures logged to CTRM for forensic analysis

## Cross-Cutting Concerns

**Logging:** Structured logging with env_logger (Rust) and standard logging (Python)
**Validation:** Power-of-2 grid size validation, hash verification, type checking
**Authentication:** API key management with rate limiting (`systems/pixel_compiler/auth/`)
**Configuration:** YAML configs in `config/`, environment variables, CLI flags
**Testing:** Pytest for Python, cargo test for Rust, custom benchmark suites

---

*Architecture analysis: 2026-02-11*
