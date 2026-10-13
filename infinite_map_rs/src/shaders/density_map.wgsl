// systems/infinite_map_rs/src/shaders/density_map.wgsl
//
// Phase 33.4: Density Map Shader
// Renders the compressed sensing density map as a heat map visualization

struct Uniforms {
    screen_size: vec2<f32>,
    texture_size: vec2<f32>,
    max_density: f32,
    show_grid: f32,
    grid_opacity: f32,
    _padding: vec2<f32>,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

@group(0) @binding(1)
var density_texture: texture_2d<f32>;

@group(0) @binding(2)
var density_sampler: sampler;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    // Full-screen quad
    var positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(1.0, 1.0)
    );

    var pos = positions[vertex_index];
    var output: VertexOutput;
    output.position = vec4<f32>(pos, 0.0, 1.0);
    output.uv = (pos + 1.0) * 0.5;
    output.uv.y = 1.0 - output.uv.y; // Flip Y
    return output;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Sample density texture
    let density_color = textureSample(density_texture, density_sampler, in.uv);

    // Add grid overlay
    var final_color = density_color;

    if (uniforms.show_grid > 0.5) {
        let grid_size = 32.0; // Grid cells
        let grid_uv = in.uv * uniforms.texture_size / grid_size;
        let grid_line = step(0.95, fract(grid_uv.x)) + step(0.95, fract(grid_uv.y));

        if (grid_line > 0.5) {
            final_color = mix(final_color, vec4<f32>(1.0, 1.0, 1.0, 1.0), uniforms.grid_opacity);
        }
    }

    // Add subtle vignette
    let center = vec2<f32>(0.5, 0.5);
    let dist = distance(in.uv, center);
    let vignette = 1.0 - smoothstep(0.3, 0.7, dist);
    final_color.rgb *= vignette;

    return final_color;
}
