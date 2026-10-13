// Graph Nodes Shader
// Instanced rendering for neural memory graph nodes

struct CameraUniform {
    view_proj: mat4x4<f32>,
    camera_pos: vec3<f32>,
    zoom: f32,
};

struct SelectionUniform {
    selected_node_id: i32,
    highlight_color: vec3<f32>,
    _padding: f32,
};

@group(0) @binding(0)
var<uniform> camera: CameraUniform;

@group(0) @binding(1)
var<uniform> selection: SelectionUniform;

struct VertexInput {
    @location(0) position: vec2<f32>,  // Quad vertex position (-0.5 to 0.5)
    @location(1) instance_pos: vec3<f32>,  // Instance position in world space
    @location(2) color: vec3<f32>,     // Node color
    @location(3) scale: f32,          // Node scale
    @location(4) activation: f32,     // Node activation level
};

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) color: vec3<f32>,
    @location(1) activation: f32,
    @location(2) is_selected: f32,
};

@vertex
fn vs_main(input: VertexInput, @builtin(instance_index) instance_idx: u32) -> VertexOutput {
    var output: VertexOutput;

    // Scale the quad based on activation and zoom
    let scaled_pos = input.position * input.scale * camera.zoom;

    // Transform to world position
    let world_pos = vec4<f32>(input.instance_pos + vec3<f32>(scaled_pos, 0.0), 1.0);

    // Apply camera transform
    output.position = camera.view_proj * world_pos;

    // Pass color and activation
    output.color = input.color;
    output.activation = input.activation;

    // Check if this instance is selected
    output.is_selected = select(0.0, 1.0, i32(instance_idx) == selection.selected_node_id);

    return output;
}

@fragment
fn fs_main(input: VertexOutput) -> @location(0) vec4<f32> {
    var final_color = input.color;

    // Apply activation-based brightness
    final_color = final_color * (0.3 + input.activation * 0.7);

    // Apply selection highlight
    if (input.is_selected > 0.0) {
        final_color = mix(final_color, selection.highlight_color, 0.7);
    }

    // Add a subtle border effect
    let alpha = 0.8 + input.activation * 0.2;

    return vec4<f32>(final_color, alpha);
}