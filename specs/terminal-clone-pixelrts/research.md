---
spec: terminal-clone-pixelrts
phase: research
created: 2026-02-20T18:35:00Z
---

# Research: Terminal Clone -> PixelRTS

## Executive Summary

Existing infrastructure provides 80% of needed components. **TerminalEmulator** (1324 lines, VT100/ANSI) + **FONT_8X16** atlas ready for GPU rendering. **VATManager** (395 lines) handles focal-point placement. **ExtractionPipeline** provides VM terminal OCR. Primary gaps: PTY engine (nix crate needs term/pty features) and WGSL terminal renderer shader (template exists but needs cell-based rendering). Implementation is **low risk** with clear path.

---

## Existing Infrastructure (Reuse)

### High-Value Reuse Candidates

| Component | Location | Lines | Status | Reuse Strategy |
|-----------|----------|-------|--------|----------------|
| **TerminalEmulator** | `systems/infinite_map_rs/src/terminal_emulator.rs` | 1324 | Ready | Direct use - PTY feeds bytes, emulator parses ANSI -> TerminalBuffer |
| **TerminalBuffer** | Same file (L168-559) | 391 | Ready | Cell grid with scrollback, resize+reflow, view offset |
| **FONT_8X16** | `systems/infinite_map_rs/src/font_bitmap.rs` | 197 | Ready | 8x16 bitmap atlas for ASCII 32-127, 95 characters |
| **VATManager** | `systems/visual_shell/api/vat_manager.py` | 395 | Ready | Tile position tracking, focal-point placement |
| **ExtractionPipeline** | `conductor/tracks/shotcut-on-the-map/extraction_pipeline.py` | 359 | Ready | OCR + clustering + widget detection for VM framebuffer analysis |
| **TectonicIpc** | `systems/infinite_map_rs/src/tectonic/ipc.rs` | 350 | Reference | File-based IPC pattern for Python-Rust communication |
| **VisualBridge** | `systems/visual_shell/api/visual_bridge.py` | 200+ | Reference | WebSocket hub (port 8768) for browser HUD streaming |

### Key Data Structures (Already Implemented)

```rust
// TerminalEmulator already provides:
pub struct TerminalBuffer {
    cells: Vec<Vec<TerminalCell>>,  // 2D grid
    cursor_row: usize,
    cursor_col: usize,
    rows: usize,
    cols: usize,
    scrollback: Vec<Vec<TerminalCell>>,  // History buffer
    max_scrollback: usize,  // 1000 lines
    view_offset: usize,     // Scroll position
}

pub struct TerminalCell {
    pub c: char,
    pub attrs: CellAttributes,  // fg, bg, bold, italic, underline, etc.
}

pub enum TerminalColor {
    Black, Red, Green, Yellow, Blue, Magenta, Cyan, White,
    BrightBlack, BrightRed, ...,  // 16 basic colors
    Rgb(u8, u8, u8),              // 24-bit
    Indexed(u8),                   // 256-color
}
```

### Existing Shader Patterns

| Shader | Location | Pattern |
|--------|----------|---------|
| text_buffer.wgsl | `src/shaders/text_buffer.wgsl` | Storage buffer for character data, compute dispatch |
| msdf_font.wgsl | `src/shaders/msdf_font.wgsl` | MSDF font atlas sampling |
| riscv_executor.wgsl | `src/shaders/riscv_executor.wgsl` | Staging buffer pattern for CPU->GPU transfer |

---

## Technical Research

### PTY Engine (nix crate)

**Dependency already in Cargo.toml:**
```toml
nix = { version = "0.27", features = ["ioctl", "fs", "process"] }
```

**Required additions:**
```toml
nix = { version = "0.27", features = ["ioctl", "fs", "process", "term", "pty", "unistd", "fcntl"] }
```

**Implementation pattern from existing code:**
- Fork pattern in `run_riscv.rs` shows child process spawning
- File descriptor handling via `libc::ioctl` for `TIOCSWINSZ`
- Non-blocking read pattern in RISC-V executor

### GPU Texture Upload (WGPU)

**Existing patterns from `riscv_executor.rs`:**
```rust
// Staging buffer creation (L329-340)
let staging = device.create_buffer(&wgpu::BufferDescriptor {
    label: Some("stats_staging_buffer"),
    size: stats_size,
    usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
    mapped_at_creation: false,
});

// Write to staging (L936-945)
queue.write_buffer(&self.stats_staging_buffer, 0, &stats_bytes);

// Map for read (L983-1015)
let buffer_slice = self.stats_staging_buffer.slice(..);
buffer_slice.map_async(wgpu::MapMode::Read, ...);
```

**Texture write pattern from `app.rs` (L1222):**
```rust
queue.write_texture(
    image_copy_texture,
    &texture_data,
    data_layout,
    valid_extent,
);
```

### Python-Rust IPC Patterns

**From TectonicIpc (tectonic/ipc.rs):**
- File-based JSON exchange in `.geometry/tectonic/`
- Rust polls for `proposal.json`, writes `layout_delta.json`
- Python reads delta, applies to VAT

**Alternative: Unix Domain Socket (from VisualBridge):**
- `/tmp/geometry_os_terminal_clone.sock`
- JSON-RPC style messages
- Async with tokio

---

## Integration Points

### Tile System Integration

**From `tile.rs` (267 lines):**
```rust
pub struct Tile {
    pub id: TileId,
    pub position: (i32, i32),
    pub genotype: Genotype,
    pub phenotype: Phenotype,  // includes visual_brick: String
    pub epigenetics: Epigenetics,
    pub fitness: FitnessScore,
    pub species: String,
    pub vitality: f64,
}
```

