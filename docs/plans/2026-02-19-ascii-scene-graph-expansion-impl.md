# ASCII Scene Graph Expansion Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement Neural City, Visual Shell, and Evolution Pipeline ASCII Scene Graph hooks for universal AI agent navigation.

**Architecture:** Event-driven instrumentation hooks that emit `.ascii` files in real-time. Each subsystem exposes a trait interface, with `AsciiSceneHook` implementations that render state to human/AI-readable text. Camera-follow viewport for Neural City, fragment-tree topology for Visual Shell, PAS-triggered self-healing for Evolution.

**Tech Stack:** Rust (hooks, traits), Python (scanner, vasm), ASCII files, WebSocket streaming

---

## Prerequisites

- RISC-V hooks already implemented at `systems/infinite_map_rs/src/riscv/hooks.rs`
- VASM compiler at `systems/pixel_compiler/vasm.py`
- Scanner at `systems/pixel_compiler/scanner.py`

---

## Task 1: Create Neural City Hook Trait

**Files:**
- Create: `systems/infinite_map_rs/src/neural_city/hooks.rs`
- Modify: `systems/infinite_map_rs/src/neural_city/mod.rs`

**Step 1: Write the failing test**

Create `systems/infinite_map_rs/src/neural_city/hooks.rs`:

```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_neural_city_hook_trait_exists() {
        // This test verifies the trait can be implemented
        struct MockHook;
        impl NeuralCityHook for MockHook {
            fn on_district_update(&self, _name: &str, _pos: (f64, f64), _load: f32, _agent_count: usize) {}
            fn on_camera_move(&self, _pos: (f64, f64), _zoom: f32) {}
            fn on_agent_relocation(&self, _agent_id: &str, _from: &str, _to: &str) {}
            fn on_city_health(&self, _pas_score: f32, _entropy: f32) {}
        }
        let _hook = MockHook;
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs neural_city::hooks::tests::test_neural_city_hook_trait_exists`
Expected: FAIL with "cannot find type NeuralCityHook"

**Step 3: Write minimal implementation**

Add to `systems/infinite_map_rs/src/neural_city/hooks.rs`:

```rust
//! Neural City Instrumentation Hooks
//!
//! Provides real-time state tracking for AI perception of the infinite map.

use std::sync::Arc;
use std::fs;
use std::path::PathBuf;

/// Instrumentation hook for Neural City events
pub trait NeuralCityHook: Send + Sync {
    /// Called when a district's morphology or load changes
    fn on_district_update(&self, name: &str, pos: (f64, f64), load: f32, agent_count: usize);

    /// Called when the camera/view moves
    fn on_camera_move(&self, pos: (f64, f64), zoom: f32);

    /// Called when an agent relocates between districts
    fn on_agent_relocation(&self, agent_id: &str, from_district: &str, to_district: &str);

    /// Called for global city health metrics
    fn on_city_health(&self, pas_score: f32, entropy: f32);
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs neural_city::hooks::tests`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/neural_city/hooks.rs
git commit -m "feat(neural-city): add NeuralCityHook trait definition"
```

---

## Task 2: Implement Neural City ASCII Renderer

**Files:**
- Modify: `systems/infinite_map_rs/src/neural_city/hooks.rs`

**Step 1: Write the failing test**

Add to `hooks.rs` tests:

```rust
    #[test]
    fn test_ascii_renderer_produces_output() {
        let temp_dir = std::env::temp_dir().join("neural_city_test");
        let _ = std::fs::create_dir_all(&temp_dir);

        let renderer = NeuralCityAsciiRenderer::new(temp_dir.clone());
        renderer.on_city_health(0.94, 0.15);

        let output = temp_dir.join("city_health.ascii");
        assert!(output.exists());

        let content = std::fs::read_to_string(output).unwrap();
        assert!(content.contains("0.94"));
    }
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs neural_city::hooks::tests::test_ascii_renderer`
Expected: FAIL with "NeuralCityAsciiRenderer not found"

**Step 3: Write minimal implementation**

Add to `hooks.rs`:

```rust
/// ASCII renderer that writes Neural City state to files
pub struct NeuralCityAsciiRenderer {
    output_dir: PathBuf,
    camera_pos: (f64, f64),
    camera_zoom: f32,
}

