# Design: Tectonic Visual Language

## The "Living Substrate" Aesthetic

If the OS logic is moved to the GPU, the visual language must reflect this **organic computation**.

### 1. Morphological States
Processes are no longer static windows. They are biological entities on the Hilbert Map.

#### **State: Healthy**
- **Visual**: Glowing, stable pulsing.
- **Geometry**: High symmetry, aligned to Hilbert grid.
- **Motion**: Fluid, laminar flow.

#### **State: Stressed (CPU Spike)**
- **Visual**: Shifts to red/orange spectrum. High contrast.
- **Geometry**: "Vibrating", edges become jagged (simulated noise).
- **Motion**: Turbulent, fast, erratic.

#### **State: Dead/Zombie**
- **Visual**: Desaturated, grey/black.
- **Geometry**: Fragmented, disconnecting from the grid.
- **Motion**: Static or slowly decaying (fading alpha).

### 2. The Layout (Hilbert Geography)
We map the OS components to the texture using the Hilbert Curve II order.

- **(0,0) - Kernel Space**: The "Central Sun". Bright, intense, static.
- **Mid-Ring - System Services**: `UnifiedCognitiveDaemon`, Network stack. Organized structures.
- **Outer-Ring - User Space**: Apps, Windows. More chaotic, free-form biological growth.
- **The Edge - The Infinite Map**: Unallocated memory, the "Void".

### 3. Interactions (Interference Patterns)
- **Selection**: Not a highlight box, but a "Gravity Well" that pulls pixels towards the cursor.
- **Drag & Drop**: Merging two liquid droplets.
- **Error**: A visual "fracture" or "glitch" in the texture, visible to the naked eye.

## Technical Constraints (PAS Impact)
- **Phase Alignment Stability**: This design *increases* PAS score by unifying visual and logical state. The "Visual Glitch" *is* the "System Error". Alignment is 100%.
- **Resolution**: Min 4096² for useful OS work.
- **VRAM**: ~256MB for the texture buffers. Acceptable for modern GPUs.

## Prototyping
Use `systems/tectonic_poc/tectonic_simulator.py` to visualize the "Process Life Cycle" on a 512x512 grid.
