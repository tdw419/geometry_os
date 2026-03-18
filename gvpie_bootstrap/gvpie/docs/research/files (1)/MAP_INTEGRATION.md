# GVPIE Infinite Map - Integration Guide

## Overview

The Infinite Map is a spatial code organization system where you can pan, zoom, and place cards containing code/text anywhere in infinite 2D space. Everything runs on GPU.

## Architecture

**Two Shaders:**
1. `infinite_map_compute.wgsl` - Camera, cards, input handling
2. `infinite_map_render.wgsl` - Visual rendering (grid, cards, text)

**Key Features:**
- Smooth pan/zoom camera
- Drag-and-drop cards
- Unlimited 2D space
- 4096 cards maximum
- 256MB of content storage
- Real-time interaction

## Integration Steps

### 1. Replace Bootstrap Shaders

```bash
cd gvpie-bootstrap
cp infinite_map_compute.wgsl shaders/editor_compute.wgsl
cp infinite_map_render.wgsl shaders/editor_render.wgsl
```

### 2. Update Rust Event Handling

The compute shader expects events in this format:

```rust
// Event types
const EVENT_MOUSE_MOVE: u32 = 1;
const EVENT_MOUSE_BUTTON: u32 = 2;
const EVENT_KEYBOARD: u32 = 3;
const EVENT_SCROLL: u32 = 4;

// Mouse move event
events[0] = EVENT_MOUSE_MOVE;
events[1] = mouse_x.to_bits(); // f32 as u32
events[2] = mouse_y.to_bits();
events[3] = viewport_width.to_bits();
events[4] = viewport_height.to_bits();

// Mouse button event
events[0] = EVENT_MOUSE_BUTTON;
events[1] = button; // 0=left, 1=right, 2=middle
events[2] = if pressed { 1 } else { 0 };

// Keyboard event
events[0] = EVENT_KEYBOARD;
events[1] = key_code;
events[2] = modifiers; // Ctrl=1, Shift=2, Alt=4

// Scroll event
events[0] = EVENT_SCROLL;
events[1] = delta_y.to_bits(); // f32 as u32
```

### 3. Add Mouse Input Handling

```rust
use winit::event::{WindowEvent, ElementState, MouseButton, MouseScrollDelta};

// In your event loop:
WindowEvent::CursorMoved { position, .. } => {
    let mut events_data = [0u32; 256];
    events_data[0] = 1; // EVENT_MOUSE_MOVE
    events_data[1] = (position.x as f32).to_bits();
    events_data[2] = (position.y as f32).to_bits();
    events_data[3] = (window_size.width as f32).to_bits();
    events_data[4] = (window_size.height as f32).to_bits();
    queue.write_buffer(&events_buffer, 0, bytemuck::cast_slice(&events_data));
}

WindowEvent::MouseInput { state, button, .. } => {
    let mut events_data = [0u32; 256];
    events_data[0] = 2; // EVENT_MOUSE_BUTTON
    events_data[1] = match button {
        MouseButton::Left => 0,
        MouseButton::Right => 1,
        MouseButton::Middle => 2,
        _ => 0,
    };
    events_data[2] = if state == ElementState::Pressed { 1 } else { 0 };
    queue.write_buffer(&events_buffer, 0, bytemuck::cast_slice(&events_data));
}

WindowEvent::MouseWheel { delta, .. } => {
    let delta_y = match delta {
        MouseScrollDelta::LineDelta(_, y) => y,
        MouseScrollDelta::PixelDelta(pos) => pos.y as f32 / 10.0,
    };
    
    let mut events_data = [0u32; 256];
    events_data[0] = 4; // EVENT_SCROLL
    events_data[1] = delta_y.to_bits();
    queue.write_buffer(&events_buffer, 0, bytemuck::cast_slice(&events_data));
}

WindowEvent::KeyboardInput { input, .. } => {
    if let Some(keycode) = input.virtual_keycode {
        let mut events_data = [0u32; 256];
        events_data[0] = 3; // EVENT_KEYBOARD
        events_data[1] = keycode as u32;
        events_data[2] = 0; // TODO: modifiers
        queue.write_buffer(&events_buffer, 0, bytemuck::cast_slice(&events_data));
    }
}
```

### 4. Update Buffer Allocations

The map needs more memory than the text editor:

```rust
// State buffer - ~20MB for cards and camera
let state_buffer = device.create_buffer(&wgpu::BufferDescriptor {
    label: Some("Map State"),
    size: 20_971_520, // 20MB
    usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
    mapped_at_creation: false,
});

// Content buffer - 256MB for card text
let content_buffer = device.create_buffer(&wgpu::BufferDescriptor {
    label: Some("Content Buffer"),
    size: 268_435_456, // 256MB
    usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
    mapped_at_creation: false,
});
```

### 5. Render Pipeline Setup

You need THREE render passes:

```rust
// Pass 1: Grid (draw lines)
render_pass.set_pipeline(&grid_pipeline);
render_pass.set_bind_group(0, &bind_group, &[]);
let num_grid_lines = calculate_visible_grid_lines(); // Based on zoom/viewport
render_pass.draw(0..2, 0..num_grid_lines);

// Pass 2: Cards (draw card backgrounds)
render_pass.set_pipeline(&card_pipeline);
render_pass.set_bind_group(0, &bind_group, &[]);
render_pass.draw(0..4, 0..card_count); // Quad per card

// Pass 3: Text (draw card titles and content)
render_pass.set_pipeline(&text_pipeline);
render_pass.set_bind_group(0, &bind_group, &[]);
let total_chars = calculate_total_chars(); // Sum of all card text
render_pass.draw(0..4, 0..total_chars); // Quad per character
```

