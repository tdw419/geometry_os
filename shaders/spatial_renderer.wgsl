// spatial_renderer.wgsl - Phase 30.2: Spatial Execution Shader
// 
// Renders bytecode spatial maps with real-time execution visualization.
// Supports 4-layer structures with shimmer effects for GQR blocks.
//
// Architecture:
// ┌──────────────────────────────────────────────────────────────┐
// │  INPUT: PixelMap buffer (576x576x4 layers)                  │
// │                                                              │
// │  LAYER 0: Data + Arithmetic (Blue/Cyan)                     │
// │  LAYER 1: Logic Gates (Magenta)                             │
// │  LAYER 2: Control + I/O (Gray/Green)                        │
// │  LAYER 3: GQR Sealed (Violet, shimmering)                   │
// │                                                              │
// │  OUTPUT: RGBA framebuffer with execution visualization      │
// └──────────────────────────────────────────────────────────────┘

struct Uniforms {
    time: f32,           // Current time for animations
    execution_tick: f32, // Current execution position (0.0 - 1.0)
    coherence: f32,      // System coherence (affects shimmer)
    padding: f32,
}

@group(0) @binding(0) var<uniform> uniforms: Uniforms;
@group(0) @binding(1) var pixel_map: binding_array<texture_2d<u32>, 4>;
@group(0) @binding(2) var output_tex: texture_storage_2d<rgba8unorm, write>;

// Color palette
const COLOR_DATA: vec3<f32> = vec3<f32>(0.0, 0.0, 1.0);      // Blue
const COLOR_ARITHMETIC: vec3<f32> = vec3<f32>(0.0, 1.0, 1.0); // Cyan
const COLOR_LOGIC: vec3<f32> = vec3<f32>(1.0, 0.0, 1.0);      // Magenta
const COLOR_OUTPUT: vec3<f32> = vec3<f32>(0.0, 1.0, 0.0);     // Green
const COLOR_CONTROL: vec3<f32> = vec3<f32>(0.5, 0.5, 0.5);    // Gray
const COLOR_GQR: vec3<f32> = vec3<f32>(0.58, 0.0, 0.83);      // Violet
const COLOR_TERMINATOR: vec3<f32> = vec3<f32>(1.0, 0.0, 0.0); // Red
const COLOR_PATH: vec3<f32> = vec3<f32>(1.0, 1.0, 0.0);       // Yellow
const COLOR_NOISE: vec3<f32> = vec3<f32>(0.1, 0.1, 0.2);      // Dim blue

// Convert pixel value to color
fn pixel_to_color(value: u32, time: f32) -> vec3<f32> {
    let v = value & 0xFF;
    
    switch (v) {
        case 0x01u: { // Red - Terminator
            return COLOR_TERMINATOR;
        }
        case 0x02u: { // Blue - Data
            return COLOR_DATA;
        }
        case 0x03u: { // Yellow - Path
            return COLOR_PATH;
        }
        case 0x04u: { // Cyan - Arithmetic
            return COLOR_ARITHMETIC;
        }
        case 0x05u: { // Green - Output
            return COLOR_OUTPUT;
        }
        case 0x06u: { // Magenta - Logic
            return COLOR_LOGIC;
        }
        case 0x07u: { // Violet - GQR (shimmering)
            let shimmer = sin(time * 6.28318 * 6.0) * 0.3 + 0.7; // 6Hz shimmer
            return COLOR_GQR * shimmer;
        }
        case 0x08u: { // Dim blue - Noise
            return COLOR_NOISE;
        }
        case 0x09u: { // Gray - Control
            return COLOR_CONTROL;
        }
        default: {
            return vec3<f32>(0.0, 0.0, 0.0);
        }
    }
}

// Check if pixel is part of hollow frame
fn is_hollow_frame(pixel_coords: vec2<i32>, center: vec2<i32>, size: i32) -> bool {
    let dx = abs(pixel_coords.x - center.x);
    let dy = abs(pixel_coords.y - center.y);
    let half = size / 2;
    
    // On edge but not in center
    let on_edge = (dx == half && dy <= half) || (dy == half && dx <= half);
    let not_center = dx < half - 1 || dy < half - 1;
    
    return on_edge;
}

