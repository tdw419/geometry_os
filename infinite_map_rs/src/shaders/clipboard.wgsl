// src/shaders/clipboard.wgsl
// Phase 31.2: RTS Clipboard Visualization Shader
// Renders clipboard.rts texture as a visual artifact on the infinite map
// Cyberpunk aesthetic: clipboard history visible as "data-noise"

struct ClipboardUniforms {
    // Screen position (world coordinates)
    screen_pos: vec2<f32>,
    // Screen size (pixels)
    screen_size: vec2<f32>,
    // Clipboard texture size (pixels)
    texture_size: vec2<f32>,
    // Time for animation effects
    time: f32,
    // Opacity (0.0 - 1.0)
    opacity: f32,
    // Clipboard active state (0.0 = inactive, 1.0 = active)
    active: f32,
};

@group(0) @binding(0)
var clipboard_texture: texture_2d<f32>;

@group(0) @binding(1)
var clipboard_sampler: sampler;

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

// Cyberpunk color palette
fn get_cyberpunk_color(intensity: f32) -> vec3<f32> {
    // Interpolate between cyan and magenta based on intensity
    let cyan = vec3<f32>(0.0, 1.0, 1.0);
    let magenta = vec3<f32>(1.0, 0.0, 1.0);
    let yellow = vec3<f32>(1.0, 1.0, 0.0);
    
    if (intensity < 0.33) {
        return mix(cyan, magenta, intensity * 3.0);
    } else if (intensity < 0.66) {
        return mix(magenta, yellow, (intensity - 0.33) * 3.0);
    } else {
        return mix(yellow, vec3<f32>(1.0, 1.0, 1.0), (intensity - 0.66) * 3.0);
    }
}

// Scanline effect
fn scanline(uv: vec2<f32>, time: f32) -> f32 {
    let scanline_y = uv.y * 100.0;
    let scanline = sin(scanline_y + time * 5.0) * 0.5 + 0.5;
    return scanline * 0.1; // Subtle effect
}

// Glitch effect
fn glitch(uv: vec2<f32>, time: f32) -> vec2<f32> {
    let glitch_intensity = sin(time * 3.0) * 0.5 + 0.5;
    let glitch_offset = vec2<f32>(
        sin(uv.y * 10.0 + time * 2.0) * glitch_intensity * 0.02,
        cos(uv.x * 10.0 + time * 2.0) * glitch_intensity * 0.02
    );
    return uv + glitch_offset;
}

// Data noise pattern
fn data_noise(uv: vec2<f32>, time: f32) -> f32 {
    let noise = sin(uv.x * 50.0 + time) * cos(uv.y * 50.0 + time * 1.5);
    return noise * 0.5 + 0.5;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Apply glitch effect
    let glitched_uv = glitch(in.uv, uniforms.time);
    
    // Sample clipboard texture
    let tex_color = textureSample(clipboard_texture, clipboard_sampler, glitched_uv);
    
    // Calculate intensity based on pixel brightness
    let brightness = (tex_color.r + tex_color.g + tex_color.b) / 3.0;
    
    // Apply cyberpunk color mapping
    let cyber_color = get_cyberpunk_color(brightness);
    
    // Apply scanline effect
    let scanline = scanline(in.uv, uniforms.time);
    
    // Apply data noise
    let noise = data_noise(in.uv, uniforms.time);
    
    // Combine effects
    let final_color = cyber_color + scanline + noise * 0.1;
    
    // Apply active state glow
    let glow = uniforms.active * 0.2;
    let final_with_glow = final_color + vec3<f32>(glow, glow, glow * 1.5);
    
    // Apply opacity
    let alpha = tex_color.a * uniforms.opacity;
    
    // Add border effect (cyberpunk frame)
    let border_width = 0.02;
    let border = step(border_width, in.uv.x) * step(border_width, 1.0 - in.uv.x) *
                 step(border_width, in.uv.y) * step(border_width, 1.0 - in.uv.y);
    let border_color = vec3<f32>(0.0, 1.0, 1.0) * border * 0.5;
    
    let final_rgb = final_with_glow + border_color;
    
    return vec4<f32>(final_rgb, alpha);
}
