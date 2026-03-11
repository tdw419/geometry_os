# Codebase Structure

**Analysis Date:** 2026-02-11

## Directory Layout

```
geometry_os/
├── systems/               # Core subsystems (Python and Rust)
├── pixelrts_v2/          # PixelRTS v2 workspace (Rust)
├── truth_management_system/  # Backend services and frontend
├── ai_project_management/ # AI project management tools
├── apps/                 # Applications (kilocode, openspec)
├── drivers/              # Hardware drivers (Rust)
├── docs/                 # Documentation
├── src/                  # Wayland compositor integration (Rust)
├── shaders/              # WGSL shader files
├── tests/                # Integration tests
├── blueprints/           # Build artifacts
└── .planning/            # Planning artifacts
```

## Directory Purposes

**systems/**:
- Purpose: All major subsystems of the OS
- Contains: pixel_compiler, evolution, infinite_map_rs, neural_cpu, visual_shell, intelligence
- Key files: `systems/pixel_compiler/wasm_gpu_bridge.py`, `systems/infinite_map_rs/src/app.rs`

**pixelrts_v2/**:
- Purpose: PixelRTS v2 format runtime and agents (Rust workspace)
- Contains: runtime/ (WASM execution), agents/ (px_grep, px_copy, etc.), shaders/ (WGSL)
- Key files: `pixelrts_v2/shaders/wasm_vm.wgsl`, `pixelrts_v2/runtime/src/lib.rs`

**truth_management_system/**:
- Purpose: Backend API and frontend for truth/opinion management
- Contains: backend/ (FastAPI), apps/ (OpenSpec, better-agents)
- Key files: `truth_management_system/backend/main.py`, `truth_management_system/apps/OpenSpec/`

**apps/**:
- Purpose: User-facing applications
- Contains: kilocode (AI code editor), openspec (spec management)
- Key files: `apps/kilocode/package.json`

**drivers/**:
- Purpose: Hardware driver implementations
- Contains: visual_input/
- Key files: `drivers/visual_input/Cargo.toml`

**docs/**:
- Purpose: Technical documentation and specifications
- Contains: API docs, architecture diagrams, guides
- Key files: Various .md files

**src/**:
- Purpose: Wayland compositor integration code (Rust)
- Contains: wayland_compositor.rs, input_handler_wayland.rs
- Key files: `src/wayland_compositor.rs`

## Key File Locations

**Entry Points:**
- `systems/infinite_map_rs/src/main.rs`: Main infinite map application
- `systems/pixel_compiler/pixelrts_cli.py`: PixelRTS command-line interface
- `pixelrts_v2/runtime/src/bin/pixelrts_runtime.rs`: WASM runtime binary
- `truth_management_system/backend/main.py`: Backend API server

**Configuration:**
- `pyproject.toml`: Root Python project configuration
- `systems/pixel_compiler/.env`: Environment variables
- `config/`: YAML configuration files

**Core Logic:**
- `systems/pixel_compiler/wasm_gpu_bridge.py`: GPU execution bridge
- `pixelrts_v2/shaders/wasm_vm.wgsl`: GPU WASM VM implementation
- `systems/infinite_map_rs/src/app.rs`: Main app struct and event loop
- `systems/evolution/daemon.py`: Self-improvement daemon

**Testing:**
- `tests/`: Integration tests
- `systems/pixel_compiler/tests/`: Unit tests for pixel compiler
- `pixelrts_v2/runtime/tests/`: Runtime tests

## Naming Conventions

**Files:**
- Python: `snake_case.py` (e.g., `wasm_gpu_bridge.py`, `pixelrts_v2_core.py`)
- Rust: `snake_case.rs` (e.g., `wasm_vm.wgsl`, `main.rs`, `lib.rs`)
- Shaders: `descriptive.wgsl` (e.g., `wasm_vm.wgsl`, `hilbert_decoder.wgsl`)
- TypeScript/TSX: PascalCase.ts or PascalCase.tsx

**Directories:**
- Python modules: `snake_case`
- Rust crates: `snake_case`
- Features: `kebab-case` (e.g., `hypervisor`, `python`)

**PixelRTS Files:**
- `.rts.png` - PixelRTS v2 PNG-encoded binaries
- `.rts.meta.json` - Sidecar metadata files
- `.wgsl` - WebGPU Shading Language files

## Where to Add New Code

**New Feature (Python):**
- Primary code: `systems/{feature_name}/`
- Tests: `systems/{feature_name}/tests/`

**New Feature (Rust):**
- Implementation: Create new crate in `systems/{feature_name}/` or add to existing
- Tests: `systems/{feature_name}/tests/` or inline `mod tests;`

**New WASM Agent:**
- Agent crate: `pixelrts_v2/agents/px_{agent_name}/`
- Export: Add to `pixelrts_v2/Cargo.toml` workspace members

**New Shader:**
- Shader file: `pixelrts_v2/shaders/{name}.wgsl` or `shaders/{name}.wgsl`
- Bridge: Update `systems/pixel_compiler/wasm_gpu_bridge.py` if needed

**New CLI Command:**
- Command handler: `systems/pixel_compiler/pixelrts_cli.py`
- Or separate module: `systems/pixel_compiler/commands/{cmd}.py`

**Utilities:**
- Shared helpers: `systems/common/` or `systems/{system}/utils/`
- Python utilities: `systems/pixel_compiler/` for PixelRTS-related utilities

## Special Directories

**systems/pixel_compiler/**:
- Purpose: Core PixelRTS encoding/decoding and WASM execution
- Generated: No (but produces .rts.png files)
- Committed: Yes

**pixelrts_v2/shaders/**:
- Purpose: WebGPU compute shaders for WASM VM
- Generated: No (hand-written WGSL)
- Committed: Yes

**blueprints/**:
- Purpose: Build artifacts and intermediate files
- Generated: Yes (by build system)
- Committed: No

**dist/**:
- Purpose: Distribution artifacts
- Generated: Yes
- Committed: No

**alpine_rootfs/**:
- Purpose: Extracted Alpine Linux root filesystem for VM boot
- Generated: Yes (extracted from ISO)
- Committed: No (large binary data)

**riscv-gnu-toolchain/**:
- Purpose: RISC-V cross-compiler toolchain
- Generated: Yes (built from source)
- Committed: No (build artifacts)

**ubuntu_full_rootfs/**:
- Purpose: Complete Ubuntu root filesystem
- Generated: Yes
- Committed: No

**node_modules/**:
- Purpose: NPM dependencies (any)
- Generated: Yes
- Committed: No

**__pycache__/**:
- Purpose: Python bytecode cache
- Generated: Yes
- Committed: No

**target/**:
- Purpose: Rust build artifacts
- Generated: Yes
- Committed: No

---

*Structure analysis: 2026-02-11*
