// gqr_visualizer.wgsl - The Sovereign Signal
// 
// Creates the 12Hz "Alpha" pulse for active GQR blocks
// Static GQR = stored memory
// Shimmering GQR = living instruction awaiting ratification

struct GqrVisualizerUniforms {
    time: f32,              // Current time (seconds)
    fb_width: u32,
    fb_height: u32,
    shimmer_frequency: f32, // Default 12Hz (Alpha rhythm)
}

struct GqrBlock {
    intent: u32,
    x: u32,
    y: u32,
    size: u32,
    state: u32,  // 0=static, 1=pending, 2=ratified, 3=executing
    created_time: f32,
    shimmer_phase: f32,
}

struct GqrRegistry {
    count: u32,
    blocks: array<GqrBlock, 64>,
}

@group(0) @binding(0) var<uniform> uniforms: GqrVisualizerUniforms;
@group(0) @binding(1) var<storage, read_write> framebuffer: array<u32>;
@group(0) @binding(2) var<storage, read> registry: GqrRegistry;

// Intent colors (must match encoder/decoder)
fn get_intent_color(intent: u32, state: u32) -> vec3<f32> {
    // Base colors by intent
    var base = vec3<f32>(0.0, 0.0, 0.0);
    
    if (intent == 0u) {        // DataConstant
        base = vec3<f32>(0.392, 0.392, 1.0);    // Blue
    } else if (intent == 1u) {  // ProcessorNode
        base = vec3<f32>(0.392, 1.0, 0.392);    // Green
    } else if (intent == 2u) {  // BusPathway
        base = vec3<f32>(1.0, 1.0, 0.392);      // Yellow
    } else if (intent == 3u) {  // ExecutiveOrder
        base = vec3<f32>(1.0, 0.392, 1.0);      // Magenta
    } else if (intent == 4u) {  // MemoryArchive
        base = vec3<f32>(0.392, 1.0, 1.0);      // Cyan
    } else if (intent == 5u) {  // VetoZone
        base = vec3<f32>(1.0, 0.196, 0.196);    // Red
    } else if (intent == 6u) {  // ContractProposal
        base = vec3<f32>(0.784, 0.588, 1.0);    // Purple (violet)
    }
    
    // Modify based on state
    if (state == 1u) {
        // Pending: Violet hue, slow pulse
        base = mix(base, vec3<f32>(0.6, 0.3, 1.0), 0.5);
    } else if (state == 2u) {
        // Ratified: Golden pulse
        base = mix(base, vec3<f32>(1.0, 0.843, 0.0), 0.7);
    } else if (state == 3u) {
        // Executing: Bright white pulse
        base = mix(base, vec3<f32>(1.0, 1.0, 1.0), 0.5);
    }
    
    return base;
}

// Calculate shimmer intensity for a pixel
fn calculate_shimmer(state: u32, time: f32, phase: f32, frequency: f32) -> f32 {
    if (state == 0u) {
        // Static: no shimmer
        return 1.0;
    }
    
    // Calculate oscillation based on state
    var freq = frequency;
    if (state == 1u) {
        // Pending: slow pulse (6Hz)
        freq = 6.0;
    } else if (state == 2u) {
        // Ratified: double frequency (24Hz)
        freq = frequency * 2.0;
    } else if (state == 3u) {
        // Executing: triple frequency (36Hz)
        freq = frequency * 3.0;
    }
    
    // Sine wave oscillation
    let oscillation = sin((time * freq * 6.28318) + phase);
    return 0.7 + (oscillation * 0.3); // Range: 0.4 - 1.0
}

// Check if pixel is a parity pixel (corner of finder pattern)
fn is_parity_pixel(local_x: u32, local_y: u32, size: u32) -> bool {
    let s = size;
    let is_corner = (local_x == 0u && local_y == 0u) ||
                    (local_x == s - 1u && local_y == 0u) ||
                    (local_x == 0u && local_y == s - 1u) ||
                    (local_x == s - 1u && local_y == s - 1u);
    return is_corner;
}

// Check if pixel is an edge pixel (part of finder frame)
fn is_edge_pixel(local_x: u32, local_y: u32, size: u32) -> bool {
    let s = size;
    let on_edge = (local_x == 0u || local_x == s - 1u || 
                   local_y == 0u || local_y == s - 1u);
    let is_center = (local_x == s / 2u && local_y == s / 2u);
    return on_edge && !is_center;
}

// Main compute shader: Apply shimmer to GQR blocks
@compute @workgroup_size(8, 8)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let px = global_id.x;
    let py = global_id.y;
    
    if (px >= uniforms.fb_width || py >= uniforms.fb_height) {
        return;
    }
    
    let idx = (py * uniforms.fb_width + px) * 4u;
    
    // Check if this pixel is part of any GQR block
    for (var i = 0u; i < registry.count; i++) {
        let block = registry.blocks[i];
        let bx = block.x;
        let by = block.y;
        let bs = block.size;
        
        // Check if pixel is within this block
        if (px >= bx && px < bx + bs && py >= by && py < by + bs) {
            let local_x = px - bx;
            let local_y = py - by;
            
            // Get base color
            let base_color = get_intent_color(block.intent, block.state);
            
            // Calculate shimmer
            let shimmer = calculate_shimmer(
                block.state,
                uniforms.time,
                block.shimmer_phase,
                uniforms.shimmer_frequency
            );
            
            // Apply shimmer to color
            var r = base_color.r * shimmer;
            var g = base_color.g * shimmer;
            var b = base_color.b * shimmer;
            var a = 1.0;
            
            // Special effects for parity pixels
            if (is_parity_pixel(local_x, local_y, bs)) {
                // Parity pixels have extra pulse
                let parity_shimmer = sin(uniforms.time * 24.0 + f32(i)) * 0.2 + 0.8;
                r *= parity_shimmer;
                g *= parity_shimmer;
                b *= parity_shimmer;
                
                // Encode parity in alpha (XOR pattern)
                let parity_bit = u32(sin(uniforms.time * 12.0) * 1000.0) % 2u;
                if ((local_x == 0u) == (local_y == 0u)) {
                    a = 0.5 + f32(parity_bit) * 0.5;
                } else {
                    a = 1.0 - f32(parity_bit) * 0.5;
                }
            }
            
            // Edge pixels (finder frame) - solid
            if (is_edge_pixel(local_x, local_y, bs) && !is_parity_pixel(local_x, local_y, bs)) {
                // Keep edges relatively stable
                let edge_factor = 0.9 + shimmer * 0.1;
                r = base_color.r * edge_factor;
                g = base_color.g * edge_factor;
                b = base_color.b * edge_factor;
            }
            
            // Center pixel (payload) - high contrast
            if (local_x == bs / 2u && local_y == bs / 2u) {
                // Payload is always bright
                r = min(r * 1.2, 1.0);
                g = min(g * 1.2, 1.0);
                b = min(b * 1.2, 1.0);
            }
            
            // Write to framebuffer
            framebuffer[idx] = u32(r * 255.0);
            framebuffer[idx + 1u] = u32(g * 255.0);
            framebuffer[idx + 2u] = u32(b * 255.0);
            framebuffer[idx + 3u] = u32(a * 255.0);
            
            return; // Only render for first matching block
        }
    }
}

// Fragment shader for rendering GQR blocks with shimmer
@fragment
fn fragment_shader(
    @builtin(position) pos: vec4<f32>,
    @location(0) uv: vec2<f32>
) -> @location(0) vec4<f32> {
    // This would be used in a render pipeline
    // For compute shader approach, see main() above
    return vec4<f32>(1.0, 1.0, 1.0, 1.0);
}
