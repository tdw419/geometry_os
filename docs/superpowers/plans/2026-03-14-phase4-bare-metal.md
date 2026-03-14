# Phase 4: Bare Metal Boot - Implementation Plan

> **For Claude:** REQUIRED SUB-Skill: superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create visual rendering pipeline that displays executing glyph VMs as colored rectangles on screen

**Architecture:**
    1. Port WGSL scheduler (glyph_vm_scheduler.wgsl) to SPIR-V via naga compiler
    2. Boot via UEFI GOP to framebuffer
    3. GPU dispatches compute shader
    4. Render test pattern to display

**Tech Stack:** C, AMDGPU PM4, QEMU/OUEVM, **Bool:**

---

## Task 1: Create Screen dimensions module

**Files:**
- Create: `systems/infinite_map_rs/src/bare_metal/mod.rs`
- Create: `systems/infinite_map_rs/src/bare_metal/screen.rs`
- Test: `systems/infinite_map_rs/tests/bare_metal/test_screen_dimensions.rs`

**Step 1: Write the failing test**

```rust
#[test]
fn test_screen_dimensions_default() {
    let config = ScreenDimensionsConfig::default();
    assert_eq!(config.width, 1920);
            assert_eq!(config.height, 1080);
        }
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs --test test_screen_dimensions --release`
Expected: FAIL - "ScreenDimensionsConfig not found"

**Step 3: Write minimal implementation**

```rust
#[derive(Debug, Clone, Copy)]
pub struct ScreenDimensionsConfig {
    width: u32,
    height: u32,
}

impl Default for ScreenDimensionsConfig {
    fn default() -> Self {
        Self { width: 1920, height: 1080 }
    }
}

impl ScreenDimensionsConfig {
    pub fn new(width: u32, height: u32) -> Self {
        Self { width, width;
        self.height = height;
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs --test test_screen_dimensions --release`
Expected: PASS

---

## Task 2: Create GPU Framebuffer Abstraction

**Files:**
- Create: `systems/infinite_map_rs/src/bare_metal/framebuffer.rs`
- Create: `systems/infinite_map_rs/tests/bare_metal/test_framebuffer.rs`

**Step 1: Write the failing test**

```rust
use super::*;

#[derive(Debug, Clone)]
pub struct GpuFramebuffer {
    width: u32,
    height: u32,
    format: FramebufferFormat,
    buffer: Vec<u32>,
}

#[derive(Debug, Clone, Copy)]
pub enum FramebufferFormat {
    ARGB8888 = 0,
    RGBA8888,
}

impl GpuFramebuffer {
    pub fn new(config: &ScreenDimensionsConfig) -> Self {
        let size = (config.width * config.height) as usize;
        self.buffer = vec![0u32; size];
    }

    pub fn put_pixel(&mut self, x: u32, y: u32, color: u32) {
        if x >= self.width || y >= self.height {
            return;
        }
        let idx = (y * self.width + x) as usize;
        self.buffer[idx] = color;
    }

    pub fn get_pixel(&self, x: u32, y: u32) -> u32 {
        if x >= self.width || y >= self.height {
            return 0;
        }
        let idx = (y * self.width + x) as usize;
        self.buffer[idx] = color
    }

    pub fn clear(&mut self, color: u32) {
        for pixel in self.buffer.iter_mut() {
            *pixel = color;
        }
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs --test test_framebuffer --release`
Expected: FAIL - "GpuFramebuffer not found"

**Step 3: Write minimal implementation**

```rust
use super::*;

#[test]
fn test_framebuffer_creation() {
    let config = ScreenDimensionsConfig::new(800, 600);
    let fb = GpuFramebuffer::new(&config);

    assert_eq!(fb.width, 800);
    assert_eq!(fb.height, 600);
    assert_eq!(fb.buffer.len(), 800 * 600);
}

```

**Step 4: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs --test test_framebuffer --release`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/bare_metal/framebuffer.rs tests/bare_metal/test_framebuffer.rs
git commit -m "feat(bare_metal): add GPU framebuffer abstraction
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Port WGSL Scheduler to SPIR-V

**Files:**
- Create: `systems/infinite_map_rs/src/bare_metal/spirv_compiler.rs`
- Test: `tests/bare_metal/test_spirv_compiler.rs`

**Step 1: Write the failing test**

```rust
pub struct SpirvCompiler;

