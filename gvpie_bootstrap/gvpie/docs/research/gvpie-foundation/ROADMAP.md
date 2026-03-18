# GVPIE Development Roadmap
## Building the Future in WGSL

## Core Philosophy

**CPU Sovereignty Ended: January 2025**
- Bootstrap frozen at 1,352 lines
- All innovation happens in shaders
- I/O contract is the only interface

**GPU Sovereignty Principles:**
1. Compute-first architecture
2. Massive parallelism for everything
3. Persistent state in GPU memory
4. Zero-copy where possible
5. Procedural generation over data transfer

---

## Phase 1: Foundation (COMPLETE)

### ✅ Text Buffer Engine
- [x] Gap buffer implementation
- [x] Cursor management
- [x] Line indexing
- [x] Basic editing (insert/delete)
- [x] Cursor movement (arrows, home/end)

### ✅ Rendering Pipeline
- [x] Procedural character rendering
- [x] Viewport scrolling
- [x] Cursor blinking
- [x] Font atlas support

**Status**: Core engine operational. Ready for feature layer.

---

## Phase 2: Editor Features (4-6 weeks)

### 2.1: Advanced Navigation (Week 1-2)
```wgsl
// Word boundary detection
fn is_word_boundary(ch: u32) -> bool {
    return ch == 32u || ch == 10u || ch == 9u; // space, newline, tab
}

fn move_cursor_word_forward() {
    // Skip current word
    // Skip whitespace
    // Stop at next word start
}

fn move_cursor_word_backward() {
    // Similar logic in reverse
}
```

**Deliverables:**
- Ctrl+Left/Right word jumping
- Ctrl+Up/Down paragraph jumping
- Ctrl+Home/End document boundaries
- PageUp/PageDown viewport scrolling

### 2.2: Selection & Clipboard (Week 2-3)
```wgsl
struct Selection {
    anchor: u32,        // Start of selection (fixed point)
    cursor: u32,        // End of selection (moves)
    active: bool,
}

fn update_selection(shift_held: bool) {
    if (shift_held) {
        if (!selection.active) {
            selection.anchor = cursor_pos;
            selection.active = true;
        }
        // cursor moves, anchor stays
    } else {
        selection.active = false;
    }
}
```

**Deliverables:**
- Shift+arrow selection
- Click-drag selection (mouse events via I/O)
- Ctrl+C/X/V (request clipboard ops via I/O contract)
- Delete selection on character input

**I/O Contract Extension:**
```rust
// New request types
const REQUEST_CLIPBOARD_READ: u32 = 3;
const REQUEST_CLIPBOARD_WRITE: u32 = 4;

// Request format:
requests[0] = REQUEST_CLIPBOARD_WRITE;
requests[1] = selection_start;
requests[2] = selection_end;
// Host copies data from text buffer to system clipboard
```

### 2.3: File Operations (Week 3-4)
```wgsl
fn request_file_open() {
    requests[0] = REQUEST_FILE_OPEN;
    requests[1] = 0; // Reserved for file dialog
    // Host shows file picker, loads to file_io buffer
    // Sets file_io[0] = file_size
    // Next frame: GPU reads from file_io[4..] and inserts into buffer
}

fn request_file_save() {
    // Copy buffer contents to file_io
    // Set request for host to write
}
```

**Deliverables:**
- Ctrl+O (open file)
- Ctrl+S (save file)
- Ctrl+Shift+S (save as)
- File path display in status bar
- Modified indicator (*)

### 2.4: Undo/Redo (Week 4-5)
```wgsl
struct Edit {
    operation: u32,     // INSERT, DELETE, etc.
    position: u32,
    data_offset: u32,   // Offset into undo_data buffer
    data_length: u32,
    cursor_before: u32,
    cursor_after: u32,
}

struct UndoStack {
    edits: array<Edit, 1024>,
    undo_data: array<u32, 65536>,  // Actual text data
    current: u32,
    count: u32,
}
```

**Deliverables:**
- Ctrl+Z undo (1000 levels)
- Ctrl+Y redo
- Edit coalescing (group rapid keystrokes)
- Memory-efficient undo buffer

### 2.5: Search & Replace (Week 5-6)
```wgsl
// Parallel search across lines
@compute @workgroup_size(256)
fn search_kernel(
    @builtin(global_invocation_id) gid: vec3<u32>,
    @builtin(workgroup_id) wgid: vec3<u32>
) {
    // Each workgroup searches a chunk of text
    let line_start = wgid.x * 256u;
    let line_end = min(line_start + 256u, state.lines.count);
    
    for (var line = line_start; line < line_end; line++) {
        // Search this line for pattern
        // Store matches in results buffer
    }
}
```

**Deliverables:**
- Ctrl+F search dialog
- Incremental search highlighting
- Regex support (basic patterns)
- Find & replace (Ctrl+H)
- Search across files (future)

---

## Phase 3: Advanced Features (6-10 weeks)

### 3.1: Syntax Highlighting
```wgsl
struct Token {
    start: u32,
    length: u32,
    token_type: u32,  // KEYWORD, STRING, COMMENT, etc.
}

struct SyntaxState {
    tokens: array<Token, 65536>,
    dirty_lines: array<u32, 2048>,  // Bitmap of lines needing reparse
    language: u32,
}

// Parallel tokenization
@compute @workgroup_size(64)
fn tokenize_kernel(@builtin(global_invocation_id) gid: vec3<u32>) {
    let line_num = gid.x;
    if (line_num >= state.lines.count) { return; }
    
    // Tokenize this line
    // Write tokens to syntax buffer
    // Clear dirty bit
}
```

