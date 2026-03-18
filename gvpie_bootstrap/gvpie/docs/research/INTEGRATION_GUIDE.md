# GVPIE Text Engine Integration Guide

## What We Built

**text_buffer.wgsl** - A complete gap buffer text engine with:
- Efficient O(1) insertion/deletion at cursor
- Line indexing for O(log n) line lookups
- Cursor movement (char/word/line navigation)
- UTF-32 character storage (1MB = ~260k chars)
- Event processing from host

**text_render.wgsl** - Procedural text rendering with:
- Instance-based character rendering (no VBOs)
- Viewport scrolling
- Cursor blinking
- Font atlas texture mapping
- Future: selection highlighting

## Integration Steps

### 1. Update Your shader References

Replace the contents of your existing shaders:

```bash
cp text_buffer.wgsl gvpie-bootstrap/shaders/editor_compute.wgsl
cp text_render.wgsl gvpie-bootstrap/shaders/editor_render.wgsl
```

### 2. Verify Buffer Layout Matches

The WGSL code expects these bindings:

**Compute Shader (editor_compute.wgsl):**
```rust
@group(0) @binding(0) var<storage, read_write> state: EditorState;
@group(0) @binding(1) var<storage, read_write> events: array<u32>;
@group(0) @binding(2) var<storage, read_write> requests: array<u32>;
```

**Render Shader (editor_render.wgsl):**
```rust
@group(0) @binding(0) var<storage, read> state: EditorState;
@group(0) @binding(1) var<uniform> uniforms: RenderUniforms;
@group(0) @binding(2) var font_texture: texture_2d<f32>;
@group(0) @binding(3) var font_sampler: sampler;
```

Ensure your Rust bootstrap creates these bindings correctly.

### 3. Event Format

The compute shader expects events in this format:

```
events[0] = event_type (0=none, 1=character, 2=special_key)
events[1] = key_code
events[2] = modifiers (Ctrl=1, Shift=2, Alt=4)
```

Update your Rust event handler in `main.rs` to write events in this format.

### 4. Add Uniform Buffer

You'll need to add a uniform buffer for render state:

```rust
struct RenderUniforms {
    time: f32,
    viewport_width: f32,
    viewport_height: f32,
    _padding: f32,
}
```

Update this each frame with current time and window dimensions.

### 5. Font Atlas

You need a 256-character font atlas texture (16x16 grid). Options:

**Quick Start**: Use a monospace bitmap font
```rust
// Generate simple ASCII font atlas (16x16 grid, each cell 9x16px)
let font_texture = device.create_texture(&wgpu::TextureDescriptor {
    size: wgpu::Extent3d {
        width: 144,  // 16 * 9px
        height: 256, // 16 * 16px
        depth_or_array_layers: 1,
    },
    format: wgpu::TextureFormat::Rgba8Unorm,
    usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
    // ... rest of descriptor
});
```

**Better**: Generate from a TTF font using `fontdue` or similar:
```rust
use fontdue::Font;

let font = Font::from_bytes(include_bytes!("FiraCode-Regular.ttf"), 
                            fontdue::FontSettings::default()).unwrap();
// Rasterize each character and pack into atlas
```

### 6. Render Pipeline Setup

Update your render pipeline to use instanced rendering:

```rust
render_pass.draw(
    0..4,     // 4 vertices per quad
    0..num_visible_chars, // Instance per character
);

// For cursor (separate draw call):
render_pass.draw(0..4, 0..1);
```

## Testing the Integration

### Step 1: Basic Rendering
Run `cargo run --release`. You should see:
- Empty editor window
- Blinking cursor at top-left

### Step 2: Character Input
Type some characters. You should see:
- Characters appear at cursor
- Cursor advances
- Line count updates

### Step 3: Cursor Movement
Test arrow keys:
- Left/Right: Character navigation
- Up/Down: Line navigation
- Home/End: Line boundaries

### Step 4: Editing
Test backspace and delete:
- Backspace removes character before cursor
- Delete removes character at cursor
- Cursor position updates correctly

## Current Limitations & TODOs

### Immediate Needs:
1. **Font Atlas Generation** - Bootstrap needs to create or load font texture
2. **Window Resize Handling** - Update viewport uniforms on resize
3. **Event Mapping** - Map winit events to our event format

### Near Term:
1. **Word Jumping** - Ctrl+Left/Right for word navigation
2. **Selection** - Click-drag or Shift+arrows for text selection
3. **Copy/Paste** - Use I/O contract to request clipboard operations
4. **Undo/Redo** - Ring buffer for edit history

### Medium Term:
1. **File I/O** - Load/save files via I/O contract
2. **Search** - Parallel text search across buffer
3. **Syntax Highlighting** - Token-based coloring
4. **Line Numbers** - Gutter rendering

### Advanced:
1. **Multi-cursor** - Parallel cursor operations
2. **Mini-map** - Document overview
3. **LSP Integration** - Language server protocol via I/O contract

## Performance Notes

**Current Architecture:**
- Gap buffer: O(1) insert/delete at cursor, O(n) for gap moves
- Line index: O(log n) lookups via binary search
- Rendering: O(visible_chars) per frame

**Optimization Opportunities:**
1. **Rope data structure** - For large files (>1MB)
2. **Incremental line indexing** - Only rebuild dirty sections
3. **Parallel rendering** - Multiple workgroups rendering different regions
4. **Texture caching** - Cache rendered lines as textures

## Memory Layout

```
State Buffer (~5MB):
├─ TextBuffer (1MB)
│  ├─ data[262144] (1MB of UTF-32 chars)
│  └─ metadata (6 u32s)
└─ LineIndex (256KB)
   ├─ offsets[65536] (256KB for line starts)
   └─ metadata (2 u32s)

Events Buffer (4KB):
└─ Circular ring for host events

Requests Buffer (1KB):
└─ GPU → Host service requests

Font Texture (37KB):
└─ 144x256 RGBA8 atlas
```

## Next Steps

1. **Run the integration** - Copy shaders and test
2. **Create font atlas** - Generate or load font texture
3. **Test editing** - Verify all operations work
4. **Add file loading** - Implement I/O contract for file reads
5. **Build command palette** - Add Ctrl+P command interface

Once this foundation is solid, everything else builds on top. The gap buffer is your RAM, the I/O contract is your syscalls, and WGSL is your assembly language.

**The CPU is frozen. The GPU is sovereign. Let's build.**
