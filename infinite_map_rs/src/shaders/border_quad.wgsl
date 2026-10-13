// ============================================
// Phase 42: Border Quad Shader
// Renders colored tile borders for compilation feedback
// Colors: Yellow (Compiling) -> Green (Success) -> Red (Error)
// ============================================

struct BorderUniforms {
    // Tile position in world coordinates (top-left)
    tile_pos: vec2<f32>,
    // Tile size in pixels
    tile_size: vec2<f32>,
    // Border thickness in pixels
    border_thickness: f32,
    // Padding to align to 16 bytes
    _pad1: f32,
    // Border color (r, g, b, a)
    border_color: vec4<f32>,
    // Screen dimensions
    screen_size: vec2<f32>,
    // Padding to align total struct to 16 bytes
    _pad2: vec2<f32>,
}

@group(0) @binding(0)
var<uniform> uniforms: BorderUniforms;

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> @builtin(position) vec4<f32> {
    // Full-screen quad covering the entire tile area
    // We'll compute border in the fragment shader
    var positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(1.0, 1.0)
    );

    let pos = positions[vertex_index];
    return vec4<f32>(pos, 0.0, 1.0);
}

@fragment
fn fs_main(@builtin(position) frag_coord: vec4<f32>) -> @location(0) vec4<f32> {
    // Convert fragment coordinate to tile-relative coordinates
    let screen_pos = frag_coord.xy;
    let tile_min = uniforms.tile_pos;
    let tile_max = uniforms.tile_pos + uniforms.tile_size;

    // Check if we're inside the tile
    if (screen_pos.x < tile_min.x || screen_pos.x > tile_max.x ||
        screen_pos.y < tile_min.y || screen_pos.y > tile_max.y) {
        // Outside tile - discard
        discard;
    }

    // Calculate distance from edges
    let dist_left = screen_pos.x - tile_min.x;
    let dist_right = tile_max.x - screen_pos.x;
    let dist_top = screen_pos.y - tile_min.y;
    let dist_bottom = tile_max.y - screen_pos.y;

    let min_dist = min(min(dist_left, dist_right), min(dist_top, dist_bottom));

    // Render border if within border thickness
    if (min_dist < uniforms.border_thickness) {
        // Apply smooth anti-aliasing at border edge
        let alpha = smoothstep(0.0, 1.0, min_dist);
        return vec4<f32>(uniforms.border_color.rgb, uniforms.border_color.a * (1.0 - alpha));
    }

    // Inside tile - transparent
    discard;
}
