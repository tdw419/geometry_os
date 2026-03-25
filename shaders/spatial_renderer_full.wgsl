// spatial_renderer.wgsl - Phase 30.3: Full-Screen Spatial Renderer
// 
// Renders the spatial bytecode map to the screen with real-time signal visualization.
// Combines L0 (bytecode structure) with L2 (signal state) for final output.

const GRID_WIDTH: u32 = 576u;
const GRID_HEIGHT: u32 = 576u;

struct SpatialUniforms {
    time: f32,
    delta_time: f32,
    propagation_speed: f32,
    signal_decay: f32,
}

@group(0) @binding(0) var<uniform> uniforms: SpatialUniforms;
@group(0) @binding(1) var bytecode_texture: texture_2d<u32>;
@group(0) @binding(2) var logic_texture: texture_2d<u32>;

// Full-screen quad vertex shader
@vertex
fn vertex_main(@builtin(vertex_index) vertex_index: u32) -> @builtin(position) vec4<f32> {
    let positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>( 1.0, -1.0),
        vec2<f32>(-1.0,  1.0),
        vec2<f32>(-1.0,  1.0),
        vec2<f32>( 1.0, -1.0),
        vec2<f32>( 1.0,  1.0),
    );
    
    return vec4<f32>(positions[vertex_index], 0.0, 1.0);
}

// Convert pixel type to color
fn pixel_to_color(pixel_type: u32, signal: u32) -> vec4<f32> {
    let signal_intensity = f32(signal) / 255.0;
    let shimmer = sin(uniforms.time * 6.28318 * 6.0) * 0.3 + 0.7;
    
    var color = vec3<f32>(0.0, 0.0, 0.0);
    var alpha = 1.0;
    
    switch (pixel_type) {
        case 0x01u: { // Red - Terminator
            color = vec3<f32>(1.0, 0.0, 0.0);
        }
        case 0x02u: { // Blue - Data Pillar (always HIGH)
            color = vec3<f32>(0.0, 0.0, 1.0) + vec3<f32>(1.0, 1.0, 1.0) * signal_intensity * 0.5;
        }
        case 0x03u: { // Yellow - Path
            let pulse = sin(uniforms.time * 10.0 + f32(signal) * 0.1) * 0.3 + 0.7;
            color = vec3<f32>(1.0, 1.0, 0.0) * pulse * (0.5 + signal_intensity * 0.5);
        }
        case 0x04u: { // Cyan - Arithmetic
            color = vec3<f32>(0.0, 1.0, 1.0) + vec3<f32>(1.0, 1.0, 1.0) * signal_intensity * 0.3;
        }
        case 0x05u: { // Green - Output Bridge
            // Flash on collision
            let flash = select(0.0, 1.0, signal > 50u);
            color = vec3<f32>(0.0, 1.0, 0.0) + vec3<f32>(1.0, 1.0, 1.0) * flash;
        }
        case 0x06u: { // Magenta - Logic Gates
            color = vec3<f32>(1.0, 0.0, 1.0) * (0.6 + signal_intensity * 0.4);
        }
        case 0x07u: { // Violet - GQR (shimmering)
            color = vec3<f32>(0.58, 0.0, 0.83) * shimmer;
        }
        case 0x08u: { // Dim Blue - Noise
            color = vec3<f32>(0.1, 0.1, 0.2);
        }
        case 0x09u: { // Gray - Control
            color = vec3<f32>(0.5, 0.5, 0.5);
        }
        default: {
            // Background - subtle glow from signal
            color = vec3<f32>(0.02, 0.02, 0.05) + vec3<f32>(0.1, 0.2, 0.3) * signal_intensity * 0.2;
            alpha = 0.8;
        }
    }
    
    return vec4<f32>(color, alpha);
}

