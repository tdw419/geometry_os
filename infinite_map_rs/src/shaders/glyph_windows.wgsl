// ============================================
// Glyph Window Renderer Shader
// Renders VM windows as colored quads with borders
// Each window shows VM state: running (green), halted (red), waiting (yellow)
// ============================================

struct Uniforms {
    screen_size: vec2<f32>,
    _padding: vec2<f32>,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

// Vertex input from vertex buffer
struct VertexInput {
    @location(0) position: vec2<f32>,
    @location(1) tex_coords: vec2<f32>,
}

// Instance input from instance buffer
struct InstanceInput {
    @location(2) window_pos: vec2<f32>,
    @location(3) window_size: vec2<f32>,
    @location(4) border_color: vec4<f32>,
    @location(5) @interpolate(flat) vm_id: u32,
    @location(6) @interpolate(flat) state: u32,
}

struct VertexOutput {
    @builtin(position) clip_pos: vec4<f32>,
    @location(0) tex_coords: vec2<f32>,
    @location(1) @interpolate(flat) vm_id: u32,
    @location(2) @interpolate(flat) state: u32,
    @location(3) window_pos: vec2<f32>,
    @location(4) window_size: vec2<f32>,
    @location(5) border_color: vec4<f32>,
}

// Convert screen coordinates to clip space
fn screen_to_clip(screen_pos: vec2<f32>, screen_size: vec2<f32>) -> vec2<f32> {
    // Convert from pixels to normalized device coordinates (-1 to 1)
    let ndc = (screen_pos / screen_size) * 2.0 - 1.0;
    // Flip Y (screen Y goes down, NDC Y goes up)
    return vec2<f32>(ndc.x, -ndc.y);
}

@vertex
fn vs_main(
    vertex: VertexInput,
    instance: InstanceInput,
) -> VertexOutput {
    var output: VertexOutput;

    // Calculate actual position based on vertex position and instance window
    let pixel_pos = instance.window_pos + vertex.position * instance.window_size;

    output.clip_pos = vec4<f32>(
        screen_to_clip(pixel_pos, uniforms.screen_size),
        0.0,
        1.0
    );
    output.tex_coords = vertex.tex_coords;
    output.vm_id = instance.vm_id;
    output.state = instance.state;
    output.window_pos = instance.window_pos;
    output.window_size = instance.window_size;
    output.border_color = instance.border_color;

    return output;
}

@fragment
fn fs_main(input: VertexOutput) -> @location(0) vec4<f32> {
    // Skip rendering for inactive VMs (vm_id = 0xFF)
    if (input.vm_id == 0xFFu) {
        discard;
    }

    // Calculate window background color based on state
    var bg_color: vec4<f32>;
    if (input.state == 0u) {
        // Inactive - gray
        bg_color = vec4<f32>(0.1, 0.1, 0.1, 0.5);
    } else if (input.state == 1u) {
        // Running - green tint
        bg_color = vec4<f32>(0.05, 0.15, 0.05, 0.7);
    } else if (input.state == 2u) {
        // Halted - red tint
        bg_color = vec4<f32>(0.15, 0.05, 0.05, 0.7);
    } else {
        // Waiting - yellow tint
        bg_color = vec4<f32>(0.15, 0.15, 0.05, 0.7);
    }

    // Calculate distance from window edges for border
    let tex_pos = input.tex_coords * input.window_size;
    let border_thickness = 3.0;

    let dist_left = tex_pos.x;
    let dist_right = input.window_size.x - tex_pos.x;
    let dist_top = tex_pos.y;
    let dist_bottom = input.window_size.y - tex_pos.y;

    let min_dist = min(min(dist_left, dist_right), min(dist_top, dist_bottom));

    // Render border or background
    if (min_dist < border_thickness) {
        // Border with anti-aliasing
        let alpha = smoothstep(0.0, border_thickness, min_dist);
        let border = input.border_color;
        return mix(border, bg_color, alpha);
    }

    // Background with subtle pattern for VM ID
    let pattern = fract(sin(f32(input.vm_id) * 12.9898) * 43758.5453) * 0.05;
    return vec4<f32>(bg_color.rgb + pattern, bg_color.a);
}
