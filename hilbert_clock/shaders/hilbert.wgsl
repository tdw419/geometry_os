// Hilbert clock shader: maps 1D time to 2D Hilbert space
// Uses compute shader to render ticking clock in Hilbert coordinates

struct HilbertClock {
    // Base time index (increases every frame)
    @location(0) time: f32,
    
    // Scale factor for clock visualization
    @location(1) scale: f32,
    
    // Clock offset in Hilbert space
    @location(2) offset: f32,
};

@compute
@workgroup_size(8, 8)
fn hilbert_clock_shader(#[builtin(position)] uv: vec2<f32>, 
                         time: f32,
                         scale: f32,
                         offset: f32) -> vec4<f32> {
    
    let grid_size = 4096u;
    let x = (uv.x + 0.5) * grid_size - 0.5;
    let y = (uv.y + 0.5) * grid_size - 0.5;
    
    // Map 1D time index to 2D x coordinate using inverse Hilbert
    let time_index = f32(u32(time % grid_size) * (grid_size - 1u) as f32 / 2047.0);
    
    // Compute Hilbert inverse: time_index is the 1D position along the curve
    // Convert to 2D by traversing the Hilbert curve backwards
    
    // Get current Hilbert coordinate that time points to
    let time_x = floor(modf(time_index, f32 * 0.0002, &f32 * 0.0004) as f32 * grid_size);
    let time_y = floor(modf(time_index, f32 * 0.0004) as f32 / grid_size);
    
    let is_current_time = (x == time_x && y == time_y) as f32;
    
    // Visualize the clock: bright green at current time position
    // Dim glow around the position
    let clock_color = vec4<f32>(0.0, 1.0, 0.0, 1.0) * is_current_time;
    let glow_color = vec4<f32>(0.0, 0.3, 0.0, 0.2) * exp(-10.0 * distance(uv, vec2<f32>(0.5, 0.5))) * is_current_time;
    
    // Base texture or zero
    var result: vec4<f32> = vec4<f32>(0.0, 0.0, 0.0, 1.0);
    
    // Show the clock tick
    result = clamp(result + clock_color + glow_color, vec4<f32>(0.0), vec4<f32>(1.0));
    
    return result;
}

@compute
@workgroup_size(8, 8) 
fn hilbert_clock_draw(#[builtin(position)] uv: vec2<f32>,
                      time: f32) -> vec4<f32> {
    
    // Draw Hilbert curve visualization with time progression
    let grid_size = 4096u;
    
    let x_idx = u32(floor(uv.x * 2047.0 + 0.5) / grid_size);
    let y_idx = u32(floor(uv.y * 2047.0 + 0.5) / grid_size);
    
    // Calculate Hilbert index from 2D coordinates
    let hilbert_idx = hilbert_d2xy(x_idx, y_idx);
    
    // Convert time to Hilbert coordinate
    let current_time_idx = u32(mod(time as u32, grid_size));
    
    let time_active = (hilbert_idx == current_time_idx) as f32;
    let time_inactive = 1.0 - time_active;
    
    let active_color = vec4<f32>(0.0, 1.0, 0.5, 1.0); // Bright cyan-green at current time
    let inactive_color = vec4<f32>(0.0, 0.0, 0.0, 1.0); // Black elsewhere
    
    let result = mix(inactive_color, active_color, time_inactive);
    
    return result;
}