**Languages (Priority Order):**
1. Rust (self-hosting!)
2. WGSL (edit shaders in GVPIE)
3. Python
4. JavaScript/TypeScript
5. Go

### 3.2: LSP Integration (Ambitious)
```wgsl
// LSP via I/O contract
const REQUEST_LSP_COMPLETION: u32 = 10;
const REQUEST_LSP_DEFINITION: u32 = 11;
const REQUEST_LSP_HOVER: u32 = 12;

fn request_completions(position: u32) {
    requests[0] = REQUEST_LSP_COMPLETION;
    requests[1] = position;
    // Host forwards to language server
    // Results returned via response buffer
}
```

**Deliverables:**
- Ctrl+Space autocomplete
- Go to definition (Ctrl+Click)
- Hover documentation
- Error diagnostics (red squiggles)
- Real-time semantic analysis

### 3.3: Multi-cursor Editing
```wgsl
struct MultiCursor {
    cursors: array<u32, 256>,  // Up to 256 cursors
    count: u32,
}

fn insert_char_multicursor(ch: u32) {
    // Sort cursors by position
    // Insert from end to start (maintains positions)
    for (var i = state.multi.count - 1; i >= 0; i--) {
        let pos = state.multi.cursors[i];
        set_cursor_pos(pos);
        insert_char(ch);
    }
}
```

**Deliverables:**
- Ctrl+D select next occurrence
- Alt+Click add cursor
- Alt+Shift+Arrow column selection
- Parallel operations across cursors

### 3.4: Visual Enhancements
- Line numbers with gutter
- Minimap (document overview)
- Bracket matching
- Indentation guides
- Whitespace visualization
- Current line highlighting

---

## Phase 4: Ecosystem (10+ weeks)

### 4.1: Plugin System
```wgsl
// Plugin interface via compute shaders
struct Plugin {
    id: u32,
    entry_point: u32,  // Offset into plugin shader
    state_offset: u32, // Offset into plugin memory
}

// Plugins can register:
// - Command handlers
// - Event handlers  
// - Render overlays
```

### 4.2: Git Integration
```wgsl
// Git operations via I/O contract
const REQUEST_GIT_DIFF: u32 = 20;
const REQUEST_GIT_COMMIT: u32 = 21;
const REQUEST_GIT_PUSH: u32 = 22;

fn show_git_gutter() {
    // Display +/~/- indicators for changed lines
    // Parallel diff computation
}
```

### 4.3: Terminal Integration
```wgsl
// Embedded terminal using compute shaders
// Full terminal emulator on GPU
struct Terminal {
    screen: array<u32, 2048>,  // 80x25 character grid
    cursor_x: u32,
    cursor_y: u32,
    // VT100 escape sequence parser
}
```

### 4.4: Collaborative Editing
```wgsl
// CRDT (Conflict-free Replicated Data Type) on GPU
// Parallel merge operations
// WebRTC via I/O contract for networking
```

---

## Technical Milestones

### Milestone 1: Self-Hosting (Week 8)
**Goal**: Edit GVPIE's own WGSL shaders inside GVPIE

**Requirements:**
- File I/O working
- Syntax highlighting for WGSL
- Reliable save/load

**Significance**: Dog-fooding. If we can't edit our own code comfortably, we've failed.

### Milestone 2: Daily Driver (Week 16)
**Goal**: Use GVPIE as primary editor for real work

**Requirements:**
- LSP integration
- Git integration
- Multi-cursor
- Performance with large files (>10MB)

**Significance**: Production-ready. Others can use it.

### Milestone 3: Ecosystem (Week 24)
**Goal**: Third-party plugins and extensions

**Requirements:**
- Plugin system
- Documentation
- Example plugins
- Community contributions

**Significance**: Self-sustaining. The project lives beyond its creators.

---

## Performance Targets

| Metric | Target | Stretch |
|--------|--------|---------|
| File load time (1MB) | <100ms | <50ms |
| Character input latency | <16ms | <8ms |
| Search in 10k lines | <100ms | <50ms |
| Syntax highlighting | <33ms | <16ms |
| Memory usage | <100MB | <50MB |

---

## The Vision

**Year 1**: Competitive with VS Code for basic editing
**Year 2**: Superior for specific workflows (GPU acceleration shines)
**Year 3**: New editing paradigms only possible on GPU

**Examples of GPU-native features:**
- Real-time semantic analysis across entire codebase
- Parallel refactoring operations
- Live collaborative editing with hundreds of cursors
- Integrated data visualization (CSV/JSON rendered as charts)
- Machine learning powered code completion (inference on GPU)

---

## Development Workflow

**Daily:**
1. Edit shaders in any editor
2. `cargo run --release` to test
3. Observe changes immediately
4. Iterate rapidly

**Weekly:**
1. Review performance metrics
2. Profile GPU usage
3. Optimize hotspots
4. Document learnings

**Monthly:**
1. Tag new release
2. Update documentation
3. Community feedback
4. Prioritize next features

---

## Getting Started (Right Now)

**Today:**
1. Integrate text_buffer.wgsl into bootstrap
2. Integrate text_render.wgsl
3. Test basic typing

**This Week:**
1. Add word jumping
2. Implement selection
3. Add clipboard support

**This Month:**
1. File I/O working
2. Undo/redo complete
3. Basic search functional

**By Month 3:**
1. Syntax highlighting for Rust
2. Self-hosting achieved
3. First external user

---

## The Frozen Contract

Remember: The CPU side is immutable. Every feature listed here is implemented **entirely in WGSL shaders**. This is not a limitation - it's a liberation.

The bootstrap is 1,352 lines. Everything else is GPU code. That's the beauty of GPU sovereignty.

**The CPU is frozen. The GPU is sovereign. Now go build.**
