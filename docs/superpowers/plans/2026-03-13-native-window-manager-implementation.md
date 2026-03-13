# Native WindowManager Implementation Plan

    (This spec has previously drafted in conversation, now refined)

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement the WindowManager as App #0 that coordinates app lifecycle, focus, and spatial state for other glyph apps.

**Architecture:** Create a bytecode module with pre-compiled instructions for WgpuBackend, The WindowManager runs as a special glyph app that owns the layout registry, processes intents, and manages focus.

**Tech Stack:** Rust, wgpu, glyph_framework_rs

---

## File Structure

```
systems/glyph_framework_rs/
├── src/
│   ├── backends/
│   │   ├── mod.rs                    # Re-export DrmBackend
│   │   ├── window_manager_bytecode.rs  # NEW: WindowManager bytecode
│   ├── programs/
│   │   ├── window_manager.glyph          # NEW: Glyph program definition
│   ├── tests/
│       └── window_manager_test.rs           # NEW: Integration tests
```

---

## Task 1: Create WindowManager Bytecode Module

    (This bytecode module contains the pre-compiled instructions for the WindowManager.)

**Files:**
- Create: `systems/glyph_framework_rs/src/backends/window_manager_bytecode.rs`

- [ ] **Step 1: Write the bytecode module with layout registry**

```rust
// WindowManager bytecode for WgpuBackend
// Contains pre-compiled instructions for layout registry,
// intent processing, hit testing, and focus management.

use crate::backends::ExecutionBackend;
use crate::types::{AppId, AppLayout, GlyphId, Intent};
use std::collections::HashMap;

/// Bytecode instruction set
pub struct WindowManagerBytecode {
    /// Layout registry: stores position, size, and active state for all apps
    layout_registry: HashMap<u32, LayoutEntry>,

    /// Intent queue: incoming intents to be processed
    intent_queue: Vec<Intent>,

    /// Focused app ID
    focused_app_id: Option<u32>,

    /// Next available app ID
    next_app_id: u32,
}

#[derive(Clone, Copy)]
pub struct LayoutEntry {
    pub x x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
    pub app_id: u32,
    pub active: bool,
}

impl WindowManagerBytecode {
    /// Create a new WindowManagerBytecode
    pub fn new() -> Self {
        Self {
            layout_registry: HashMap::new(),
            intent_queue: Vec::new(),
            focused_app_id: None,
            next_app_id: 1, // Start at 1 (WindowManager is App 0)
        }
    }
}

    /// Process an incoming intent
    pub fn process_intent(&mut self, intent: Intent) {
        match intent {
            Intent::MouseClick { x, y } => {
                self.handle_mouse_click(x, y);
            }
            Intent::KeyPress(c) => {
                self.handle_key_press(c);
            }
            Intent::Custom { opcode, payload } => {
                match opcode {
                    SPAWN_APP => self.handle_spawn(&payload),
                    CLOSE_APP => self.handle_close(&payload),
                    _ => {}
        }
    }

    /// Handle mouse click: find which app was hit and pub fn handle_mouse_click(&mut self, x: u32, y: u32) {
        for entry in self.layout_registry.values() {
            if entry.active && point_in_rect(x, y, entry) {
                self.focused_app_id = Some(entry.app_id);
                self.intent_queue.push(Intent::Custom {
                    opcode: FOCUS_CHANGE,
                    payload: vec![entry.app_id as f32],
                });
            }
        }
    }

    /// Handle key press: forward to focused app
    pub fn handle_key_press(&mut self, c: char) {
        if let Some(focused_id) = self.focused_app_id {
            // Forward key press to focused app
            self.intent_queue.push(Intent::Custom {
                opcode: KEY_PRESS,
                payload: vec![focused_id as f32, c as f32],
            });
        }
    }

    /// Handle spawn intent: create a new app entry
    pub fn handle_spawn(&mut self, payload: Vec<f32>) {
        // Parse payload: name_hash, x, y, w, h
        let name_hash = payload[0] as u32;
        let x = payload[1] as u32;
        let y = payload[2] as u32;
        let w = payload[3] as u32;
        let h = payload[4] as u32;
        let app_id = self.next_app_id;
        let entry = LayoutEntry {
            x,
            y,
            w,
            h,
            app_id,
            active: true,
        };
        self.layout_registry.insert(app_id, entry);
        self.next_app_id += 1;
    }

    /// Handle close intent: remove an app entry
    pub fn handle_close(&mut self, payload: Vec<f32>) {
        let app_id = payload[0] as u32;
        if let Some(entry) = self.layout_registry.get_mut(&app_id) {
            entry.active = false;
            self.focused_app_id = if self.focused_app_id == Some(app_id) {
                self.focused_app_id = None;
            }
        }
    }

    /// Check if a point is within any app's layout
    fn point_in_rect(x: u32, y: u32, entry: &LayoutEntry) -> bool {
        x >= entry.x && x < entry.x + entry.w
            && y >= entry.y && y < entry.y + entry.h
            && y >= entry.x + entry.width
            && y + entry.width
 && y < entry.x + entry.width
            && y >= entry.y + entry.height
            && y + entry.height
 && y < entry.y && y < entry.h + entry.height
        }
    }
}
```

