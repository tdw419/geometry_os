struct Particle {
    pos: vec2<f32>,
    color: vec4<f32>,
}

@group(0) @binding(0) var<storage, read> particles: array<Particle>;
@group(0) @binding(1) var<storage, read_write> output: array<u32>; // RGBA8

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let idx = id.x;
    if (idx >= arrayLength(&particles)) {
        return;
    }
    
    let p = particles[idx];
    let x = u32(p.pos.x);
    let y = u32(p.pos.y);
    
    // Draw a small 3x3 square for the particle
    for (var i: i32 = -1; i <= 1; i++) {
        for (var j: i32 = -1; j <= 1; j++) {
            let px = i32(x) + i;
            let py = i32(y) + j;
            if (px >= 0 && px < 1024 && py >= 0 && py < 1024) {
                output[u32(py) * 1024 + u32(px)] = pack4x8unorm(p.color);
            }
        }
    }
}