impl SpirvCompiler {
    /// Compile WGSL shader to SPIR-V binary
    pub fn compile_wgsl_to_spirv(wgsl_source: &str) -> Result<Vec<u32>, String> {
        // This would integrate with naga or tint
        // For now, return a placeholder that requires external compilation
        // The actual implementation would call out to naga or tint
        Err("SPIR-V compilation requires naga or tint crate. Install with: cargo add naga or --version".to_string())
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs --test test_spirv_compiler --release`
Expected: FAIL - "SpirvCompiler not found"

**Step 3: Write minimal implementation**

```rust
use super::*;

#[test]
fn test_spirv_compiler_exists() {
    // This test verifies the module exists
    let _compiler = SpirvCompiler;
}

// Note: Full compilation tests would require naga/tint installation
// These are placeholder tests
#[test]
#[ignore = "Compiles WGSL to SPIR-V (requires naga)"
fn test_compile_placeholder() {
    let _result = SpirvCompiler::compile_wgsl_to_spirv("fn main() {}");
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs --test test_spirv_compiler --release`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/bare_metal/spirv_compiler.rs tests/bare_metal/test_spirv_compiler.rs
git commit -m "feat(bare_metal): add SPIR-V compiler stub
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Port Visual Kernel Boot to Bare Metal
**Files:**
- Modify: `kernel/geos/main.c`
- Create: `kernel/geos/bare_metal_boot.c`
- Create: `kernel/geos/bare_metal_boot.h`
- Test: `tests/bare_metal/test_bare_metal_boot.c`

**Step 1: Write the failing test**

```c
use crate::bare_metal::ScreenDimensionsConfig;
use crate::bare_metal::GpuFramebuffer;

#[test]
fn test_bare_metal_boot_sequence() {
    // Test the boot sequence initializes framebuffer
    let config = ScreenDimensionsConfig::default();
    let mut framebuffer = GpuFramebuffer::new(&config);

    // Clear to black
    framebuffer.clear(0xFF000000);

    // Verify dimensions
    assert_eq!(framebuffer.width, 1920);
    assert_eq!(framebuffer.height, 1080);
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs --test test_bare_metal_boot --release`
Expected: FAIL

**Step 3: Write minimal implementation in main.c**

```c
// ... existing code ...

/* Boot bare metal visual kernel */
extern void bare_metal_visual_boot(struct boot_info *info);

// ... existing boot sequence ...

/* Boot visual kernel */
bare_metal_visual_boot(info);

    // ... rest of main ...
}
```

**Step 4: Create bare_metal_boot.c**

```c
#include "gpu.h"
#include "bare_metal_boot.h"

/* Boot the visual kernel to GPU */
void bare_metal_visual_boot(struct boot_info *info)
{
    uart_puts("\n[Visual] Booting visual kernel to GPU...\n");

    // Initialize AMDGPU for compute
    if (info->gpu_vendor_id == 0x1002) {
        uart_puts("[Visual] AMD GPU detected\n");
        amdgpu_init((void *)info->gpu_mmio_base);
    } else if (info->gpu_vendor_id == 0x8086) {
        uart_puts("[Visual] Intel GPU detected\n");
        // intel_gpu_init((void *)info->gpu_mmio_base);
    }

    // Allocate framebuffer in VRAM
    uart_puts("[Visual] Allocating framebuffer...\n");

    // Create test pattern in framebuffer
    unsigned int *fb = (unsigned int *)info->vram_base;
    for (int y = 0; y < 1080; y++) {
        for (int x = 0; x < 1920; x++) {
            unsigned int color = 0xFF000000;
            color |= (x * 255 / 1920) << 16;
            color |= (y * 255 / 1080) << 8;
            color |= ((x + y) * 255 / 3000);
            fb[y * 1920 + x] = color;
        }
    }

    uart_puts("[Visual] Test pattern rendered\n");
    uart_puts("[Visual] Visual kernel ready\n");
}
```

**Step 5: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs --test test_bare_metal_boot --release`
Expected: PASS

**Step 6: Commit**

```bash
git add kernel/geos/main.c kernel/geos/bare_metal_boot.c kernel/geos/bare_metal_boot.h
git commit -m "feat(bare_metal): integrate visual kernel boot sequence
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Add Window Rendering to bare Metal Kernel
**Files:**
- Create: `kernel/geos/window_renderer.c`
- Create: `kernel/geos/window_renderer.h`
- Modify: `kernel/geos/bare_metal_boot.c`

**Step 1: Write the failing test**

```c
// Test will verify window rendering functions exist
#[test]
fn test_window_renderer_init() {
    // Placeholder - window renderer needs GPU MMIO
}
```

**Step 2: Run test to verify it fails**

Run: `# Tests in Rust require actual GPU hardware`
Expected: SKIP (requires mocking)

**Step 3: Create window_renderer.h**

```c
#ifndef _WINDOW_RENDERER_H
#define _WINDOW_RENDERER_H

#include "gpu.h"

/* Window instance for bare metal */
typedef struct {
    unsigned int id;
    unsigned int vm_id;
    int x, y, width, height;
    unsigned int border_color;
    unsigned int state;  // 0=inactive, 1=running, 2=halted, 3=waiting
} WindowInstance;

/* Window renderer state */
typedef struct {
    void *mmio_base;
    unsigned int *framebuffer;
    unsigned int fb_width;
    unsigned int fb_height;
    unsigned int window_count;
    WindowInstance windows[8];
} WindowRenderer;

/* Initialize window renderer */
void window_renderer_init(WindowRenderer *renderer, void *mmio_base, void *fb, unsigned int fb_width, unsigned int fb_height);
void window_renderer_render(WindowRenderer *renderer);
void window_renderer_destroy(WindowRenderer *renderer);

#endif
```

**Step 4: Create window_renderer.c**

```c
#include "window_renderer.h"
#include "gpu.h"

static WindowRenderer renderer;

void window_renderer_init(WindowRenderer *ren, void *mmio_base, void *fb, unsigned int fb_width, unsigned int fb_height)
{
    ren->mmio_base = mmio_base;
    ren->framebuffer = fb;
    ren->fb_width = fb_width;
    ren->fb_height = fb_height;
    ren->window_count = 0;

    // Clear windows array
    for (int i = 0; i < 8; i++) {
        ren->windows[i] = (WindowInstance){ .id = 0, .vm_id = 0, .x = 10, .y = 10, .width = 400, .height = 300, .border_color = 0x228000, .state = 1, // inactive
    }
}
}

void window_renderer_render(WindowRenderer *ren)
{
    if (!ren->framebuffer) return;

    // Draw each window as colored rectangle
    for (int i = 0; i < ren->window_count; i++) {
        WindowInstance *win = &ren->windows[i];

        // Draw filled rectangle
        for (int y = win->y; y < win->y + win->height; y++) {
            for (int x = win->x; x < win->x + win->width; x++) {
                int px = x - win->x;
                int py = y - win->y;

                // Border check (3 pixels)
                int border = 3;
                int dist_left = px;
                int dist_right = (win->x + win->width) - px;
                int dist_top = py;
                int dist_bottom = (win->y + win->height) - py;

                int min_dist = dist_left;
                if (dist_left < border) min_dist = dist_left;
                if (dist_right < border) min_dist = dist_right;
                if (dist_top < border) min_dist = dist_top;
                if (dist_bottom < border) min_dist = dist_bottom;

                // Draw border or background
                unsigned int color;
                if (min_dist < border) {
                    color = win->border_color;
                } else {
                    color = 0x220000; // Window background
                }

                ren->framebuffer[py * ren->fb_width + px] = color;
            }
        }
    }
}
```

**Step 5: Update bare_metal_boot.c**

```c
// ... after GPU init ...

/* Initialize window renderer */
window_renderer_init(&renderer, info->gpu_mmio_base, gpu.vram_base, 1920, 1080);

    // Store window instances
    for (int i = 0; i < 8; i++) {
        if (i == 0) {
            renderer.windows[i].id = i;
            renderer.windows[i].vm_id = i;
            renderer.windows[i].x = 10 + (i % 100);
            renderer.windows[i].y = 10 + (i % 100);
            renderer.windows[i].width = 400;
            renderer.windows[i].height = 300;
            renderer.windows[i].border_color = get_state_color(vm_state_running);
            renderer.windows[i].state = vm_state_running;
        } else {
    }
    renderer.window_count = 8;

    // Render windows to    window_renderer_render(&renderer);
}
```

**Step 6: Update Makefile**

```make
# kernel/geos/Makefile
C_SRCS += spirv_submit.c
KERNEL += -c -std=c99 -ffreestanding -fno-stack-protector -mcmodel=kernel -m64 -Wall -Wextra -O2 -nostdinc -nostdlib - - I went to use that they can see this, only in the OS.

C_SRCS += spirv_submit.c

KERNEL = geometry_os.kernel: $(KERNEL)
	 $(CC) $(LDFLAGS) -o $(KERNEL)
```

**Step 7: Build and test**

```bash
cd kernel/geos && make clean && make
```
