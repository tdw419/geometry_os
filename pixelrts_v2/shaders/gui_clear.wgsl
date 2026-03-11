// pixelrts_v2/shaders/gui_clear.wgsl
// Simple clear shader for GUI framebuffer

@group(0) @binding(0) var<uniform> clear_color: vec4<f32>;
@group(0) @binding(1) var output_framebuffer: texture_storage_2d<rgba8unorm, write>;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let dims = textureDimensions(output_framebuffer);
    if (global_id.x >= dims.x || global_id.y >= dims.y) {
        return;
    }

    textureStore(output_framebuffer, vec2<i32>(global_id.xy), clear_color);
}
