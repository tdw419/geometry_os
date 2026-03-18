# GVPIE Quick Start Guide
## From Zero to Typing in 30 Minutes

This guide gets you from the frozen bootstrap to a working editor as fast as possible.

---

## Prerequisites

- Rust 1.75+ installed
- GPU with WebGPU support
- Clone of gvpie-bootstrap repository

---

## Step 1: Replace the Shaders (5 min)

```bash
cd gvpie-bootstrap

# Backup existing shaders
mv shaders/editor_compute.wgsl shaders/editor_compute.wgsl.old
mv shaders/editor_render.wgsl shaders/editor_render.wgsl.old

# Copy new shaders
cp ../text_buffer.wgsl shaders/editor_compute.wgsl
cp ../text_render.wgsl shaders/editor_render.wgsl
```

---

## Step 2: Update Rust Bootstrap (15 min)

### 2.1: Add Uniform Buffer

In `src/main.rs`, add uniform buffer creation after your other buffers:

```rust
// Add uniform structure
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct RenderUniforms {
    time: f32,
    viewport_width: f32,
    viewport_height: f32,
    _padding: f32,
}

// Create uniform buffer
let uniform_buffer = device.create_buffer(&wgpu::BufferDescriptor {
    label: Some("Render Uniforms"),
    size: std::mem::size_of::<RenderUniforms>() as u64,
    usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
    mapped_at_creation: false,
});
```

### 2.2: Update Event Format

Find your keyboard event handler and update it:

```rust
use winit::event::{WindowEvent, ElementState, KeyboardInput};

// In your event loop:
WindowEvent::KeyboardInput { input, .. } => {
    let mut events_data = [0u32; 1024];
    
    match input.state {
        ElementState::Pressed => {
            if let Some(keycode) = input.virtual_keycode {
                match keycode {
                    VirtualKeyCode::Back => {
                        events_data[0] = 2; // Special key
                        events_data[1] = 8; // Backspace
                        events_data[2] = 0; // No modifiers (TODO)
                    }
                    VirtualKeyCode::Delete => {
                        events_data[0] = 2;
                        events_data[1] = 127;
                        events_data[2] = 0;
                    }
                    VirtualKeyCode::Left => {
                        events_data[0] = 2;
                        events_data[1] = 37;
                        events_data[2] = 0;
                    }
                    VirtualKeyCode::Right => {
                        events_data[0] = 2;
                        events_data[1] = 39;
                        events_data[2] = 0;
                    }
                    VirtualKeyCode::Up => {
                        events_data[0] = 2;
                        events_data[1] = 38;
                        events_data[2] = 0;
                    }
                    VirtualKeyCode::Down => {
                        events_data[0] = 2;
                        events_data[1] = 40;
                        events_data[2] = 0;
                    }
                    VirtualKeyCode::Home => {
                        events_data[0] = 2;
                        events_data[1] = 36;
                        events_data[2] = 0;
                    }
                    VirtualKeyCode::End => {
                        events_data[0] = 2;
                        events_data[1] = 35;
                        events_data[2] = 0;
                    }
                    _ => {}
                }
            }
        }
        _ => {}
    }
    
    // For character input, add ReceivedCharacter handler:
    WindowEvent::ReceivedCharacter(ch) => {
        if !ch.is_control() {
            events_data[0] = 1; // Character input
            events_data[1] = ch as u32;
            events_data[2] = 0;
        }
    }
    
    // Write to events buffer
    queue.write_buffer(&events_buffer, 0, bytemuck::cast_slice(&events_data));
}
```

### 2.3: Update Uniforms Each Frame

In your render loop, before dispatching compute:

```rust
let start_time = std::time::Instant::now();

// ... later in render loop:
let elapsed = start_time.elapsed().as_secs_f32();
let uniforms = RenderUniforms {
    time: elapsed,
    viewport_width: window_size.width as f32,
    viewport_height: window_size.height as f32,
    _padding: 0.0,
};

queue.write_buffer(&uniform_buffer, 0, bytemuck::bytes_of(&uniforms));
```

---

## Step 3: Create Font Atlas (10 min)

### Option A: Simple Placeholder (Fastest)

Generate a basic ASCII font atlas as placeholder:

```rust
fn create_font_texture(device: &wgpu::Device, queue: &wgpu::Queue) -> wgpu::Texture {
    let width = 144u32;  // 16 * 9px
    let height = 256u32; // 16 * 16px
    
    let texture = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Font Atlas"),
        size: wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Unorm,
        usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
        view_formats: &[],
    });
    
    // Create white pixels for now (will show blocks)
    let pixels = vec![255u8; (width * height * 4) as usize];
    queue.write_texture(
        wgpu::ImageCopyTexture {
            texture: &texture,
            mip_level: 0,
            origin: wgpu::Origin3d::ZERO,
            aspect: wgpu::TextureAspect::All,
        },
        &pixels,
        wgpu::ImageDataLayout {
            offset: 0,
            bytes_per_row: Some(width * 4),
            rows_per_image: Some(height),
        },
        wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        },
    );
    
    texture
}
```

You'll see white blocks instead of characters, but it proves the system works.

