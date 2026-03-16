# Substrate Viewer Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a `/substrate` HTTP endpoint and browser viewer to visualize the GPU texture in real-time.

**Architecture:** Daemon reads texture region via wgpu map_async, encodes to PNG, serves via HTTP. Browser uses WebGL to display and zoom/pan.

**Tech Stack:** Rust (wgpu, image crate), HTML5 Canvas, WebGL

---

## Task 1: Add image Crate Dependency

**Files:**
- Modify: `systems/infinite_map_rs/Cargo.toml`

**Step 1: Add image crate**

```toml
[dependencies]
# ... existing deps ...
image = "0.25"
```

**Step 2: Build to verify**

Run: `cargo build --release --bin gpu_dev_daemon`
Expected: Compiles with new dependency

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/Cargo.toml
git commit -m "feat(deps): add image crate for substrate PNG encoding"
```

---

## Task 2: Implement /substrate Endpoint

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add substrate read function**

Add before `handle_raw_request`:

```rust
fn read_substrate_region(
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    x: u32, y: u32, w: u32, h: u32,
) -> Option<Vec<u8>> {
    // Create staging buffer
    let bytes_per_pixel = 4u32;
    let buffer_size = (w * h * bytes_per_pixel) as u64;
    let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("substrate staging"),
        size: buffer_size,
        usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
        mapped_at_creation: false,
    });

    // Copy texture region to buffer
    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("substrate copy"),
    });

    // Clamp to texture bounds
    let tex_width = texture.width();
    let tex_height = texture.height();
    let clamped_w = w.min(tex_width.saturating_sub(x));
    let clamped_h = h.min(tex_height.saturating_sub(y));

    if clamped_w == 0 || clamped_h == 0 {
        return None;
    }

    encoder.copy_texture_to_buffer(
        wgpu::ImageCopyTexture {
            texture,
            mip_level: 0,
            origin: wgpu::Origin3d { x, y, z: 0 },
            aspect: wgpu::TextureAspect::All,
        },
        wgpu::ImageCopyBuffer {
            buffer: &staging_buffer,
            layout: wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(clamped_w * bytes_per_pixel),
                rows_per_image: Some(clamped_h),
            },
        },
        wgpu::Extent3d {
            width: clamped_w,
            height: clamped_h,
            depth_or_array_layers: 1,
        },
    );

    queue.submit(std::iter::once(encoder));

    // Map and read
    let buffer_slice = staging_buffer.slice(..);
    let (tx, rx) = std::sync::mpsc::channel();
    buffer_slice.map_async(wgpu::MapMode::Read, move |result| {
        tx.send(result).ok();
    });
    device.poll(wgpu::Maintain::Wait);

    if rx.recv().ok().flatten().is_none() {
        return None;
    }

    let data = buffer_slice.get_mapped_range().to_vec();
    Some(data)
}
```

**Step 2: Add endpoint handler in handle_raw_request**

After the `/status` handler, add:

```rust
    // GET /substrate - Return texture region as PNG
    if request_str.starts_with("GET /substrate") {
        // Parse query params: ?x=0&y=0&w=256&h=256
        let params: std::collections::HashMap<&str, u32> = request_str
            .split('?')
            .nth(1)
            .unwrap_or("")
            .split('&')
            .filter_map(|p| {
                let mut parts = p.split('=');
                let key = parts.next()?;
                let value = parts.next()?.parse().ok()?;
                Some((key, value))
            })
            .collect();

        let x = params.get("x").copied().unwrap_or(0);
        let y = params.get("y").copied().unwrap_or(0);
        let w = params.get("w").copied().unwrap_or(256).min(1024);
        let h = params.get("h").copied().unwrap_or(256).min(1024);

        let texture_guard = t_clone.read();
        let device_guard = d_clone.read();
        let queue_guard = q_clone.read();

        if let Some(data) = read_substrate_region(&texture_guard, &device_guard, &queue_guard, x, y, w, h) {
            // Encode to PNG
            let img = image::RgbaImage::from_raw(w, h, data).unwrap();
            let mut png_bytes = Vec::new();
            img.write_to(&mut std::io::Cursor::new(&mut png_bytes), image::ImageFormat::Png).ok();

            let response = format!(
                "HTTP/1.1 200 OK\r\nContent-Type: image/png\r\nContent-Length: {}\r\n\r\n",
                png_bytes.len()
            );
            let _ = stream.write_all(response.as_bytes());
            let _ = stream.write_all(&png_bytes);
        } else {
            let response = "HTTP/1.1 500 Internal Server Error\r\nContent-Type: text/plain\r\n\r\nFailed to read substrate";
            let _ = stream.write_all(response.as_bytes());
        }
        return;
    }
```

**Step 3: Build and test**

Run: `cargo build --release --bin gpu_dev_daemon`
Expected: Compiles

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(daemon): add /substrate endpoint for texture visualization"
```

---

## Task 3: Create Substrate Viewer Page

**Files:**
- Create: `systems/visual_shell/web/substrate.html`