// Execution pulse effect
fn execution_pulse(pixel_coords: vec2<i32>, exec_pos: f32, time: f32) -> f32 {
    // Calculate distance from execution wavefront
    let exec_x = i32(exec_pos * 576.0);
    let dist = abs(pixel_coords.x - exec_x);
    
    // Pulse intensity falls off with distance
    let pulse_width = 20.0;
    let intensity = exp(-f32(dist) / pulse_width);
    
    // Add traveling wave
    let wave = sin(f32(pixel_coords.x) * 0.1 - time * 5.0) * 0.5 + 0.5;
    
    return intensity * wave;
}

@compute @workgroup_size(8, 8, 1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let pixel_coords = vec2<i32>(i32(global_id.x), i32(global_id.y));
    
    if (pixel_coords.x >= 576 || pixel_coords.y >= 576) {
        return;
    }
    
    var final_color = vec3<f32>(0.0, 0.0, 0.0);
    var max_alpha = 0.0;
    
    // Sample all 4 layers
    for (var layer = 0u; layer < 4u; layer++) {
        let layer_coords = vec2<u32>(u32(pixel_coords.x), u32(pixel_coords.y));
        let pixel_value = textureLoad(pixel_map[layer], layer_coords, 0).r;
        
        if (pixel_value > 0u) {
            let base_color = pixel_to_color(pixel_value, uniforms.time);
            
            // Apply layer blending
            let layer_alpha = 0.25 + f32(layer) * 0.15; // Lower layers more transparent
            var color = base_color;
            var alpha = layer_alpha;
            
            // Special effects per layer
            if (layer == 3u && pixel_value == 0x07u) {
                // GQR shimmer effect
                let shimmer = sin(uniforms.time * 6.28318 * 6.0) * 0.3 + 0.7;
                color = base_color * shimmer;
                alpha = shimmer;
                
                // Coherence glow
                if (uniforms.coherence > 0.9) {
                    color += vec3<f32>(0.2, 0.1, 0.3) * (uniforms.coherence - 0.9) * 10.0;
                }
            }
            
            // Execution pulse on active structures
            let pulse = execution_pulse(pixel_coords, uniforms.execution_tick, uniforms.time);
            color += vec3<f32>(1.0, 1.0, 1.0) * pulse * 0.3;
            
            // Blend with final color
            final_color = final_color * (1.0 - alpha) + color * alpha;
            max_alpha = max(max_alpha, alpha);
        }
    }
    
    // Add grid lines (subtle)
    if (pixel_coords.x % 24 == 0 || pixel_coords.y % 24 == 0) {
        final_color = mix(final_color, vec3<f32>(0.1, 0.1, 0.15), 0.3);
    }
    
    // Add execution scanline
    let scanline_x = i32(uniforms.execution_tick * 576.0);
    if (abs(pixel_coords.x - scanline_x) < 2) {
        let scanline_intensity = 1.0 - abs(f32(pixel_coords.x - scanline_x)) / 2.0;
        final_color += vec3<f32>(0.5, 0.8, 1.0) * scanline_intensity;
    }
    
    // Output
    let output_coords = vec2<u32>(u32(pixel_coords.x), u32(pixel_coords.y));
    textureStore(output_tex, output_coords, vec4<f32>(final_color, max_alpha));
}

// === VERTEX SHADER FOR HUD OVERLAY ===

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

@vertex
fn vertex_main(@location(0) pos: vec2<f32>, @location(1) uv: vec2<f32>) -> VertexOutput {
    var output: VertexOutput;
    output.position = vec4<f32>(pos, 0.0, 1.0);
    output.uv = uv;
    return output;
}

// === FRAGMENT SHADER FOR HUD OVERLAY ===

