# Pattern Sources Roadmap

External projects worth extracting patterns from to improve Geometry OS.

## Priority 1: High Value, Directly Applicable

### 1. Bevy Engine (Rust Game Engine)
**Why:** GPU-first architecture, ECS patterns, scheduling system
**Patterns to extract:**
- GPU resource management
- Schedule graph for system ordering
- Plugin architecture
- Hot reload patterns

```bash
git clone --depth 1 https://github.com/bevyengine/bevy
```

### 2. Sway / i3 (Tiling Window Managers)
**Why:** Spatial window management, tree-based layout
**Patterns to extract:**
- Container tree structure
- Focus handling
- Workspace management
- IPC protocol

```bash
git clone --depth 1 https://github.com/swaywm/sway
git clone --depth 1 https://github.com/i3/i3
```

### 3. wgpu Examples (Official WebGPU Patterns)
**Why:** Canonical GPU patterns from the library we use
**Patterns to extract:**
- Bind group layouts
- Pipeline creation patterns
- Buffer management
- Compute shader patterns

```bash
git clone --depth 1 https://github.com/gfx-rs/wgpu
# Focus on: wgpu/examples/
```

---

## Priority 2: Domain-Specific Value

### 4. SerenityOS (C++ Hobby OS)
**Why:** Complete OS with GUI, window server, applications
**Patterns to extract:**
- Window server protocol
- Event loop architecture
- GUI widget hierarchy
- Process management

```bash
git clone --depth 1 https://github.com/SerenityOS/serenity
# Focus on: Libraries/LibGUI/, Services/WindowServer/
```

### 5. Alacritty (GPU-Accelerated Terminal)
**Why:** Grid of glyphs rendered on GPU
**Patterns to extract:**
- Terminal grid → GPU buffer
- Glyph atlas management
- Unicode rendering
- Scrollback handling

```bash
git clone --depth 1 https://github.com/alacritty/alacritty
```

### 6. PaperWM (Gnome Extension)
**Why:** Spatial desktop with infinite horizontal scroll
**Patterns to extract:**
- Spatial navigation
- Window tiling in 2D space
- Viewport management
- Workspace as infinite canvas

```bash
git clone --depth 1 https://github.com/paperwm/PaperWM
```

---

## Priority 3: Specialized Patterns

### 7. CRDT Implementations (Conflict-free Replicated Data Types)
**Why:** Distributed state that converges
**Patterns to extract:**
- State merge strategies
- Vector clocks
- Operation transforms
- Eventually consistent patterns

```bash
git clone --depth 1 https://github.com/josephg/libcrdt
git clone --depth 1 https://github.com/y-crdt/y-crdt
```

### 8. AutoGPT / CrewAI (AI Agent Frameworks)
**Why:** Multi-agent orchestration patterns
**Patterns to extract:**
- Agent communication protocols
- Task decomposition
- Tool use patterns
- Memory architectures

```bash
git clone --depth 1 https://github.com/Significant-Gravitas/AutoGPT
git clone --depth 1 https://github.com/joaomdmoura/crewAI
```

### 9. Xi Editor (Rust Text Editor)
**Why:** Async architecture, plugin system
**Patterns to extract:**
- CRDT-based text editing
- Plugin protocol (JSON-RPC)
- Async file handling
- Incremental updates

```bash
git clone --depth 1 https://github.com/xi-editor/xi-editor
```

### 10. Redox OS (Rust Microkernel OS)
**Why:** Rust OS with different architecture than Linux
**Patterns to extract:**
- Microkernel design
- Scheme-based I/O
- Memory management
- Process scheduling

```bash
git clone --depth 1 https://gitlab.redox-os.org/redox-os/redox
```

---

## Priority 4: Pattern Libraries (Don't Clone, Just Reference)

### Design Patterns
- **Game Programming Patterns** - book by Robert Nystrom
- **Rust API Guidelines** - `https://rust-lang.github.io/api-guidelines/`
- **GPU Gems** - NVIDIA's free GPU programming books

### Algorithm References
- **Red Blob Games** - Hex grids, pathfinding, procedural generation
- **Inigo Quilez** - SDF rendering, shader math

---

## Extraction Order

Recommended sequence:

1. **wgpu examples** - Immediate GPU patterns
2. **Alacritty** - Glyph grid rendering
3. **Sway/i3** - Spatial window management
4. **Bevy** - ECS and scheduling
5. **SerenityOS** - Full OS patterns
6. **PaperWM** - Infinite canvas
7. **CRDTs** - Distributed state
8. **Xi Editor** - Async + plugins

---

## How to Contribute

When extracting from a source:

1. Create branch: `patterns/[source-name]`
2. Run extraction process (see `PATTERN_EXTRACTION_METHOD.md`)
3. Save to: `memory/[source]-patterns.md`
4. Update: `MEMORY.md` index
5. Remove cloned code
6. PR with summary of patterns found

---

*Keep the patterns, discard the code.*
