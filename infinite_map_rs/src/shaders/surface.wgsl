// src/shaders/surface.wgsl

struct SurfaceUniforms {
    screen_pos: vec2<f32>,
    screen_size: vec2<f32>,
    texture_size: vec2<f32>,
};

@group(0) @binding(0)
var surface_texture: texture_2d<f32>;

@group(0) @binding(1)
var surface_sampler: sampler;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var out: VertexOutput;
    
    // Full-screen quad
    var positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(1.0, 1.0)
    );
    
    var uvs = array<vec2<f32>, 6>(
        vec2<f32>(0.0, 1.0),
        vec2<f32>(1.0, 1.0),
        vec2<f32>(0.0, 0.0),
        vec2<f32>(0.0, 0.0),
        vec2<f32>(1.0, 1.0),
        vec2<f32>(1.0, 0.0)
    );
    
    let pos = positions[vertex_index];
    out.position = vec4<f32>(pos, 0.0, 1.0);
    out.uv = uvs[vertex_index];
    
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // 1. Sample Texture
    var color = textureSample(surface_texture, surface_sampler, in.uv);
    
    // 2. Scanline Effect (Screen Space)
    // Use pixel coordinates (in.position.xy) for pixel-perfect scanlines
    // Darken every other line (or smooth sine wave)
    let scanline_intensity = 0.15;
    let scanline = sin(in.position.y * 3.14159) * scanline_intensity;
    color = vec4<f32>(color.rgb - scanline, color.a);
    
    // 3. Vignette (UV Space)
    // Darken corners to simulate curved screen
    let uv = in.uv * (1.0 - in.uv.yx);
    let vig = uv.x * uv.y * 25.0; // 15.0 - 25.0 range
    let vig_val = pow(vig, 0.15); // Power sets falloff
    color = vec4<f32>(color.rgb * vig_val, color.a);

    // 4. Subtle Glow / Bloom (Fake)
    // Boost bright pixels slightly
    let brightness = dot(color.rgb, vec3<f32>(0.299, 0.587, 0.114));
    if (brightness > 0.8) {
        color = vec4<f32>(color.rgb * 1.1, color.a);
    }
    
    // 5. Color Grading (Cyberpunk Tinge)
    // Slight shift towards cyan/teal for shadows
    let shadow_tint = vec3<f32>(0.0, 0.02, 0.05);
    color = vec4<f32>(color.rgb + shadow_tint * (1.0 - brightness), color.a);

    return color;
}

// Glass Effect for Pixel Panels
fn fs_glass_panel(in: VertexOutput, u_time: f32, u_alpha: f32) -> vec4<f32> {
    var color = textureSample(surface_texture, surface_sampler, in.uv);
    
    // Glass edge glow effect
    let uv = in.uv;
    let edge_dist = distance(vec2<f32>(0.5, 0.5), uv);
    let edge_alpha = 1.0 - smoothstep(0.4, 0.5, edge_dist) * 0.5;
    let glass_reflection = vec3<f32>(0.1, 0.15, 0.3) * edge_alpha;
    
    // Combine with glass effect
    color = vec4<f32>(color.rgb + glass_reflection, color.a);
    
    return color;
}