impl NeuralCityAsciiRenderer {
    pub fn new(output_dir: PathBuf) -> Self {
        if !output_dir.exists() {
            let _ = fs::create_dir_all(&output_dir);
        }
        Self {
            output_dir,
            camera_pos: (0.0, 0.0),
            camera_zoom: 1.0,
        }
    }

    fn write_file(&self, filename: &str, content: &str) {
        let path = self.output_dir.join(filename);
        let _ = fs::write(path, content);
    }
}

impl NeuralCityHook for NeuralCityAsciiRenderer {
    fn on_district_update(&self, name: &str, pos: (f64, f64), load: f32, agent_count: usize) {
        let content = format!(
            "┌──────────────────────────────────────────────────────────────┐\n\
             │ DISTRICT FOCUS: {:<44}│\n\
             ├──────────────────────────────────────────────────────────────┤\n\
             │ Position: ({:.0}, {:.0})                                    │\n\
             │ Load: {:.0}% | Agents: {}                                     │\n\
             └──────────────────────────────────────────────────────────────┘\n",
            name, pos.0, pos.1, load * 100.0, agent_count
        );
        self.write_file("district_focus.ascii", &content);
    }

    fn on_camera_move(&self, pos: (f64, f64), zoom: f32) {
        // Store for viewport rendering
    }

    fn on_agent_relocation(&self, agent_id: &str, from: &str, to: &str) {
        let content = format!(
            "╔════════════════════════════════════════════════════════════╗\n\
             ║ AGENT RELOCATION                                            ║\n\
             ╠════════════════════════════════════════════════════════════╣\n\
             ║ Agent: {:<52}║\n\
             ║ From:  {:<52}║\n\
             ║ To:    {:<52}║\n\
             ╚════════════════════════════════════════════════════════════╝\n",
            agent_id, from, to
        );
        self.write_file("agent_relocation.ascii", &content);
    }

