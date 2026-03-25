// physics_propagation.wgsl - Phase 30.2: The Kinetic Engine
// 
// Implements the physics of signal propagation through spatial bytecode.
// When a "High" signal is injected (via Z-pattern handshake), it flows
// through conductive pathways like electricity through a circuit.
//
// Architecture:
// ┌──────────────────────────────────────────────────────────────┐
// │  SIGNAL PROPAGATION PHYSICS                                  │
// │                                                              │
// │  Source (Data Pillar)                                        │
// │       │                                                      │
// │       │ 255u signal                                          │
// │       ▼                                                      │
// │  ┌──────────────────────────────────────────┐               │
// │  │  L0: Physical Layer (conductivity)       │               │
// │  │  - Data Pillars: Conductive (255)        │               │
// │  │  - Logic Gates: Conductive (255)         │               │
// │  │  - Paths: Conductive (200)               │               │
// │  │  - Empty: Non-conductive (0)             │               │
// │  └──────────────────────────────────────────┘               │
// │       │                                                      │
// │       ▼                                                      │
// │  ┌──────────────────────────────────────────┐               │
// │  │  L2: Logic Layer (signal state)          │               │
// │  │  - Wave propagation with decay           │               │
// │  │  - Neighbor sampling for flow            │               │
// │  │  - Output detection at bridges           │               │
// │  └──────────────────────────────────────────┘               │
// │       │                                                      │
// │       ▼ (collision at Output Bridge)                        │
// │  Neural Gateway → "[VOICE]: Hello World"                    │
// └──────────────────────────────────────────────────────────────┘

const GRID_WIDTH: u32 = 576u;
const GRID_HEIGHT: u32 = 576u;
const GRID_SIZE: u32 = GRID_WIDTH * GRID_HEIGHT;

// Conductivity thresholds
const CONDUCTIVITY_THRESHOLD: u32 = 128u;
const SIGNAL_DECAY: f32 = 0.95;
const SIGNAL_BOOST: f32 = 0.98;

// Pixel types (from spatial_interpreter.rs)
const PIXEL_DATA: u32 = 0x02u;      // Blue - Data Pillar
const PIXEL_PATH: u32 = 0x03u;      // Yellow - Logic Path
const PIXEL_ARITHMETIC: u32 = 0x04u; // Cyan - Arithmetic
const PIXEL_OUTPUT: u32 = 0x05u;     // Green - Output Bridge
const PIXEL_LOGIC: u32 = 0x06u;      // Magenta - Logic Gates
const PIXEL_GQR: u32 = 0x07u;        // Violet - GQR Sealed

// Signal states
const SIGNAL_LOW: u32 = 0u;
const SIGNAL_HIGH: u32 = 255u;
const SIGNAL_PROPAGATING: u32 = 200u;

struct PhysicsUniforms {
    time: f32,
    delta_time: f32,
    propagation_speed: f32,
    signal_decay: f32,
}

@group(0) @binding(0) var<uniform> uniforms: PhysicsUniforms;
@group(0) @binding(1) var<storage, read> l0_physical: array<u32>;     // Conductivity map
@group(0) @binding(2) var<storage, read_write> l2_logic: array<u32>;  // Signal state
@group(0) @binding(3) var<storage, read_write> output_buffer: array<atomic<u32>>;

// Check if pixel is conductive
fn is_conductive(idx: u32) -> bool {
    let pixel_type = l0_physical[idx] & 0xFFu;
    return pixel_type >= CONDUCTIVITY_THRESHOLD;
}

// Get pixel type
fn get_pixel_type(idx: u32) -> u32 {
    return l0_physical[idx] & 0xFFu;
}

// Check if pixel is a path (allows signal flow)
fn is_pathway(idx: u32) -> bool {
    let pixel_type = get_pixel_type(idx);
    return pixel_type == PIXEL_PATH || 
           pixel_type == PIXEL_DATA ||
           pixel_type == PIXEL_ARITHMETIC ||
           pixel_type == PIXEL_LOGIC ||
           pixel_type == PIXEL_OUTPUT;
}

// Check if pixel is an output bridge
fn is_output_bridge(idx: u32) -> bool {
    return get_pixel_type(idx) == PIXEL_OUTPUT;
}

