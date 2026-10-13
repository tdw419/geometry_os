@fragment
fn fs_main(input: @location(0) vec4<f32>) -> @location(0) vec4<f32> {
   let t = input.x; // time since last frame
   let uv = input.y * 10.0 + input.z * 5.0; // screen coordinate for gradient interpolation
   let r = sin((t + uv) / 3.14159) * 0.5 + 0.5; // create color gradient based on sin wave function
   let g = sin(t + uv) * 0.5 + 0.5; // add a second color gradient if necessary
   let b = 0.5 + 0.5 * sin((uv + uv) / 4.0); // add final color gradient based on screen coordinates
   
   return vec4<f32>(r, g, b, input.w);
}