### 6. Uniforms Update

```rust
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct RenderUniforms {
    viewport_width: f32,
    viewport_height: f32,
    time: f32,
    _padding: f32,
}

// Each frame:
let start_time = std::time::Instant::now();
let elapsed = start_time.elapsed().as_secs_f32();

let uniforms = RenderUniforms {
    viewport_width: window_size.width as f32,
    viewport_height: window_size.height as f32,
    time: elapsed,
    _padding: 0.0,
};

queue.write_buffer(&uniform_buffer, 0, bytemuck::bytes_of(&uniforms));
```

## Controls

**Navigation:**
- `W/A/S/D` or `Arrow keys` - Pan camera
- `Mouse wheel` - Zoom in/out
- `+/-` - Zoom in/out
- `0` - Reset zoom to 100%
- `G` - Toggle grid visibility

**Card Operations:**
- `Click` card - Select it
- `Drag` card - Move it around
- `Ctrl+N` - Create new card at camera center
- `Click empty space` - Deselect

## Testing Checklist

### Basic Rendering
- [ ] Window opens with grid visible
- [ ] See a "Welcome to GVPIE" card in center
- [ ] Grid lines visible

### Camera Controls
- [ ] WASD/arrows pan the view
- [ ] Scroll wheel zooms
- [ ] +/- keys zoom
- [ ] 0 key resets zoom
- [ ] G toggles grid

### Card Interaction
- [ ] Can click and select card
- [ ] Can drag card around
- [ ] Card follows mouse while dragging
- [ ] Card highlights when hovered
- [ ] Selected card has different color

## Memory Layout

```
State Buffer (20MB):
├─ Camera (7 f32s = 28 bytes)
├─ Cards array (4096 × 40 bytes = 163KB)
└─ Metadata (52 bytes)

Content Buffer (256MB):
└─ UTF-32 encoded text data

Events Buffer (4KB):
└─ Input events from host

Requests Buffer (1KB):
└─ Service requests to host
```

## Performance Notes

**Current Implementation:**
- 4096 cards maximum
- Each card can hold ~16K characters
- Total capacity: ~64M characters across all cards
- Rendering: O(visible_cards) per frame
- Camera updates: O(1)

**Optimization Opportunities:**
- Frustum culling (only render visible cards)
- Level-of-detail (simplified rendering when zoomed out)
- Text atlas caching (render cards to textures)
- Spatial indexing (quadtree for fast lookups)

## Adding Content Programmatically

You can add cards via the I/O contract:

```rust
// Request to create a card
const REQUEST_CREATE_CARD: u32 = 10;

requests[0] = REQUEST_CREATE_CARD;
requests[1] = x.to_bits(); // World position
requests[2] = y.to_bits();
requests[3] = width.to_bits();
requests[4] = height.to_bits();

// Then write title and content to file_io buffer
// GPU will read and create the card
```

## Extending the System

### Adding Card Types

Modify the `Card` struct to include a `card_type` field:

```wgsl
const CARD_TYPE_TEXT: u32 = 0;
const CARD_TYPE_CODE: u32 = 1;
const CARD_TYPE_IMAGE: u32 = 2;
const CARD_TYPE_LINK: u32 = 3;

struct Card {
    // ... existing fields
    card_type: u32,
}
```

Then specialize rendering based on type.

### Adding Connections

Draw lines between related cards:

```wgsl
struct Connection {
    from_card: u32,
    to_card: u32,
    color: u32,
    style: u32, // Solid, dashed, etc.
}
```

Render in a separate pass between cards and text.

### Adding Search

Parallel search across all card content:

```wgsl
@compute @workgroup_size(256)
fn search_cards(
    @builtin(global_invocation_id) gid: vec3<u32>
) {
    let card_idx = gid.x;
    if (card_idx >= state.card_count) { return; }
    
    // Search this card's content
    // Write results to search_results buffer
}
```

## Next Steps

Once basic map works:

1. **Add card editing** - Double-click to edit content
2. **Implement search** - Ctrl+F to find text
3. **Add connections** - Link related cards
4. **Save/load** - Persist map to disk
5. **Import code** - Auto-create cards from .rs/.wgsl files
6. **Minimap** - Overview in corner
7. **Multiple maps** - Switch between projects
8. **Collaboration** - Multiple users on same map

## Troubleshooting

**Cards don't appear:**
- Check state buffer size (needs 20MB)
- Verify card_count > 0 in init
- Check camera is at (0,0) initially

**Can't drag cards:**
- Verify mouse events are being written
- Check event format matches expected
- Ensure dragging_card is set on mouse down

**Grid is invisible:**
- Check grid_visible flag
- Verify grid pipeline is rendering
- Adjust grid color if background is similar

**Text doesn't render:**
- Ensure font atlas texture exists
- Check content buffer has data
- Verify character count calculation

## Philosophy

The infinite map isn't just a canvas - it's a new way to think about code organization:

- **Spatial memory** - You remember where things are
- **Visual overview** - See relationships at a glance
- **No hierarchy** - Flat structure, organize by proximity
- **Infinite space** - Never run out of room
- **GPU-native** - Impossible on CPU

This is the foundation for visual programming on GPU.

---

**The CPU is frozen. The map is infinite. Your code lives in space.**