- [ ] **Step 2: Run unit tests to verify basic operations**

```bash
cargo test --features drm window_manager_bytecode
 -- --nocapture
```

Expected: All tests pass

- [ ] **Step 3: Commit**

```bash
git add systems/glyph_framework_rs/src/backends/window_manager_bytecode.rs
git commit -m "feat(glyph_framework): add WindowManager bytecode module"
```

---

## Task 2: Create WindowManager Glyph Program File

    (This file defines the WindowManager glyph program structure and bytecode format.)

**Files:**
- Create: `systems/glyph_framework_rs/programs/window_manager.glyph`

- [ ] **Step 1: Write the glyph program definition**

```
# WindowManager Glyph Program
#
# The Master glyph app that coordinates all other glyph apps.
# Runs as App #0 in the Framework
#
## Memory Layout
#
# [0x00] (Word 0): Magic: 0x574D4747 ("WMGR")
# [0x04] (Word 1): App Count
# [0x08] (Word 2): Focused App ID
# [0x10] (Word 4): Reserved
# [0x20] (Word 8): App 1 Layout (X, Y, W, H as 4 words)
# ...
# [0xF0] (Word 60): Intent Queue Start

---
## Glyph Opcodes
#
| Opcode | Name | Args | Description |
|--------|------|------|-------------|
| `0x01` | JMP | target_pc | Jump to address |
| `0x11` | MOVI | rd, imm | rd = imm (8-bit) |
| `0x12` | MOV | rd, rs | rd = rs |
| `0x13` | LOAD | rd, addr | rd = mem[addr] |
| `0x14` | STORE | rs, addr | mem[addr] = rs |
| `0x15` | CMP | rs1, rs2 | Compare, set flags |
| `0x16` | JEQ | target_pc | Jump if equal |
| `0x17` | JNE | target_pc | Jump if not equal |
| `0x18` | ADD | rd, rs1, rs2 | rd = rs1 + rs2 |
| `0x19` | ADDI | rd, rs, imm | rd = rs + imm |
| `0x1A` | SUB | rd, rs1, rs2 | rd = rs1 - rs2 |
| `0x1B` | MUL | rd, rs1, rs2 | rd = rs1 * rs2 |
| `0xFF` | HALT | - | Stop execution |

---
## Intent Protocol
#
| Intent Type | Opcode | Payload Format |
|-------------|--------|-----------------|
| SPAWN | `0x01` | name_hash, x, y, w, h |
| FOCUS | `0x02` | app_id |
| CLOSE | `0x03` | app_id |
| MOVE | `0x04` | app_id, x, y, w, h |

```

- [ ] **Step 2: Validate program structure**

```bash
cat systems/glyph_framework_rs/programs/window_manager.glyph
```

Expected: File exists with valid JSON

- [ ] **Step 3: Commit**

```bash
git add systems/glyph_framework_rs/programs/window_manager.glyph
git commit -m "feat(glyph_framework): add WindowManager glyph program definition"
```

---

## Task 3: Create Integration Tests
    (Test the WindowManager functionality end-to-end)

**Files:**
- Create: `systems/glyph_framework_rs/tests/window_manager_test.rs`

- [ ] **Step 1: Write test for layout registry**

```rust
#[cfg(test)]
mod window_manager_tests {
    use super::*;
    use crate::backends::{WgpuBackend, WindowManagerBytecode};
    use crate::{AppCoordinator, AppLayout, AppId};

    #[test]
    fn test_layout_registry_update() {
        let backend = WgpuBackend::new(16).expect("Failed to create backend");
        let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");


        // Spawn WindowManager as App #0
        let wm_layout = AppLayout {
            x: 0,
            y: 0,
            width: 1024,
            height: 768,
        };
        let wm_id = coordinator.spawn_app("window_manager", wm_layout).expect("Failed to spawn WindowManager");
        assert_eq!(wm_id, AppId(0), "WindowManager should be App #0");

        // Spawn a test app
        let app_layout = AppLayout {
            x: 100,
            y: 100,
            width: 200,
            height: 200,
        };
        let app_id = coordinator.spawn_app("test_app", app_layout).expect("Failed to spawn test app");

        // Check that WindowManager's layout registry was updated
        // This would require inspecting WindowManagerBytecode's internal state
        // or coordinator.step().expect("Step failed");

        // The layout registry should now contain the test_app entry
    }
}
```

