// Evolution Terrain Shader
// Renders evolved organisms as 3D terrain tiles in the Infinite Map
//
// Input: 32x32 pixel genome → Output: 256x256 terrain mesh

// Vertex shader uniforms
struct TerrainCameraUniform {
    view_proj: mat4x4<f32>,
    view_pos: vec3<f32>,
    _padding: f32,
};

struct TerrainConfig {
    height_scale: f32,
    terrain_size: f32,
    min_height: f32,
    max_height: f32,
};

@group(0) @binding(0)
var<uniform> camera: TerrainCameraUniform;

@group(0) @binding(1)
var<uniform> config: TerrainConfig;

// Fragment shader textures
@group(1) @binding(0)
var heightmap_texture: texture_2d<f32>;

@group(1) @binding(1)
var color_texture: texture_2d<f32>;

@group(1) @binding(2)
var texture_sampler: sampler;

// Vertex input
struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) uv: vec2<f32>,
};

// Vertex output / Fragment input
struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) world_position: vec3<f32>,
    @location(1) uv: vec2<f32>,
    @location(2) normal: vec3<f32>,
    @location(3) height: f32,
};

// Sample heightmap with bilinear filtering
fn sample_height(uv: vec2<f32>) -> f32 {
    return textureSampleLevel(heightmap_texture, texture_sampler, uv, 0.0).r;
}

// Calculate normal from heightmap using finite differences
fn calculate_normal(uv: vec2<f32>, texel_size: vec2<f32>) -> vec3<f32> {
    let left = sample_height(uv - vec2<f32>(texel_size.x, 0.0));
    let right = sample_height(uv + vec2<f32>(texel_size.x, 0.0));
    let up = sample_height(uv - vec2<f32>(0.0, texel_size.y));
    let down = sample_height(uv + vec2<f32>(0.0, texel_size.y));
    
    // Calculate gradient
    let dx = (right - left) * config.height_scale * 0.5;
    let dz = (down - up) * config.height_scale * 0.5;
    
    // Normal pointing up
    var normal = vec3<f32>(-dx, 1.0, -dz);
    return normalize(normal);
}

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var output: VertexOutput;
    
    // UV coordinates
    let uv = input.uv;
    
    // Sample height from heightmap
    let height = sample_height(uv);
    
    // Calculate texel size for normal calculation
    let texel_size = vec2<f32>(1.0 / 256.0, 1.0 / 256.0);
    
    // Calculate normal
    let normal = calculate_normal(uv, texel_size);
    
    // Displace vertex by height
    var world_pos = input.position;
    world_pos.y = height * config.height_scale;
    
    // Scale to terrain size
    world_pos.x *= config.terrain_size;
    world_pos.z *= config.terrain_size;
    
    // Transform to clip space
    output.clip_position = camera.view_proj * vec4<f32>(world_pos, 1.0);
    output.world_position = world_pos;
    output.uv = uv;
    output.normal = normal;
    output.height = height;
    
    return output;
}

// Fragment uniforms for lighting
struct LightingUniforms {
    light_dir: vec3<f32>,
    light_color: vec3<f32>,
    ambient: f32,
    specular_power: f32,
    specular_intensity: f32,
};

@group(2) @binding(0)
var<uniform> lighting: LightingUniforms;

// Noise function for terrain detail
fn hash2(p: vec2<f32>) -> f32 {
    return fract(sin(dot(p, vec2<f32>(12.9898, 78.233))) * 43758.5453);
}

fn noise2(p: vec2<f32>) -> f32 {
    let i = floor(p);
    var f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    
    let a = hash2(i);
    let b = hash2(i + vec2<f32>(1.0, 0.0));
    let c = hash2(i + vec2<f32>(0.0, 1.0));
    let d = hash2(i + vec2<f32>(1.0, 1.0));
    
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

@fragment
fn fs_main(input: VertexOutput) -> @location(0) vec4<f32> {
    // Sample color texture
    var base_color = textureSample(color_texture, texture_sampler, input.uv);
    
    // Add some noise for texture detail
    let noise = noise2(input.world_position.xz * 0.1) * 0.1 + 0.9;
    base_color = vec4<f32>(base_color.rgb * noise, base_color.a);
    
    // Calculate lighting
    let light_dir = normalize(lighting.light_dir);
    let view_dir = normalize(camera.view_pos - input.world_position);
    let half_dir = normalize(light_dir + view_dir);
    
    // Diffuse lighting
    let n_dot_l = max(dot(input.normal, light_dir), 0.0);
    let diffuse = n_dot_l * lighting.light_color;
    
    // Specular lighting (Blinn-Phong)
    let n_dot_h = max(dot(input.normal, half_dir), 0.0);
    let specular = pow(n_dot_h, lighting.specular_power) * lighting.specular_intensity;
    
    // Height-based coloring for visual interest
    let height_color = mix(
        vec3<f32>(0.1, 0.3, 0.1),  // Low: dark green
        vec3<f32>(0.8, 0.7, 0.5),  // High: sandy
        input.height
    );
    
    // Blend between texture color and height color
    let final_color = mix(base_color.rgb, height_color, 0.3);
    
    // Combine lighting
    let lit_color = final_color * (diffuse + lighting.ambient) + vec3<f32>(specular);
    
    // Fog effect based on distance
    let dist = length(camera.view_pos - input.world_position);
    let fog_factor = smoothstep(100.0, 500.0, dist);
    let fog_color = vec3<f32>(0.02, 0.02, 0.03);
    
    let final_with_fog = mix(lit_color, fog_color, fog_factor);
    
    return vec4<f32>(final_with_fog, 1.0);
}

// Wireframe variant for debugging
@fragment
fn fs_wireframe(input: VertexOutput) -> @location(0) vec4<f32> {
    // Simple height-based coloring
    let height_color = vec3<f32>(input.height);
    return vec4<f32>(height_color, 0.8);
}