**Step 1: Create viewer HTML**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Geometry OS - Substrate Viewer</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: #0a0a0a;
            color: #e0e0e0;
            font-family: 'JetBrains Mono', monospace;
            overflow: hidden;
        }
        #canvas {
            cursor: crosshair;
        }
        .controls {
            position: fixed;
            top: 10px;
            left: 10px;
            background: rgba(0,0,0,0.8);
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #333;
        }
        .controls button {
            background: #1a1a1a;
            border: 1px solid #00ff88;
            color: #00ff88;
            padding: 5px 10px;
            margin: 2px;
            cursor: pointer;
        }
        .controls button:hover { background: #00ff8833; }
        .info {
            position: fixed;
            bottom: 10px;
            left: 10px;
            background: rgba(0,0,0,0.8);
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #333;
            font-size: 12px;
        }
        .info span { color: #00ff88; }
    </style>
</head>
<body>
    <canvas id="canvas"></canvas>
    <div class="controls">
        <button onclick="zoomIn()">Zoom +</button>
        <button onclick="zoomOut()">Zoom -</button>
        <button onclick="resetView()">Reset</button>
        <button onclick="toggleRefresh()">Pause/Play</button>
    </div>
    <div class="info">
        <div>Position: <span id="pos">0, 0</span></div>
        <div>Zoom: <span id="zoom">1.0</span>x</div>
        <div>Address: <span id="addr">0x0000</span></div>
        <div>Value: <span id="value">0x00000000</span></div>
    </div>

    <script>
        const canvas = document.getElementById('canvas');
        const ctx = canvas.getContext('2d');
        const DAEMON_URL = 'http://127.0.0.1:8769';

        let zoom = 1.0;
        let offsetX = 0, offsetY = 0;
        let isDragging = false;
        let lastX, lastY;
        let refreshing = true;
        let regionSize = 512;

        function resize() {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            render();
        }

        async function fetchSubstrate() {
            const x = Math.max(0, Math.floor(offsetX));
            const y = Math.max(0, Math.floor(offsetY));
            const w = Math.min(regionSize, 4096 - x);
            const h = Math.min(regionSize, 4096 - y);

            try {
                const response = await fetch(`${DAEMON_URL}/substrate?x=${x}&y=${y}&w=${w}&h=${h}`);
                if (!response.ok) return null;
                const blob = await response.blob();
                return await createImageBitmap(blob);
            } catch (e) {
                console.error('Fetch error:', e);
                return null;
            }
        }

        async function render() {
            if (!refreshing) return;
            const img = await fetchSubstrate();
            if (img) {
                ctx.fillStyle = '#0a0a0a';
                ctx.fillRect(0, 0, canvas.width, canvas.height);
                ctx.imageSmoothingEnabled = false;
                const scaledW = img.width * zoom;
                const scaledH = img.height * zoom;
                ctx.drawImage(img, 0, 0, scaledW, scaledH);
            }
            document.getElementById('pos').textContent = `${Math.floor(offsetX)}, ${Math.floor(offsetY)}`;
            document.getElementById('zoom').textContent = zoom.toFixed(1);
        }

        function zoomIn() { zoom = Math.min(zoom * 1.5, 64); render(); }
        function zoomOut() { zoom = Math.max(zoom / 1.5, 0.1); render(); }
        function resetView() { zoom = 1; offsetX = 0; offsetY = 0; render(); }
        function toggleRefresh() { refreshing = !refreshing; if (refreshing) render(); }

        canvas.addEventListener('mousedown', e => {
            isDragging = true;
            lastX = e.clientX;
            lastY = e.clientY;
        });

        canvas.addEventListener('mousemove', e => {
            if (isDragging) {
                offsetX -= (e.clientX - lastX) / zoom;
                offsetY -= (e.clientY - lastY) / zoom;
                offsetX = Math.max(0, Math.min(4096 - regionSize, offsetX));
                offsetY = Math.max(0, Math.min(4096 - regionSize, offsetY));
                lastX = e.clientX;
                lastY = e.clientY;
                render();
            }

            // Update address/value on hover
            const canvasX = Math.floor(offsetX + e.clientX / zoom);
            const canvasY = Math.floor(offsetY + e.clientY / zoom);
            document.getElementById('addr').textContent = `0x${canvasX.toString(16).padStart(4, '0')}`;
        });

        canvas.addEventListener('mouseup', () => isDragging = false);
        canvas.addEventListener('mouseleave', () => isDragging = false);

        canvas.addEventListener('wheel', e => {
            e.preventDefault();
            if (e.deltaY < 0) zoomIn();
            else zoomOut();
        });

        window.addEventListener('resize', resize);
        resize();

        // Auto-refresh loop
        setInterval(() => { if (refreshing) render(); }, 100);
    </script>
</body>
</html>
```

**Step 2: Test viewer**

1. Start daemon: `cargo run --release --bin gpu_dev_daemon`
2. Open: `file://systems/visual_shell/web/substrate.html`
3. Verify: Shows substrate texture

**Step 3: Commit**

```bash
git add systems/visual_shell/web/substrate.html
git commit -m "feat(visual): add substrate viewer page"
```

---

## Summary

### What This Delivers

1. **`/substrate` endpoint** - Read any region of the GPU texture as PNG
2. **Substrate Viewer** - Browser-based zoomable/pannable texture viewer
3. **Real-time updates** - 10fps refresh showing VM execution

### Estimated Effort

| Task | Time |
|------|------|
| Add image crate | 5 min |
| /substrate endpoint | 1-2 hours |
| Viewer page | 1 hour |
| Testing | 30 min |

**Total: 2.5-3.5 hours**