// Fragment shader
@fragment
fn fragment_main(@builtin(position) screen_pos: vec4<f32>) -> @location(0) vec4<f32> {
    // Convert screen coordinates to texture coordinates
    // Assuming full-screen quad, position is already in NDC
    let ndc = screen_pos.xy;
    
    // Get viewport size (would need to pass as uniform in real impl)
    // For now, assume 1280x800
    let viewport_width = 1280.0;
    let viewport_height = 800.0;
    
    // Convert to pixel coordinates
    let px = u32((ndc.x + 1.0) * 0.5 * f32(GRID_WIDTH));
    let py = u32((1.0 - ndc.y) * 0.5 * f32(GRID_HEIGHT));
    
    // Bounds check
    if (px >= GRID_WIDTH || py >= GRID_HEIGHT) {
        return vec4<f32>(0.02, 0.02, 0.05, 1.0);
    }
    
    // Sample textures
    let pixel_type = textureLoad(bytecode_texture, vec2<u32>(px, py), 0).r;
    let signal = textureLoad(logic_texture, vec2<u32>(px, py), 0).r;
    
    // Convert to color
    let color = pixel_to_color(pixel_type, signal);
    
    // Add grid lines
    let grid_x = px % 24u;
    let grid_y = py % 24u;
    let is_grid_line = grid_x == 0u || grid_y == 0u;
    
    if (is_grid_line && pixel_type == 0u) {
        return vec4<f32>(0.05, 0.05, 0.1, 0.5);
    }
    
    // Add execution scanline effect
    let scanline_y = u32(uniforms.time * 60.0) % GRID_HEIGHT;
    let scanline_dist = abs(i32(py) - i32(scanline_y));
    
    if (scanline_dist < 2u) {
        let scanline_intensity = 1.0 - f32(scanline_dist) / 2.0;
        return color + vec4<f32>(0.3, 0.5, 0.7, 0.0) * scanline_intensity;
    }
    
    return color;
}

// === COMPUTE SHADER FOR PHYSICS UPDATE ===

@group(0) @binding(0) var<uniform> compute_uniforms: SpatialUniforms;
@group(0) @binding(1) var<storage, read> bytecode_buffer: array<u32>;
@group(0) @binding(2) var<storage, read_write> logic_buffer: array<u32>;
@group(0) @binding(3) var<storage, read_write> output_detected: atomic<u32>;

const CONDUCTIVITY_THRESHOLD: u32 = 128u;
const SIGNAL_DECAY: f32 = 0.95;

fn is_conductive(idx: u32) -> bool {
    return bytecode_buffer[idx] >= CONDUCTIVITY_THRESHOLD;
}

fn get_pixel_type(idx: u32) -> u32 {
    return bytecode_buffer[idx];
}

fn max_neighbor_signal(x: u32, y: u32) -> u32 {
    var max_signal: u32 = 0u;
    
    for (var dy = -1; dy <= 1; dy++) {
        for (var dx = -1; dx <= 1; dx++) {
            if (dx == 0 && dy == 0) { continue; }
            
            let nx = i32(x) + dx;
            let ny = i32(y) + dy;
            
            if (nx >= 0 && nx < i32(GRID_WIDTH) && ny >= 0 && ny < i32(GRID_HEIGHT)) {
                let nidx = u32(ny) * GRID_WIDTH + u32(nx);
                let n_signal = logic_buffer[nidx];
                if (n_signal > max_signal) {
                    max_signal = n_signal;
                }
            }
        }
    }
    
    return max_signal;
}

@compute @workgroup_size(16, 16)
fn physics_step(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    
    if (x >= GRID_WIDTH || y >= GRID_HEIGHT) {
        return;
    }
    
    let idx = y * GRID_WIDTH + x;
    
    // Data pillars are constant sources
    if (get_pixel_type(idx) == 0x02u) {
        logic_buffer[idx] = 255u;
        return;
    }
    
    // Non-conductive pixels decay to zero
    if (!is_conductive(idx)) {
        let current = logic_buffer[idx];
        logic_buffer[idx] = u32(f32(current) * SIGNAL_DECAY * SIGNAL_DECAY);
        return;
    }
    
    // Sample neighbors
    let max_neighbor = max_neighbor_signal(x, y);
    let current = logic_buffer[idx];
    
    var new_signal = current;
    
    // Propagation
    if (max_neighbor > current) {
        let flow = (max_neighbor - current) >> 1; // 50% transfer
        new_signal = current + flow;
    }
    
    // Decay
    new_signal = u32(f32(new_signal) * SIGNAL_DECAY);
    
    // Clamp
    new_signal = min(new_signal, 255u);
    
    // Update
    logic_buffer[idx] = new_signal;
    
    // Check for output collision
    if (get_pixel_type(idx) == 0x05u && new_signal > 50u) {
        atomicStore(&output_detected, 1u);
    }
}