### Option B: Use fontdue (Better)

Add to `Cargo.toml`:
```toml
fontdue = "0.7"
```

Generate real font atlas:
```rust
use fontdue::Font;

fn create_font_atlas(device: &wgpu::Device, queue: &wgpu::Queue) -> wgpu::Texture {
    // Load embedded font
    let font = Font::from_bytes(
        include_bytes!("../fonts/FiraCode-Regular.ttf"),
        fontdue::FontSettings::default()
    ).unwrap();
    
    let atlas_size = 144 * 256; // 16x16 grid of 9x16 chars
    let mut atlas = vec![0u8; atlas_size * 4];
    
    // Rasterize each ASCII character
    for ch in 0..256u8 {
        let (metrics, bitmap) = font.rasterize(ch as char, 14.0);
        
        let grid_x = (ch % 16) as usize;
        let grid_y = (ch / 16) as usize;
        
        // Copy bitmap into atlas
        for y in 0..metrics.height.min(16) {
            for x in 0..metrics.width.min(9) {
                let atlas_x = grid_x * 9 + x;
                let atlas_y = grid_y * 16 + y;
                let atlas_idx = (atlas_y * 144 + atlas_x) * 4;
                let bitmap_idx = y * metrics.width + x;
                
                if bitmap_idx < bitmap.len() {
                    let alpha = bitmap[bitmap_idx];
                    atlas[atlas_idx..atlas_idx + 4].copy_from_slice(&[255, 255, 255, alpha]);
                }
            }
        }
    }
    
    // Create texture and upload
    // ... (same as Option A, but use `atlas` instead of white pixels)
}
```

---

## Step 4: Test Basic Functionality

```bash
cargo run --release
```

### Expected Behavior:

✅ Window opens (1920x1080 or your size)  
✅ You see a cursor (blinking cyan line)  
✅ Typing shows characters (or white blocks with placeholder font)  
✅ Arrow keys move cursor  
✅ Backspace deletes characters  

### Common Issues:

**No cursor visible**
- Check uniform buffer is bound to @binding(1)
- Verify time is updating each frame

**Characters don't appear**
- Check events buffer is being written
- Verify ReceivedCharacter handler exists

**Crashes on startup**
- Check GPU validation errors in console
- Verify buffer sizes match WGSL declarations

**Text appears but is garbled**
- Check font atlas dimensions (144x256)
- Verify texture format is Rgba8Unorm

---

## Step 5: Verify Everything Works

Open the editor and try these tests:

### Test 1: Basic Input
```
Type: Hello World
Result: Should see "Hello World" (or white blocks)
```

### Test 2: Navigation
```
Type: Line 1
Press: Enter
Type: Line 2
Press: Up arrow
Result: Cursor moves to Line 1
```

### Test 3: Editing
```
Type: Test
Press: Left, Left
Type: x
Result: "Texst"
Press: Backspace
Result: "Test"
```

### Test 4: Multi-line
```
Type: Line 1
Press: Enter
Type: Line 2
Press: Enter
Type: Line 3
Press: Up, Up, End
Result: Cursor at end of Line 1
```

---

## Step 6: Add Word Jumping (Bonus)

Copy the word jumping functions from `example_word_jumping.wgsl` into `shaders/editor_compute.wgsl`:

1. Copy the `is_word_char()` function
2. Copy `move_cursor_word_forward()` and `move_cursor_word_backward()`
3. Update `handle_special_key()` to check Ctrl modifier

Test:
```
Type: hello world test
Press: Ctrl+Right
Result: Cursor jumps to start of "world"
```

---

## Troubleshooting

### Compile Errors in WGSL

Check common issues:
- Array sizes match your buffer allocations
- All bindings have correct group/binding numbers
- Functions are defined before use

### Runtime Errors

Enable verbose logging:
```bash
RUST_LOG=info cargo run --release
```

Check for:
- Buffer size mismatches
- Shader compilation errors
- Binding validation failures

### Performance Issues

If slow:
- Reduce text buffer size temporarily
- Check GPU utilization
- Disable validation layers in release mode

---

## Next Steps

Once you have basic typing working:

1. **Implement file loading** (via I/O contract)
2. **Add selection** (Shift+arrows)
3. **Add undo/redo** (Ctrl+Z/Y)
4. **Improve font rendering** (better atlas)
5. **Add line numbers** (modify render shader)

See ROADMAP.md for the complete development plan.

---

## Success Checklist

- [ ] Shaders compile without errors
- [ ] Window opens with cursor visible
- [ ] Can type characters
- [ ] Can move cursor with arrows
- [ ] Can delete with backspace
- [ ] Multi-line text works
- [ ] Can navigate between lines

If all checked: **Congratulations!** You have a working GPU-sovereign text editor. Everything else is just features.

---

## Getting Unstuck

If you're stuck for more than 30 minutes:

1. Revert to your old shaders temporarily
2. Compare buffer layouts carefully
3. Check the integration guide
4. Enable all logging and validation
5. Test with minimal input first

Remember: The hard part is done. The text engine works. You're just connecting the pieces.

---

**The CPU is frozen. The GPU is sovereign. You're typing now.**