// Get maximum signal from 8 neighbors
fn max_neighbor_potential(coords: vec2<u32>) -> u32 {
    var max_potential: u32 = 0u;
    
    // 8-directional sampling
    for (var dy = -1; dy <= 1; dy++) {
        for (var dx = -1; dx <= 1; dx++) {
            if (dx == 0 && dy == 0) { continue; }
            
            let nx = i32(coords.x) + dx;
            let ny = i32(coords.y) + dy;
            
            // Bounds check
            if (nx >= 0 && nx < i32(GRID_WIDTH) && ny >= 0 && ny < i32(GRID_HEIGHT)) {
                let neighbor_idx = u32(ny) * GRID_WIDTH + u32(nx);
                let neighbor_signal = l2_logic[neighbor_idx];
                
                if (neighbor_signal > max_potential) {
                    max_potential = neighbor_signal;
                }
            }
        }
    }
    
    return max_potential;
}

// Get average neighbor signal (for smoother propagation)
fn avg_neighbor_potential(coords: vec2<u32>) -> f32 {
    var sum: f32 = 0.0;
    var count: u32 = 0u;
    
    for (var dy = -1; dy <= 1; dy++) {
        for (var dx = -1; dx <= 1; dx++) {
            if (dx == 0 && dy == 0) { continue; }
            
            let nx = i32(coords.x) + dx;
            let ny = i32(coords.y) + dy;
            
            if (nx >= 0 && nx < i32(GRID_WIDTH) && ny >= 0 && ny < i32(GRID_HEIGHT)) {
                let neighbor_idx = u32(ny) * GRID_WIDTH + u32(nx);
                sum += f32(l2_logic[neighbor_idx]);
                count += 1u;
            }
        }
    }
    
    if (count == 0u) { return 0.0; }
    return sum / f32(count);
}

// Main propagation kernel
@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    
    if (x >= GRID_WIDTH || y >= GRID_HEIGHT) {
        return;
    }
    
    let idx = y * GRID_WIDTH + x;
    let coords = vec2<u32>(x, y);
    
    // 1. Get current state
    let current_signal = l2_logic[idx];
    let pixel_type = get_pixel_type(idx);
    
    // 2. Check if this pixel can conduct
    if (!is_pathway(idx)) {
        // Non-conductive pixel - decay to zero
        if (current_signal > 0u) {
            l2_logic[idx] = u32(f32(current_signal) * SIGNAL_DECAY * SIGNAL_DECAY);
        }
        return;
    }
    
    // 3. Data Pillars are always HIGH (sources)
    if (pixel_type == PIXEL_DATA) {
        l2_logic[idx] = SIGNAL_HIGH;
        return;
    }
    
    // 4. Check for neighbor signals
    let max_neighbor = max_neighbor_potential(coords);
    let avg_neighbor = avg_neighbor_potential(coords);
    
    // 5. Propagation logic
    var new_signal = current_signal;
    
    if (max_neighbor > current_signal) {
        // Neighbor has higher potential - flow towards us
        let flow_rate = uniforms.propagation_speed * uniforms.delta_time;
        let potential_diff = f32(max_neighbor - current_signal);
        new_signal = current_signal + u32(potential_diff * flow_rate);
    }
    
    // 6. Apply decay (signals naturally dim over time)
    new_signal = u32(f32(new_signal) * SIGNAL_DECAY);
    
    // 7. Boost if neighbors are active (sustained signal)
    if (avg_neighbor > 128.0) {
        new_signal = u32(f32(new_signal) * SIGNAL_BOOST);
    }
    
    // 8. Clamp to valid range
    new_signal = min(new_signal, SIGNAL_HIGH);
    
    // 9. Update state
    l2_logic[idx] = new_signal;
    
    // 10. Check for output bridge collision
    if (is_output_bridge(idx) && new_signal > 200u) {
        // Signal hit output bridge - notify host
        let output_idx = 0u; // Would be calculated based on output bridge ID
        atomicMax(&output_buffer[output_idx], new_signal);
        
        // Visual flash on collision
        l2_logic[idx] = SIGNAL_HIGH;
    }
}

// === IGNITION KERNEL ===
// Injects a HIGH signal at specified coordinates (called on Z-pattern handshake)

@compute @workgroup_size(1, 1)
fn ignite_signal(@builtin(global_invocation_id) id: vec3<u32>) {
    let idx = id.x;
    
    // Set signal to HIGH at ignition point
    // (Coordinates would be passed via uniform or storage buffer)
    l2_logic[idx] = SIGNAL_HIGH;
}