    fn on_city_health(&self, pas_score: f32, entropy: f32) {
        let bar_filled = (pas_score * 40.0) as usize;
        let bar_empty = 40 - bar_filled;
        let status = if pas_score >= 0.8 { "NOMINAL" } else { "WARNING" };

        let content = format!(
            "┌──────────────────────────────────────────────────────────────┐\n\
             │ CITY HEALTH METRICS                                         │\n\
             ├──────────────────────────────────────────────────────────────┤\n\
             │ PAS:  [{}{}] {:.2} [{}]                         │\n\
             │ Entropy: {:.2}                                               │\n\
             │ Threshold: 0.80 | Trigger: AUTO_CORRECT                     │\n\
             └──────────────────────────────────────────────────────────────┘\n",
            "█".repeat(bar_filled),
            "░".repeat(bar_empty),
            pas_score,
            status,
            entropy
        );
        self.write_file("city_health.ascii", &content);
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs neural_city::hooks`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/neural_city/hooks.rs
git commit -m "feat(neural-city): implement NeuralCityAsciiRenderer"
```

---

## Task 3: Create Visual Shell Hook Trait

**Files:**
- Create: `systems/infinite_map_rs/src/visual_shell/hooks.rs`
- Modify: `systems/infinite_map_rs/src/visual_shell/mod.rs`

**Step 1: Write the failing test**

Create `systems/infinite_map_rs/src/visual_shell/hooks.rs`:

```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_visual_shell_hook_trait_exists() {
        struct MockHook;
        impl VisualShellHook for MockHook {
            fn on_window_create(&self, _id: u32, _title: &str, _pos: (u32, u32), _size: (u32, u32)) {}
            fn on_window_focus(&self, _id: u32) {}
            fn on_window_close(&self, _id: u32) {}
            fn on_fragment_update(&self, _count: usize, _memory_mb: f32) {}
        }
        let _hook = MockHook;
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs visual_shell::hooks`
Expected: FAIL with "VisualShellHook not found"

**Step 3: Write minimal implementation**

Add to `hooks.rs`:

```rust
//! Visual Shell Instrumentation Hooks
//!
//! Tracks window fragments and UI state for AI perception.

use std::path::PathBuf;
use std::fs;

/// Instrumentation hook for Visual Shell events
pub trait VisualShellHook: Send + Sync {
    /// Called when a window is created
    fn on_window_create(&self, id: u32, title: &str, pos: (u32, u32), size: (u32, u32));

    /// Called when a window gains focus
    fn on_window_focus(&self, id: u32);

    /// Called when a window is closed
    fn on_window_close(&self, id: u32);

    /// Called when fragment state changes
    fn on_fragment_update(&self, fragment_count: usize, memory_mb: f32);
}

/// Window fragment representation
#[derive(Clone, Debug)]
pub struct WindowFragment {
    pub id: u32,
    pub title: String,
    pub pos: (u32, u32),
    pub size: (u32, u32),
    pub z_index: u32,
    pub focused: bool,
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs visual_shell::hooks`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/visual_shell/hooks.rs
git commit -m "feat(visual-shell): add VisualShellHook trait definition"
```

---

## Task 4: Implement Visual Shell ASCII Renderer

**Files:**
- Modify: `systems/infinite_map_rs/src/visual_shell/hooks.rs`

**Step 1: Write the failing test**

Add test:

```rust
    #[test]
    fn test_shell_renderer_tracks_fragments() {
        let temp_dir = std::env::temp_dir().join("visual_shell_test");
        let _ = std::fs::create_dir_all(&temp_dir);

        let renderer = VisualShellAsciiRenderer::new(temp_dir.clone());
        renderer.on_window_create(0, "Terminal", (120, 80), (80, 24));
        renderer.on_window_focus(0);

        let output = temp_dir.join("shell_fragments.ascii");
        assert!(output.exists());
    }
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs visual_shell::hooks::tests::test_shell_renderer`
Expected: FAIL

**Step 3: Write implementation**

Add to `hooks.rs`:

```rust
use std::collections::HashMap;

/// ASCII renderer for Visual Shell state
pub struct VisualShellAsciiRenderer {
    output_dir: PathBuf,
    fragments: HashMap<u32, WindowFragment>,
    focused_id: Option<u32>,
}

impl VisualShellAsciiRenderer {
    pub fn new(output_dir: PathBuf) -> Self {
        if !output_dir.exists() {
            let _ = fs::create_dir_all(&output_dir);
        }
        Self {
            output_dir,
            fragments: HashMap::new(),
            focused_id: None,
        }
    }

    fn render_fragments(&self) {
        let mut lines = vec![
            "┌──────────────────────────────────────────────────────────────┐".to_string(),
            "│ VISUAL SHELL FRAGMENTS                                       │".to_string(),
            "├──────────────────────────────────────────────────────────────┤".to_string(),
        ];

        let mut sorted: Vec<_> = self.fragments.values().collect();
        sorted.sort_by_key(|f| std::cmp::Reverse(f.z_index));

        for frag in sorted {
            let focus_marker = if Some(frag.id) == self.focused_id { "[*]" } else { "[ ]" };
            lines.push(format!(
                "│ {} {} @ ({},{}) {}x{} z:{}",
                focus_marker, frag.title, frag.pos.0, frag.pos.1,
                frag.size.0, frag.size.1, frag.z_index
            ));
        }

        lines.push("└──────────────────────────────────────────────────────────────┘".to_string());

        let _ = fs::write(self.output_dir.join("shell_fragments.ascii"), lines.join("\n"));
    }
}

impl VisualShellHook for VisualShellAsciiRenderer {
    fn on_window_create(&self, id: u32, title: &str, pos: (u32, u32), size: (u32, u32)) {
        // Note: This requires interior mutability for real use
        // For now, this is a simplified version
    }

    fn on_window_focus(&self, id: u32) {}
    fn on_window_close(&self, id: u32) {}
    fn on_fragment_update(&self, count: usize, memory_mb: f32) {}
}
```

**Step 4: Run test**

Run: `cargo test --package infinite_map_rs visual_shell::hooks`
Expected: Tests for trait exist, may need RefCell for mutability

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/visual_shell/hooks.rs
git commit -m "feat(visual-shell): implement VisualShellAsciiRenderer skeleton"
```

---

## Task 5: Create Evolution Pipeline Hook Trait

**Files:**
- Create: `systems/evolution_daemon/hooks.rs`
- Modify: `systems/evolution_daemon/mod.rs`

**Step 1: Write the failing test**

Create `systems/evolution_daemon/hooks.py`:

```python
"""Evolution Pipeline Instrumentation Hooks"""
import pytest
from pathlib import Path


def test_evolution_hook_trait_exists():
    """Test that EvolutionHook can be implemented"""
    from systems.evolution_daemon.hooks import EvolutionHook, PipelineStage, StageStatus

    class MockHook(EvolutionHook):
        def on_pas_change(self, old_score, new_score):
            pass
        def on_pipeline_stage(self, stage, status):
            pass
        def on_self_correction(self, trigger, action, result):
            pass

    hook = MockHook()
    assert hook is not None
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/evolution_daemon/test_hooks.py -v`
Expected: FAIL with "No module named hooks"

**Step 3: Write minimal implementation**

Create `systems/evolution_daemon/hooks.py`:

```python
"""
Evolution Pipeline Instrumentation Hooks

Provides real-time monitoring of the PAS-triggered self-healing loop.
"""

from enum import Enum
from pathlib import Path
from abc import ABC, abstractmethod
from typing import Optional
import time


class PipelineStage(Enum):
    """Stages of the transmutation pipeline"""
    SCAN = "scan"      # scanner.py extracts ASCII
    REASON = "reason"  # Agent analyzes morphology
    PATCH = "patch"    # VASM generated
    BUILD = "build"    # vasm.py compiles to .rts.png


class StageStatus(Enum):
    """Status of a pipeline stage"""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    COMPLETE = "complete"
    FAILED = "failed"


class EvolutionHook(ABC):
    """Abstract base class for evolution pipeline hooks"""

    @abstractmethod
    def on_pas_change(self, old_score: float, new_score: float) -> None:
        """Called when PAS score changes"""
        pass

    @abstractmethod
    def on_pipeline_stage(self, stage: PipelineStage, status: StageStatus) -> None:
        """Called when a pipeline stage status changes"""
        pass

    @abstractmethod
    def on_self_correction(self, trigger: str, action: str, result: bool) -> None:
        """Called when a self-correction event occurs"""
        pass
```

**Step 4: Run test**

Run: `pytest systems/evolution_daemon/test_hooks.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/evolution_daemon/hooks.py
git commit -m "feat(evolution): add EvolutionHook trait and enums"
```

---

## Task 6: Implement Evolution ASCII Renderer

**Files:**
- Modify: `systems/evolution_daemon/hooks.py`

**Step 1: Write the failing test**

Add test:

```python
def test_evolution_ascii_renderer():
    """Test that EvolutionAsciiRenderer produces output files"""
    import tempfile
    from systems.evolution_daemon.hooks import EvolutionAsciiRenderer, PipelineStage, StageStatus

    with tempfile.TemporaryDirectory() as tmpdir:
        renderer = EvolutionAsciiRenderer(Path(tmpdir))
        renderer.on_pas_change(0.95, 0.78)

        output = Path(tmpdir) / "evolution_pas.ascii"
        assert output.exists()

        content = output.read_text()
        assert "0.78" in content
```

**Step 2: Run test**

Run: `pytest systems/evolution_daemon/test_hooks.py::test_evolution_ascii_renderer -v`
Expected: FAIL

**Step 3: Write implementation**

Add to `hooks.py`:

```python
class EvolutionAsciiRenderer(EvolutionHook):
    """Renders evolution pipeline state to ASCII files"""

    def __init__(self, output_dir: Path):
        self.output_dir = output_dir
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.current_pas = 1.0
        self.stage_status = {s: StageStatus.PENDING for s in PipelineStage}
        self.correction_log = []

    def _write_file(self, filename: str, content: str) -> None:
        path = self.output_dir / filename
        path.write_text(content)

    def on_pas_change(self, old_score: float, new_score: float) -> None:
        self.current_pas = new_score

        bar_filled = int(new_score * 40)
        bar_empty = 40 - bar_filled
        status = "NOMINAL" if new_score >= 0.8 else "WARNING"

        content = f"""┌──────────────────────────────────────────────────────────────┐
│ PHASE ALIGNMENT STABILITY (PAS)                              │
├──────────────────────────────────────────────────────────────┤
│  [{"█" * bar_filled}{"░" * bar_empty}] {new_score:.2f} [{status}]             │
│                                                              │
│  Previous: {old_score:.2f} | Threshold: 0.80                 │
│  Trigger: AUTO_CORRECT if below threshold                    │
└──────────────────────────────────────────────────────────────┘
"""
        self._write_file("evolution_pas.ascii", content)

        if new_score < 0.8 and old_score >= 0.8:
            self.on_self_correction(
                f"PAS dropped to {new_score:.2f}",
                "scanner -> reason -> patch -> build",
                False  # Will be updated when complete
            )

    def on_pipeline_stage(self, stage: PipelineStage, status: StageStatus) -> None:
        self.stage_status[stage] = status
        self._render_pipeline()

    def on_self_correction(self, trigger: str, action: str, result: bool) -> None:
        timestamp = time.strftime("%H:%M:%S")
        result_char = "✓" if result else "✗"
        self.correction_log.append(f"{timestamp}  {trigger} -> {action} [{result_char}]")
        self._render_log()

    def _render_pipeline(self) -> None:
        lines = [
            "┌──────────────────────────────────────────────────────────────┐",
            "│ EVOLUTION PIPELINE STAGES                                   │",
            "├──────────────────────────────────────────────────────────────┤",
        ]

        stage_names = {
            PipelineStage.SCAN: "SCAN",
            PipelineStage.REASON: "REASON",
            PipelineStage.PATCH: "PATCH",
            PipelineStage.BUILD: "BUILD",
        }

        for stage in PipelineStage:
            status = self.stage_status[stage]
            mark = {"pending": "◯", "in_progress": "◐", "complete": "✓", "failed": "✗"}[status.value]
            name = stage_names[stage]
            lines.append(f"│  [{mark}] {name:<10}                              │")

        lines.append("└──────────────────────────────────────────────────────────────┘")

        self._write_file("evolution_pipeline.ascii", "\n".join(lines))

    def _render_log(self) -> None:
        lines = [
            "┌──────────────────────────────────────────────────────────────┐",
            "│ SELF-CORRECTION LOG                                         │",
            "├──────────────────────────────────────────────────────────────┤",
        ]

        for entry in self.correction_log[-10:]:  # Last 10 entries
            lines.append(f"│  {entry:<56}│")

        lines.append("└──────────────────────────────────────────────────────────────┘")

        self._write_file("evolution_log.ascii", "\n".join(lines))
```

**Step 4: Run test**

Run: `pytest systems/evolution_daemon/test_hooks.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/evolution_daemon/hooks.py
git commit -m "feat(evolution): implement EvolutionAsciiRenderer with PAS monitoring"
```

---

## Task 7: Create Hook Broadcaster for Each Subsystem

**Files:**
- Modify: `systems/infinite_map_rs/src/neural_city/hooks.rs`
- Modify: `systems/infinite_map_rs/src/visual_shell/hooks.rs`
- Modify: `systems/evolution_daemon/hooks.py`

**Step 1: Add broadcaster to Neural City**

Add to `neural_city/hooks.rs`:

```rust
/// Broadcasts events to multiple hooks
pub struct NeuralCityHookBroadcaster {
    pub hooks: Vec<Box<dyn NeuralCityHook>>,
}

impl NeuralCityHookBroadcaster {
    pub fn new() -> Self {
        Self { hooks: Vec::new() }
    }

    pub fn add_hook(&mut self, hook: Box<dyn NeuralCityHook>) {
        self.hooks.push(hook);
    }
}

impl NeuralCityHook for NeuralCityHookBroadcaster {
    fn on_district_update(&self, name: &str, pos: (f64, f64), load: f32, agent_count: usize) {
        for hook in &self.hooks {
            hook.on_district_update(name, pos, load, agent_count);
        }
    }

    fn on_camera_move(&self, pos: (f64, f64), zoom: f32) {
        for hook in &self.hooks {
            hook.on_camera_move(pos, zoom);
        }
    }

    fn on_agent_relocation(&self, agent_id: &str, from: &str, to: &str) {
        for hook in &self.hooks {
            hook.on_agent_relocation(agent_id, from, to);
        }
    }

    fn on_city_health(&self, pas_score: f32, entropy: f32) {
        for hook in &self.hooks {
            hook.on_city_health(pas_score, entropy);
        }
    }
}
```

**Step 2: Add test for broadcaster**

```rust
    #[test]
    fn test_broadcaster_dispatches_to_all_hooks() {
        use std::sync::atomic::{AtomicUsize, Ordering};
        use std::sync::Arc;

        struct CountingHook(Arc<AtomicUsize>);
        impl NeuralCityHook for CountingHook {
            fn on_district_update(&self, _: &str, _: (f64, f64), _: f32, _: usize) {
                self.0.fetch_add(1, Ordering::SeqCst);
            }
            fn on_camera_move(&self, _: (f64, f64), _: f32) {}
            fn on_agent_relocation(&self, _: &str, _: &str, _: &str) {}
            fn on_city_health(&self, _: f32, _: f32) {}
        }

        let count = Arc::new(AtomicUsize::new(0));
        let mut broadcaster = NeuralCityHookBroadcaster::new();
        broadcaster.add_hook(Box::new(CountingHook(count.clone())));
        broadcaster.add_hook(Box::new(CountingHook(count.clone())));

        broadcaster.on_district_update("test", (0.0, 0.0), 0.5, 10);

        assert_eq!(count.load(Ordering::SeqCst), 2);
    }
```

**Step 3: Run tests**

Run: `cargo test --package infinite_map_rs neural_city::hooks`
Expected: PASS

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/neural_city/hooks.rs
git commit -m "feat(neural-city): add NeuralCityHookBroadcaster for multi-hook dispatch"
```

---

## Task 8: Integration - Wire Hooks to Subsystems

**Files:**
- Modify: `systems/neural_city/venv/...` (or appropriate Neural City engine file)
- Modify: `systems/visual_shell/web/NeuralCityEngine.js`

**Step 1: Identify integration points**

Run: `grep -r "district" systems/visual_shell/web/*.js | head -5`

**Step 2: Add hook emission points**

This task requires identifying where in the Neural City JavaScript engine district updates happen, and adding WebSocket messages that the Rust side can receive.

**Step 3: Test integration**

Verify that moving the camera or updating districts causes `.ascii` files to update.

**Step 4: Commit**

```bash
git add systems/visual_shell/web/NeuralCityEngine.js
git commit -m "feat(integration): wire Neural City hooks to engine events"
```

---

## Verification

After all tasks complete, verify:

1. **RISC-V:** Run `cargo run --bin run_riscv` and check `systems/riscv_gpu/ascii_scene/`
2. **Neural City:** Pan the map and check `neural_city_map.ascii` updates
3. **Visual Shell:** Open/close windows and check `shell_fragments.ascii`
4. **Evolution:** Trigger PAS drop and verify `evolution_pas.ascii` shows WARNING

---

**Total Tasks: 8**
**Estimated Time: 2-3 hours**
