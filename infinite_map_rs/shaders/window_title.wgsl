// Window Title Shader
// Renders window titles using glyph atlas with world-space positioning

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

@group(0) @binding(1)
var font_atlas: texture_2d<f32>;

@group(0) @binding(2)
var font_sampler: sampler;

// Glyph metrics
struct GlyphMetrics {
    uv_min_x: f32,
    uv_min_y: f32,
    uv_max_x: f32,
    uv_max_y: f32,
    width: f32,
    height: f32,
    bearing_x: f32,
    bearing_y: f32,
    advance: f32,
}

@group(0) @binding(3)
var<storage, read> glyph_metrics: array<GlyphMetrics>;

// Vertex input for text quads
struct VertexInput {
    @location(0) position: vec2<f32>,  // Quad position (0-1)
    @location(1) char_index: u32,       // Character code
    @location(2) world_x: f32,         // World-space position
    @location(3) world_y: f32,
    @location(4) char_offset_x: f32,   // Offset from title start
    @location(5) color: vec4<f32>,     // Text color
    @location(6) size: f32,            // Font size
}

struct VertexOutput {
    @builtin(position) clip_pos: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) color: vec4<f32>,
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
    @builtin(vertex_index) vertex_index: u32,
) -> VertexOutput {
    // Get glyph metrics for this character
    let metrics = glyph_metrics[vertex.char_index];

    // Calculate glyph quad position
    let glyph_size = vertex.size;
    let glyph_width = metrics.width * (glyph_size / 16.0);
    let glyph_height = metrics.height * (glyph_size / 16.0);

    // Position relative to character origin
    let local_x = mix(0.0, glyph_width, vertex.position.x);
    let local_y = mix(0.0, glyph_height, vertex.position.y);

    // Apply bearing (offset from baseline)
    let bearing_x = metrics.bearing_x * (glyph_size / 16.0);
    let bearing_y = metrics.bearing_y * (glyph_size / 16.0);

    // World-space position: window position + char offset + bearing + local
    let world_pos = vec2<f32>(
        vertex.world_x + vertex.char_offset_x + bearing_x + local_x,
        vertex.world_y + bearing_y + local_y
    );

    // Convert to screen space
    let screen_pos = world_to_screen(world_pos);

    // Convert to clip space
    let clip_x = (screen_pos.x / uniforms.screen_width) * 2.0 - 1.0;
    let clip_y = 1.0 - (screen_pos.y / uniforms.screen_height) * 2.0;

    // Calculate UV coordinates for glyph atlas
    let uv_x = mix(metrics.uv_min_x, metrics.uv_max_x, vertex.position.x);
    let uv_y = mix(metrics.uv_min_y, metrics.uv_max_y, vertex.position.y);

    var out: VertexOutput;
    out.clip_pos = vec4<f32>(clip_x, clip_y, 0.0, 1.0);
    out.uv = vec2<f32>(uv_x, uv_y);
    out.color = vertex.color;
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Sample glyph atlas
    let alpha = textureSample(font_atlas, font_sampler, in.uv).r;

    // Apply color with alpha
    return vec4<f32>(in.color.rgb, in.color.a * alpha);
}