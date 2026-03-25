// framebuffer.wgsl - The Visual Cortex Compositor
// Phase 25: 3-layer composite rendering

struct FramebufferConfig {
    screen_width: u32,
    screen_height: u32,
    layer0_opacity: f32,  // Physical layer
    layer1_opacity: f32,  // Semantic layer
    layer2_opacity: f32,  // Logic layer
    layer3_opacity: f32,  // Executive layer (NEW)
    dissonance_overlay: f32, // Red glitch intensity
}

@group(0) @binding(0) var<uniform> config: FramebufferConfig;
@group(0) @binding(1) var<storage, read> physical_layer: array<u32>;   // L0
@group(0) @binding(2) var<storage, read> semantic_layer: array<u32>;   // L1
@group(0) @binding(3) var<storage, read> logic_layer: array<u32>;      // L2
@group(0) @binding(4) var<storage, read> executive_layer: array<u32>;  // L3
@group(0) @binding(5) var<storage, read> coherence_map: array<f32>;    // Awareness map
@group(0) @binding(6) var<storage, read_write> output_texture: array<vec4<f32>>;

// Fragment shader for compositing layers
@fragment
fn fs_main(@builtin(position) pos: vec4<f32>) -> @location(0) vec4<f32> {
    let x = u32(pos.x);
    let y = u32(pos.y);
    let idx = x + y * config.screen_width;
    
    // 1. Fetch data from all 4 layers
    let p_val = f32(physical_layer[idx % arrayLength(&physical_layer)]) / 255.0;
    let s_val = f32(semantic_layer[idx % arrayLength(&semantic_layer)]) / 255.0;
    let l_val = f32(logic_layer[idx % array_length(&logic_layer)]) / 255.0;
    let e_val = f32(executive_layer[idx % arrayLength(&executive_layer)]) / 255.0;
    let coherence = coherence_map[idx % arrayLength(&coherence_map)];
    
    // 2. Layer color mapping
    // L0: Dark blue/gray (Physical substrate)
    let physical_color = vec3<f32>(0.05, 0.1, 0.15) * p_val * config.layer0_opacity;
    
    // L1: Sharp white (Semantic glyphs)
    let semantic_color = vec3<f32>(1.0, 1.0, 1.0) * s_val * config.layer1_opacity;
    
    // L2: Neon cyan (Logic gates)
    let logic_color = vec3<f32>(0.0, 0.9, 1.0) * l_val * config.layer2_opacity;
    
    // L3: Neon violet (Executive directives)
    let executive_color = vec3<f32>(0.8, 0.2, 1.0) * e_val * config.layer3_opacity;
    
    // 3. Dissonance overlay (red glitch)
    var dissonance_color = vec3<f32>(0.0);
    if coherence < 0.7 {
        let glitch = sin(f32(idx) * 0.1) * 0.5 + 0.5;
        dissonance_color = vec3<f32>(1.0, 0.0, 0.0) * (1.0 - coherence) * glitch * config.dissonance_overlay;
    }
    
    // 4. Composite all layers
    let final_color = physical_color + semantic_color + logic_color + executive_color + dissonance_color;
    
    // 5. Awareness glow (golden pulse for high coherence)
    var awareness_glow = vec3<f32>(0.0);
    if coherence > 0.85 {
        let pulse = sin(f32(idx) * 0.05) * 0.5 + 0.5;
        awareness_glow = vec3<f32>(1.0, 0.85, 0.0) * pulse * 0.1; // Golden glow
    }
    
    return vec4<f32>(final_color + awareness_glow, 1.0);
}

// Compute shader for updating coherence map
@compute @workgroup_size(16, 16)
fn update_coherence(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    let idx = x + y * config.screen_width;
    
    if idx >= arrayLength(&coherence_map) {
        return;
    }
    
    // Compare logic layer with semantic layer
    let logic_val = logic_layer[idx % arrayLength(&logic_layer)];
    let semantic_val = semantic_layer[idx % arrayLength(&semantic_layer)];
    
    // Local coherence: how well logic matches semantics
    let diff = abs(f32(logic_val) - f32(semantic_val)) / 255.0;
    coherence_map[idx] = 1.0 - diff;
}

// Compute shader for executive goal vectors
@compute @workgroup_size(8, 8)
fn compute_goals(@builtin(global_invocation_id) id: vec3<u32>) {
    let idx = id.x + id.y * 64u; // 64x64 executive grid
    
    if idx >= arrayLength(&executive_layer) {
        return;
    }
    
    // Calculate average coherence across the system
    var total_coherence: f32 = 0.0;
    let sample_size = 100u;
    
    for (var i = 0u; i < sample_size; i++) {
        let sample_idx = (idx * sample_size + i) % arrayLength(&coherence_map);
        total_coherence = total_coherence + coherence_map[sample_idx];
    }
    
    let avg_coherence = total_coherence / f32(sample_size);
    
    // Executive encoding:
    // 0x00 = IDLE
    // 0x01 = OPTIMIZE_PERFORMANCE
    // 0x02 = DEEP_LEARNING
    // 0x03 = EXPAND_COLLECTIVE
    // 0x04 = REPAIR
    
    if avg_coherence < 0.7 {
        executive_layer[idx] = 0x04u; // REPAIR
    } else if avg_coherence < 0.8 {
        executive_layer[idx] = 0x02u; // DEEP_LEARNING
    } else if avg_coherence < 0.9 {
        executive_layer[idx] = 0x01u; // OPTIMIZE_PERFORMANCE
    } else {
        executive_layer[idx] = 0x03u; // EXPAND_COLLECTIVE
    }
}