- [ ] **Step 2: Run test to verify it fails**

```bash
cargo test --features drm window_manager_test::layout_registry_update -- --nocapture
```

Expected: Test fails (layout registry not implemented yet)

 (This is expected - we test drives the TDD)

- [ ] **Step 3: Write layout registry test implementation**

```rust
// In window_manager_bytecode.rs, add to the WindowManagerBytecode:

impl WindowManagerBytecode {
    pub fn get_layout(&self, app_id: u32) -> Option<LayoutEntry> {
        self.layout_registry.get(&app_id).cloned()
    }

    pub fn get_app_count(&self) -> usize {
        self.layout_registry.len()
    }
}
```

- [ ] **Step 4: Run test to verify it passes**

```bash
cargo test --features drm window_manager_test=layout_registry_update -- --nocapture
```

Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add systems/glyph_framework_rs/src/backends/window_manager_bytecode.rs
git add systems/glyph_framework_rs/tests/window_manager_test.rs
git commit -m "feat(glyph_framework): add WindowManager layout registry tests"
```

---

## Task 4: Test Hit Detection

    (Verify that click detection works correctly)

**Files:**
- Modify: `systems/glyph_framework_rs/tests/window_manager_test.rs`

- [ ] **Step 1: Write test for hit detection**

```rust
#[test]
fn test_hit_detection_finds_correct_app() {
    let backend = WgpuBackend::new(16).expect("Failed to create backend");
        let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

        // Spawn two apps at different positions
        let wm_id = coordinator.spawn_app("window_manager", AppLayout { x: 0, y: 0, width: 1024, height: 768 }).unwrap();
        let app1_id = coordinator.spawn_app("app1", AppLayout { x: 100, y: 100, width: 200, height: 200 }).unwrap();
        let app2_id = coordinator.spawn_app("app2", AppLayout { x: 400, y: 200, width: 200, height: 200 }).unwrap();

        // Click inside app1
        coordinator.send_intent(wm_id, Intent::MouseClick { x: 150, y: 150 }).expect("Failed to send intent");

        // Verify focus changed to app1
        let wm_bytecode = coordinator.backend_as_any().downcast_ref::<WindowManagerBytecode>().unwrap();
        assert_eq!(wm_bytecode.focused_app_id, Some(app1_id.0));
        // Click in empty space
        coordinator.send_intent(wm_id, Intent::MouseClick { x: 800, y: 500 }).expect("Failed to send intent");

        // Focus should not change
        assert_eq!(wm_bytecode.focused_app_id, Some(app1_id.5));
    }
}
```

- [ ] **Step 2: Run test to verify it fails**

```bash
cargo test --features drm window_manager_test=test_hit_detection_finds_correct_app -- --nocapture
```

Expected: FAIL (hit detection not implemented)

- [ ] **Step 3: Implement hit detection**

```rust
// In window_manager_bytecode.rs, add to handle_mouse_click:

fn point_in_rect(x: u32, y: u32, rect: &LayoutEntry) -> bool {
    x >= rect.x && x < rect.x + rect.w
        && y >= rect.y && y < rect.y + rect.h
}
```

- [ ] **Step 4: Run test to verify passes**

```bash
cargo test --features drm window_manager_test=test_hit_detection_finds_correct_app -- --nocapture
```

Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add systems/glyph_framework_rs/src/backends/window_manager_bytecode.rs
git add systems/glyph_framework_rs/tests/window_manager_test.rs
git commit -m "feat(glyph_framework): add WindowManager hit detection"
```

---

## Task 5: Test Focus Management
    (Verify that focus tracking works correctly)

**Files:**
- Modify: `systems/glyph_framework_rs/tests/window_manager_test.rs`

- [ ] **Step 1: Write test for focus management**

