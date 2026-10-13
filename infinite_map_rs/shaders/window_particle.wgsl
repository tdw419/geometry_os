// Window Particle Shader
// Renders window chrome with Geometry OS aesthetic
// "The UI is the computer" - color-coded border reflects VM state

// Uniforms: [camera_x, camera_y, camera_zoom, screen_width, screen_height, 0.0, 0.0, 0.0]
struct Uniforms {
    camera_x: f32,
    camera_y: f32,
    camera_zoom: f32,
    screen_width: f32,
    screen_height: f32,
    _pad0: f32,
    _pad1: f32,
    _pad2: f32,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

// Vertex input for unit quad
struct VertexInput {
    @location(0) position: vec2<f32>,
    @location(1) uv: vec2<f32>,
}

// Instance input for each window particle
struct InstanceInput {
    @location(2) world_pos: vec2<f32>,
    @location(3) size: vec2<f32>,
    @location(4) border_color: vec4<f32>,
    @location(5) background_color: vec4<f32>,
    @location(6) z_layer: u32,
    @location(7) particle_id: u32,
}

struct VertexOutput {
    @builtin(position) clip_pos: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) border_color: vec4<f32>,
    @location(2) background_color: vec4<f32>,
    @location(3) z_layer: f32,
}

// Convert world-space to screen-space coordinates
fn world_to_screen(world_pos: vec2<f32>) -> vec2<f32> {
    let center = vec2<f32>(uniforms.screen_width, uniforms.screen_height) * 0.5;
    let offset = (world_pos - vec2<f32>(uniforms.camera_x, uniforms.camera_y)) * uniforms.camera_zoom;
    return center + offset;
}

@vertex
fn vs_main(
    vertex: VertexInput,
    instance: InstanceInput,
) -> VertexOutput {
    // Skip empty particles
    if (instance.particle_id == 0xFFFF_FFFFu) {
        var out: VertexOutput;
        out.clip_pos = vec4<f32>(0.0, 0.0, 2.0, 1.0); // Outside clip space
        out.uv = vertex.uv;
        out.border_color = instance.border_color;
        out.background_color = instance.background_color;
        out.z_layer = f32(instance.z_layer);
        return out;
    }

    // Scale unit quad to window size and translate to world position
    let world_bottom_left = instance.world_pos;
    let world_top_right = instance.world_pos + instance.size;
    let world_size = world_top_right - world_bottom_left;

    // Interpolate unit quad position to world position
    let world_vertex_pos = mix(world_bottom_left, world_top_right, vertex.position);

    // Convert to screen space
    let screen_pos = world_to_screen(world_vertex_pos);

    // Convert to clip space (OpenGL-style, y-up)
    let clip_x = (screen_pos.x / uniforms.screen_width) * 2.0 - 1.0;
    let clip_y = 1.0 - (screen_pos.y / uniforms.screen_height) * 2.0;

    var out: VertexOutput;
    out.clip_pos = vec4<f32>(clip_x, clip_y, 0.0, 1.0);
    out.uv = vertex.uv;
    out.border_color = instance.border_color;
    out.background_color = instance.background_color;
    out.z_layer = f32(instance.z_layer);
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Skip empty particles
    if (in.z_layer < 0.0) {
        return vec4<f32>(0.0);
    }

    // Window chrome geometry
    // UV space: (0,0) = bottom-left, (1,1) = top-right
    let border_width = 0.02; // 2% of window size

    // Determine if we're in border region
    let is_left_border = in.uv.x < border_width;
    let is_right_border = in.uv.x > (1.0 - border_width);
    let is_bottom_border = in.uv.y < border_width;
    let is_top_border = in.uv.y > (1.0 - border_width);

    let in_border = is_left_border || is_right_border || is_bottom_border || is_top_border;
    let in_background = !in_border;

    // Anti-aliasing for edges
    let aa_width = 0.005;
    let left_edge = smoothstep(0.0, aa_width, in.uv.x);
    let right_edge = 1.0 - smoothstep(1.0 - border_width, 1.0, in.uv.x);
    let bottom_edge = smoothstep(0.0, aa_width, in.uv.y);
    let top_edge = 1.0 - smoothstep(1.0 - border_width, 1.0, in.uv.y);

    // Calculate border alpha with anti-aliasing
    let border_alpha = min(
        min(left_edge, right_edge),
        min(bottom_edge, top_edge)
    );

    // Calculate background alpha
    let bg_alpha = min(
        min(smoothstep(border_width - aa_width, border_width, in.uv.x),
            smoothstep(1.0 - border_width, 1.0 - border_width + aa_width, in.uv.x)),
        min(smoothstep(border_width - aa_width, border_width, in.uv.y),
            smoothstep(1.0 - border_width, 1.0 - border_width + aa_width, in.uv.y))
    );

    // Apply slight corner rounding
    let corner_radius = 0.03;
    let corner_uv = abs(in.uv - 0.5) * 2.0;
    let dist_from_corner = length(max(corner_uv - vec2<f32>(1.0 - corner_radius), vec2<f32>(0.0)));
    let corner_alpha = 1.0 - smoothstep(0.0, aa_width, dist_from_corner - corner_radius);

    // Combine colors with alpha
    let border = in.border_color * border_alpha * corner_alpha;
    let background = in.background_color * bg_alpha * corner_alpha;

    return border + background;
}