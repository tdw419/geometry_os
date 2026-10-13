// memory_artifacts.wgsl
// Shader for rendering 3D memory artifacts
// Phase 33 Step 3: Live Memory Updates with enhanced visualization
//
// This shader renders 3D geometric representations of memory regions:
// - Heaps as translucent blocks
// - Stacks as vertical towers
// - Code segments as crystalline pillars
// - Data regions as platforms
//
// Enhanced with pulse animation and entropy-based glow effects

struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) color: vec4<f32>,
    @location(2) uv: vec2<f32>,
}

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) uv: vec2<f32>,
}

struct FragmentOutput {
    @location(0) color: vec4<f32>,
}

// Uniforms
struct Uniforms {
    // View-projection matrix
    view_proj: mat4x4<f32>,
    // Model matrix
    model: mat4x4<f32>,
    // Time for animation
    time: f32,
    // Entropy threshold for visualization
    entropy_threshold: f32,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

@vertex
fn vs_main(vertex: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    // Apply model matrix
    let world_pos = uniforms.model * vec4<f32>(vertex.position, 1.0);

    // Apply view-projection matrix
    output.clip_position = uniforms.view_proj * world_pos;

    // Pass through color and UV
    output.color = vertex.color;
    output.uv = vertex.uv;

    return output;
}

@fragment
fn fs_main(fragment: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;

    // Base color from vertex
    var color = fragment.color;

    // Add subtle gradient based on UV
    let gradient = 1.0 - fragment.uv.y * 0.3;
    color.r *= gradient;
    color.g *= gradient;
    color.b *= gradient;

    // Phase 33 Step 3: Enhanced pulse animation with multiple frequencies
    // Primary pulse: slow breathing effect
    let pulse_slow = sin(uniforms.time * 1.5) * 0.08 + 0.92;
    // Secondary pulse: faster shimmer effect
    let pulse_fast = sin(uniforms.time * 4.0 + fragment.uv.x * 10.0 + fragment.uv.y * 10.0) * 0.03 + 0.97;
    // Combine pulses
    let combined_pulse = pulse_slow * pulse_fast;
    color.r *= combined_pulse;
    color.g *= combined_pulse;
    color.b *= combined_pulse;

    // Add edge glow effect with enhanced intensity
    let edge_dist = min(min(fragment.uv.x, 1.0 - fragment.uv.x),
                         min(fragment.uv.y, 1.0 - fragment.uv.y));
    let edge_glow = smoothstep(0.0, 0.15, edge_dist);

    // Phase 33 Step 3: Enhanced entropy-based highlighting with color shifting
    let entropy_factor = smoothstep(uniforms.entropy_threshold - 1.0,
                                  uniforms.entropy_threshold + 1.0,
                                  edge_glow * 8.0);

    // Dynamic glow color based on entropy
    // Low entropy: blue/cyan glow (cold, stable memory)
    // High entropy: orange/red glow (hot, active memory)
    let entropy_glow_color = mix(
        vec3<f32>(0.1, 0.3, 0.5),  // Low entropy: blue-ish
        vec3<f32>(0.8, 0.4, 0.2),  // High entropy: orange-ish
        entropy_factor * 0.5
    );

    // Add entropy glow with intensity modulation
    let entropy_glow_intensity = 0.4 + sin(uniforms.time * 3.0) * 0.1;
    let entropy_glow = entropy_glow_color * entropy_glow_intensity * edge_glow;
    color.r += entropy_glow.r;
    color.g += entropy_glow.g;
    color.b += entropy_glow.b;

    // Add subtle scanline effect for "digital" feel
    let scanline = sin(fragment.uv.y * 100.0 + uniforms.time * 2.0) * 0.02;
    color.r += scanline;
    color.g += scanline;
    color.b += scanline;

    // Add subtle noise for texture
    let noise = fract(sin(dot(fragment.uv, vec2<f32>(12.9898, 78.233)) * 43758.5453));
    let noise_value = noise * 0.01;
    color.r += noise_value;
    color.g += noise_value;
    color.b += noise_value;

    output.color = color;

    return output;
}