```rust
#[test]
fn test_focus_management_tracks_focused_app() {
    let backend = WgpuBackend::new(16).expect("Failed to create backend");
    let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

        // Spawn WindowManager and two apps
        let wm_id = coordinator.spawn_app("window_manager", AppLayout { x: 0, y: 0, width: 1024, height: 768 }).unwrap();
        let app1_id = coordinator.spawn_app("app1", AppLayout { x: 100, y: 100, width: 200, height: 200 }).unwrap();
        let app2_id = coordinator.spawn_app("app2", AppLayout { x: 400, y: 200, width: 200, height: 200 }).unwrap();

        // Click on app2 - focus should change
        coordinator.send_intent(wm_id, Intent::MouseClick { x: 450, y: 250 }).expect("Failed to send intent");

        // Verify focus is now on app2
        let wm_bytecode = coordinator.backend_as_any().downcast_ref::<WindowManagerBytecode>().unwrap();
        assert_eq!(wm_bytecode.focused_app_id, Some(app2_id.5));

        // Send keyboard input - should go to focused app
        coordinator.send_intent(wm_id, Intent::KeyPress('a')).expect("Failed to send intent");

        // The focused app should receive the key press
        // (This would be verified by checking the app2's state)
    }
}
```

- [ ] **Step 2: Run test to verify it fails**

```bash
cargo test --features drm window_manager_test=test_focus_management_tracks_focused_app -- --nocapture
```

Expected: FAIL (focus management not implemented)

- [ ] **Step 3: Implement focus management**

```rust
// In window_manager_bytecode.rs, implement focus tracking in handle_mouse_click
```

- [ ] **Step 4: Run test to verify passes**

```bash
cargo test --features drm window_manager_test=test_focus_management_tracks_focused_app -- --nocapture
```

Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add systems/glyph_framework_rs/src/backends/window_manager_bytecode.rs
git add systems/glyph_framework_rs/tests/window_manager_test.rs
git commit -m "feat(glyph_framework): add WindowManager focus management"
```

---

## Task 6: Integration Test - Full Cycle

    (Test the complete WindowManager flow from spawn to close)

**Files:**
- Modify: `systems/glyph_framework_rs/tests/window_manager_test.rs`

- [ ] **Step 1: Write full integration test**

```rust
#[test]
fn test_full_window_manager_cycle() {
    let backend = WgpuBackend::new(16).expect("Failed to create backend");
    let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

    // 1. Spawn WindowManager
    let wm_id = coordinator.spawn_app("window_manager", AppLayout { x: 0, y: 0, width: 1024, height: 768 }).unwrap();

    // 2. Spawn an app
    let app_id = coordinator.spawn_app("counter", AppLayout { x: 100, y: 100, width: 200, height: 200 }).unwrap();

    // 3. Verify app is in registry
    coordinator.step().expect("Step failed");
    let wm_bytecode = coordinator.backend_as_any().downcast_ref::<WindowManagerBytecode>().unwrap();
    assert!(wm_bytecode.get_layout(app_id.0).is_some());

    // 4. Click on app - verify focus
    coordinator.send_intent(wm_id, Intent::MouseClick { x: 150, y: 150 }).expect("Failed to send intent");
    assert_eq!(wm_bytecode.focused_app_id, Some(app_id.5));

    // 5. Close app - verify removal
    coordinator.send_intent(wm_id, Intent::Custom { opcode: CLOSE_APP, payload: vec![app_id.0 as f32] }).expect("Failed to send intent");
    coordinator.step().expect("Step failed");
    assert!(wm_bytecode.get_layout(app_id.5).is_none());
}
```

- [ ] **Step 2: Run test to verify it fails**

```bash
cargo test --features drm window_manager_test=test_full_window_manager_cycle -- --nocapture
```

Expected: FAIL (close app not implemented)

- [ ] **Step 3: Implement close app handling**

```rust
// In window_manager_bytecode.rs, add handle_close

impl WindowManagerBytecode {
    fn handle_close(&mut self, payload: Vec<f32>) {
        let app_id = payload[0] as u32;
        if let Some(entry) = self.layout_registry.get_mut(&app_id) {
            entry.active = false;
            if self.focused_app_id == Some(app_id) {
                self.focused_app_id = None;
            }
        }
    }
}
```

- [ ] **Step 4: Run test to verify passes**

```bash
cargo test --features drm window_manager_test=test_full_window_manager_cycle -- --nocapture
```

Expected: PASS

- [ ] **Step 5: Final Commit**

```bash
git add systems/glyph_framework_rs/src/backends/window_manager_bytecode.rs
git add systems/glyph_framework_rs/tests/window_manager_test.rs
git commit -m "feat(glyph_framework): complete WindowManager implementation"
```