// === DECAY KERNEL ===
// Gradually decays all signals (called between propagation passes)

@compute @workgroup_size(16, 16)
fn decay_signals(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    
    if (x >= GRID_WIDTH || y >= GRID_HEIGHT) {
        return;
    }
    
    let idx = y * GRID_WIDTH + x;
    let current = l2_logic[idx];
    
    // Data pillars don't decay
    if (get_pixel_type(idx) == PIXEL_DATA) {
        return;
    }
    
    // Apply decay
    l2_logic[idx] = u32(f32(current) * SIGNAL_DECAY);
}

// === VISUALIZATION KERNEL ===
// Combines L0 (structure) + L2 (signal) for display

@group(1) @binding(0) var<storage, read> l0_physical_viz: array<u32>;
@group(1) @binding(1) var<storage, read> l2_logic_viz: array<u32>;
@group(1) @binding(2) var output_texture: texture_storage_2d<rgba8unorm, write>;

fn type_to_color(pixel_type: u32, signal: u32) -> vec3<f32> {
    let signal_intensity = f32(signal) / 255.0;
    
    switch (pixel_type) {
        case PIXEL_DATA: {
            // Blue with signal glow
            return vec3<f32>(0.0, 0.0, 1.0) + vec3<f32>(1.0, 1.0, 1.0) * signal_intensity * 0.5;
        }
        case PIXEL_PATH: {
            // Yellow path with signal pulse
            return vec3<f32>(1.0, 1.0, 0.0) * (0.5 + signal_intensity * 0.5);
        }
        case PIXEL_ARITHMETIC: {
            // Cyan arithmetic
            return vec3<f32>(0.0, 1.0, 1.0) + vec3<f32>(1.0, 1.0, 1.0) * signal_intensity * 0.3;
        }
        case PIXEL_OUTPUT: {
            // Green output with collision flash
            return vec3<f32>(0.0, 1.0, 0.0) + vec3<f32>(1.0, 1.0, 1.0) * signal_intensity;
        }
        case PIXEL_LOGIC: {
            // Magenta logic gates
            return vec3<f32>(1.0, 0.0, 1.0) * (0.6 + signal_intensity * 0.4);
        }
        case PIXEL_GQR: {
            // Violet GQR with shimmer
            let shimmer = sin(uniforms.time * 6.28318 * 6.0) * 0.3 + 0.7;
            return vec3<f32>(0.58, 0.0, 0.83) * shimmer;
        }
        default: {
            // Background - subtle signal visualization
            return vec3<f32>(0.05, 0.05, 0.1) * signal_intensity;
        }
    }
}

@compute @workgroup_size(8, 8)
fn visualize(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    
    if (x >= GRID_WIDTH || y >= GRID_HEIGHT) {
        return;
    }
    
    let idx = y * GRID_WIDTH + x;
    let pixel_type = l0_physical_viz[idx] & 0xFFu;
    let signal = l2_logic_viz[idx];
    
    let color = type_to_color(pixel_type, signal);
    let alpha = 1.0;
    
    textureStore(output_texture, vec2<u32>(x, y), vec4<f32>(color, alpha));
}

// === DEBUG KERNEL ===
// Outputs signal strength as heatmap

@compute @workgroup_size(8, 8)
fn debug_heatmap(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    
    if (x >= GRID_WIDTH || y >= GRID_HEIGHT) {
        return;
    }
    
    let idx = y * GRID_WIDTH + x;
    let signal = l2_logic_viz[idx];
    let intensity = f32(signal) / 255.0;
    
    // Heatmap: black -> red -> yellow -> white
    var color = vec3<f32>(0.0, 0.0, 0.0);
    
    if (intensity < 0.33) {
        // Black to red
        color = vec3<f32>(intensity * 3.0, 0.0, 0.0);
    } else if (intensity < 0.66) {
        // Red to yellow
        color = vec3<f32>(1.0, (intensity - 0.33) * 3.0, 0.0);
    } else {
        // Yellow to white
        color = vec3<f32>(1.0, 1.0, (intensity - 0.66) * 3.0);
    }
    
    textureStore(output_texture, vec2<u32>(x, y), vec4<f32>(color, 1.0));
}
