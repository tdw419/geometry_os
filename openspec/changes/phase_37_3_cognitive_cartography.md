---
id: phase_37_3_cognitive_cartography
title: Cognitive Cartography - The Screen is the Debugger
status: draft
priority: high
author: Antigravity
created: 2026-02-03
---

# Cognitive Cartography: Visualizing the Mind of the Machine

## 1. Abstract
This specification defines the "Cortex Layer," a mechanism to project the internal state of AI models (Attention, Saliency, Inhibition of Return) directly onto the Geometry OS Infinite Map. This moves us from "Black Box" debugging to "Glass Box" observation, where the OS interface itself serves as the debugger for the intelligence running within it.

## 2. Motivation
Currently, the `VisualAttention` system in Python computes complex spatial maps (`saliency_map`, `ior_mask`) that determine where the AI looks. These are currently transient tensors, only visible if explicitly saved to disk or printed as summary statistics. To truly "pair program" with the AI, the user needs to *see* what the AI sees in real-time.

## 3. Architecture: The Cortex Bridge

We will implement a high-performance Shared Memory (SHM) bridge between the Python Intelligence System and the Rust Compositor.

```
┌───────────────────────────┐           ┌──────────────────────────────┐
│  Python Intelligence      │           │  Rust Infinite Map           │
│  (VisualAttention)        │           │  (Compositor)                │
│                           │           │                              │
│  [Compute TF/Torch]       │           │  [WGPU Render Loop]          │
│         ↓                 │           │         ↑                    │
│  [ior_mask (float32)]     │           │  [CortexTextureView]         │
│         ↓                 │           │         ↑                    │
│  [CortexBridge Writer] ───┼──SHM──────┼──> [Cortex Overlay Shader]   │
└───────────────────────────┘           └──────────────────────────────┘
```

### 3.1 Shared Memory Layout
Location: `/dev/shm/geometry_os_cortex_v1`
Size: Fixed buffer (e.g., 16MB) allowing up to 2048x2048 visualization or multiple channels.

**Header Structure:**
- `magic`: u32 ("GCTX")
- `generation`: u64 (Frame counter)
- `width`: u32
- `height`: u32
- `channels`: u32 (1=Intensity, 3=RGB)
- `data`: Raw bytes

### 3.2 Python Side (`systems/intelligence/cortex_bridge.py`)
A lightweight class to attach to any AI module.
```python
bridge = CortexBridge(layer="attention_ior")
bridge.update(ior_mask_numpy_array)
```

### 3.3 Rust Side (`systems/infinite_map_rs/src/cortex.rs`)
A WGPU bind group that treats the SHM region as a dynamic texture.
- **Update Frequency**: Per frame (60fps) or on generation change.
- **Rendering**: Additive blending overlay.
  - Saliency: Green tint
  - Inhibition (IOR): Red tint
  - Saccade Target: Crosshair overlay

## 4. Implementation Plan

### Step 1: Python Bridge
- Create `systems/intelligence/core/cortex_bridge.py`
- Update `systems/intelligence/core/attention.py` to push `ior_mask` and `net_map` to the bridge.

### Step 2: Rust Integration
- Create `systems/infinite_map_rs/src/cortex.rs` to map the SHM.
- Modify `renderer.rs` to include a "Cortex Layer" pass in the render pipeline.

### Step 3: Visualization
- Boot `geometry_os`.
- Run `test_phase37_task2.py` (The attention test).
- **Goal**: Watch the "Red Rain" of Inhibition accumulate on the map as the AI explores the screen.

## 5. Success Criteria
- [ ] No performance regression in Infinite Map (<16ms frame time).
- [ ] Real-time visualization of Python-side numpy arrays in the Rust compositor.
- [ ] Ability to toggle the "Mind's Eye" view on/off (e.g., Keybinding `M`).