@fragment
fn fragment_main(@location(0) uv: vec2<f32>) -> @location(0) vec4<f32> {
    // HUD background (semi-transparent)
    let hud_color = vec3<f32>(0.0, 0.0, 0.1);
    let hud_alpha = 0.8;
    
    // Border
    let border_width = 0.01;
    let border = step(uv.x, border_width) + step(1.0 - border_width, uv.x) +
                 step(uv.y, border_width) + step(1.0 - border_width, uv.y);
    
    var color = hud_color;
    if (border > 0.0) {
        color = vec3<f32>(0.2, 0.4, 0.6);
    }
    
    // Coherence indicator (bottom bar)
    if (uv.y < 0.05) {
        let coherence_fill = step(uv.x, uniforms.coherence);
        let coherence_color = mix(
            vec3<f32>(1.0, 0.0, 0.0),  // Red (low)
            vec3<f32>(0.0, 1.0, 0.0),  // Green (high)
            uniforms.coherence
        );
        color = mix(color, coherence_color, coherence_fill);
    }
    
    return vec4<f32>(color, hud_alpha);
}

// === COMPUTE SHADER FOR EXECUTION SIMULATION ===

struct ExecutionState {
    ip: u32,              // Instruction pointer (grid position)
    sp: u32,              // Stack pointer
    tick: u32,            // Current tick
    status: u32,          // Status flags
    stack: array<u32, 16>, // Stack (16 slots)
}

@group(1) @binding(0) var<storage, read_write> exec_state: ExecutionState;
@group(1) @binding(1) var<storage, read> program: array<u32>;

@compute @workgroup_size(1, 1, 1)
fn execute_tick() {
    // Fetch current instruction
    let op = program[exec_state.ip];
    
    // Decode and execute
    switch (op) {
        case 0x01u: { // LoadConst
            // Push next value to stack
            exec_state.stack[exec_state.sp] = program[exec_state.ip + 1u];
            exec_state.sp = (exec_state.sp + 1u) % 16u;
            exec_state.ip += 2u;
        }
        case 0x10u: { // Add
            // Pop two, push sum
            let a = exec_state.stack[(exec_state.sp + 15u) % 16u];
            let b = exec_state.stack[(exec_state.sp + 14u) % 16u];
            exec_state.stack[(exec_state.sp + 14u) % 16u] = a + b;
            exec_state.sp = (exec_state.sp + 15u) % 16u;
            exec_state.ip += 1u;
        }
        case 0x40u: { // Print
            // Mark for output (handled by host)
            exec_state.status = 0x01u; // OUTPUT_READY
            exec_state.ip += 1u;
        }
        case 0x3Fu: { // Halt
            exec_state.status = 0xFFu; // HALTED
        }
        default: {
            exec_state.ip += 1u; // Skip unknown
        }
    }
    
    exec_state.tick += 1u;
    
    // Update execution position for visualization
    // (would write to uniforms.execution_tick)
}

// === SHADER FOR STRUCTURE DETECTION ===

struct DetectedStructure {
    center: vec2<u32>,
    size: u32,
    structure_type: u32,
    data: u32,
}

@group(2) @binding(0) var<storage, read_write> structures: array<DetectedStructure>;
@group(2) @binding(1) var<storage, read_write> structure_count: atomic<u32>;

@compute @workgroup_size(16, 16, 1)
fn detect_structures(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    
    // Sample center of 24x24 region
    if (x % 12u == 0u && y % 12u == 0u) {
        // Check for 3x3 structures
        var has_structure = false;
        var structure_type = 0u;
        
        // Sample layer 0
        let pixel_value = textureLoad(pixel_map[0], vec2<u32>(x, y), 0).r;
        
        if (pixel_value >= 0x01u && pixel_value <= 0x09u) {
            has_structure = true;
            structure_type = pixel_value;
        }
        
        if (has_structure) {
            let idx = atomicAdd(&structure_count, 1u);
            if (idx < 1000u) { // Max 1000 structures
                structures[idx] = DetectedStructure(
                    vec2<u32>(x, y),
                    3u,
                    structure_type,
                    0u
                );
            }
        }
    }
}

// === COHERENCE CALCULATION ===

@compute @workgroup_size(1, 1, 1)
fn calculate_coherence() {
    // Count active structures vs expected
    let count = atomicLoad(&structure_count);
    
    // Simple coherence metric
    // In reality would check execution success rate, memory integrity, etc.
    let expected_structures = 50u;
    let ratio = min(f32(count) / f32(expected_structures), 1.0);
    
    // Would update uniforms.coherence
    // uniforms.coherence = ratio; (can't write to uniforms, would use separate buffer)
}
