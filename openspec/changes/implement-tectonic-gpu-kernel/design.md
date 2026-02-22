# Design: Tectonic GPU Kernel

## Visual Impact
The ground texture will turn into a Conway's Game of Life style simulation, but with continuous values (Health/Resource).
- **Green**: Resource rich.
- **Red**: Low health/Starving.
- **Black**: Void/Death.
- **White**: Kernel/Stable.

## Technical Architecture

### Compute Shader (WGSL)
The shader will run on a 16x16 workgroup size.
It reads from `input_texture` (`texture_2d<f32>`) and writes to `output_texture` (`texture_storage_2d<rgba8unorm, write>`).

**Logic Flow**:
1. Load `current_pixel`.
2. Load `neighbor_pixels` (optional, for propagation).
3. Apply Rules:
   - `resource -= 0.01`
   - `if resource < 0.2 { health -= 0.05 }`
   - `if resource > 0.5 && health < 1.0 { health += 0.01 }`
   - `if health <= 0 { pixel = vec4(0.0) }`
4. Store `new_pixel`.

### Double Buffering (Ping-Pong)
Since we cannot read and write to the same texture safely in a localized simulation where neighbors matter, we use two textures: `TextureA` and `TextureB`.
- **Frame N**: Read A -> Compute -> Write B. Render B.
- **Frame N+1**: Read B -> Compute -> Write A. Render A.

### Daemon Bridge Integration
The `AntigravityWatcher` updates the "Ground Truth" from the filesystem.
This external update should be "injected" into the simulation.
- Option A: The Daemon writes to the *current read texture* before compute.
- Option B: The Daemon writes to a separate "Input" texture that varies the simulation params.
- **Selected**: The Daemon updates `antigravity.pixelrts.png`. The `Renderer` uploads this to a `texture` on the GPU. The Compute Shader reads this `external_input` and mixes it with the `simulation_state`.

```wgsl
let external = textureLoad(external_input, coords, 0);
let internal = textureLoad(simulation_state, coords, 0);
let final = mix(internal, external, 0.1); // Simple blending for now?
```
Actually, to respect the "Bridge", the `external_input` (Daemon) should probably *override* or *spawn* things.
For now, let's just implement the internal simulation loop. The Daemon sync is already visualizing the "Pulse" on the ground texture. The Simulation should arguably run *on top* or *instead* of static rendering.