**Terminal tile would be:**
- `species: "terminal"`
- `visual_brick: "terminal_{id}.rts.png"`
- Position from VATManager

### VAT Focal Point Placement

**From `vat_manager.py`:**
```python
class VAT:
    version: str = "2.0"
    grid_size: int = 4096
    center_x: int = 2048
    center_y: int = 2048
    tiles: Dict[str, TilePosition]

def set_tile_position(self, tile_id, x, y, tile_type="terminal", district="default"):
    # Auto-saves to vat.json
```

**Placement strategy:**
- New terminals spawn near center with random offset ( +/- 200 px)
- Focal point gravity from Swarm Recursive Evolution pulls high-value tiles inward

### Extraction Pipeline Integration

**From `extraction_pipeline.py`:**
```python
class ExtractionPipeline:
    def extract(self, image_path: str) -> ExtractionResult:
        # Step 1: OCR with clustering
        analysis = self.analyzer.analyze_with_clustering(image_path, width, height)
        # Step 2: Widget detection
        widgets = self.widget_detector.detect(elements)
        # Step 3: Safety scanning
        diagnostic = self.safety_scanner.scan(full_text)
        return ExtractionResult(elements, clusters, widgets, ascii_view, diagnostic)
```

**VM terminal detection:**
1. QEMU framebuffer capture -> PNG
2. ExtractionPipeline.extract()
3. Check for terminal patterns (shell prompt, ls output, ANSI sequences)
4. Extract text content + bounding box
5. Spawn PTY with extracted grid size

---

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| **Technical Viability** | High | 80% reuse, clear data flow |
| **Effort Estimate** | Small | 6 tasks, ~14 tests, ~500 new LoC |
| **Risk Level** | Low | No unknowns, existing patterns |

### Complexity Breakdown

| Task | Complexity | Reuse | New Code |
|------|------------|-------|----------|
| PTY Engine | Medium | nix crate | ~150 LoC |
| Clone Manager | Low | TerminalEmulator | ~100 LoC |
| WGSL Renderer | Medium | text_buffer.wgsl pattern | ~200 LoC |
| VAT Bridge | Low | VATManager | ~100 LoC |
| VM Detector | Low | ExtractionPipeline | ~100 LoC |
| E2E Tests | Low | Existing test patterns | ~150 LoC |

### Key Risks

1. **PTY non-blocking I/O**: Needs careful async handling - mitigated by existing patterns in riscv_executor
2. **Texture upload bandwidth**: 120x36 cells = 4320 cells x 16 bytes = 69KB per terminal - negligible for WGPU
3. **Scrollback memory**: 1000 lines x 120 cols x 16 bytes = ~2MB per terminal - acceptable

---

## Recommendations for Requirements

1. **Use nix::pty directly** - no need for portability libraries, Linux-only is acceptable for this OS
2. **File-based IPC like TectonicIpc** - simpler than Unix sockets, proven pattern
3. **Compute shader rendering** - follow text_buffer.wgsl pattern with cell storage buffer
4. **Focal point placement** - reuse VATManager center + random offset
5. **Terminal detection** - start with regex patterns, enhance with ML later
6. **Feature gate as "hypervisor"** - already exists, TerminalEmulator uses it

---

## Related Specs

| Spec | Relationship | May Need Update |
|------|--------------|-----------------|
| **substrate-cloning** | High - Same domain (VM extraction -> PixelRTS) | No (complete) |
| **pixelrts-v2** | Medium - Shared encoding format | No |
| **ouroboros-level2** | Low - Interactive terminal use case | Maybe |

---

## Quality Commands

| Type | Command | Source |
|------|---------|--------|
| Lint | `make lint` | Makefile |
| Format | `make format` | Makefile |
| Format Check | `make format-check` | Makefile |
| Unit Test | `make test-unit` | Makefile |
| Integration Test | `make test-integration` | Makefile |
| Rust Test | `cargo test --features hypervisor` | Cargo |
| Build | `make rust-release` | Makefile |
| All Checks | `make check` | Makefile |

**Local CI:**
```bash
make format-check && make lint && make check
```

---

## Open Questions

1. Should PTY use blocking or async I/O? - **Recommend: Non-blocking with polling**
2. Maximum concurrent terminals? - **Recommend: 10 (configurable)**
3. Scrollback limit per terminal? - **Current: 1000 lines, configurable**
4. UTF-8 support beyond ASCII? - **FONT_8X16 only has ASCII 32-127; Unicode would need MSDF atlas**

---

## Sources

### Code Files
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/src/terminal_emulator.rs` - TerminalEmulator, TerminalBuffer, VT100 parsing
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/src/font_bitmap.rs` - FONT_8X16 bitmap atlas
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/api/vat_manager.py` - VATManager, TilePosition
- `/home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/extraction_pipeline.py` - OCR pipeline
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/src/tectonic/ipc.rs` - IPC pattern
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/src/shaders/text_buffer.wgsl` - Shader pattern
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/src/tile.rs` - Tile structure
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/Cargo.toml` - Dependencies

### Documentation
- `/home/jericho/zion/projects/geometry_os/geometry_os/docs/plans/2026-02-20-terminal-clone-pixelrts.md` - Implementation plan (pre-written)
- `/home/jericho/zion/projects/geometry_os/geometry_os/specs/substrate-cloning/.progress.md` - Related spec progress

### Makefile
- `/home/jericho/zion/projects/geometry_os/geometry_os/Makefile` - Quality commands
