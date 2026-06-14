// substrate.wgsl -- Vast Substrate Tile Sampler
// Samples from a Hilbert-mapped tiled texture atlas

struct SubstrateConfig {
    atlas_width_chunks: u32,
    chunk_size: u32, // typically 64
    screen_width: u32,
    screen_height: u32,
    camera_x: i32,
    camera_y: i32,
    // Padding to meet 16-byte alignment (24 + 8 = 32 bytes)
    _pad0: u32,
    _pad1: u32,
}

@group(0) @binding(0) var<uniform> config: SubstrateConfig;
@group(0) @binding(1) var<storage, read> atlas: array<u32>; // Hilbert-mapped pixel data
@group(0) @binding(2) var<storage, read_write> output: array<u32>; // RGBA8 screen buffer

// Order N Hilbert curve: x, y to distance
fn xy2d(n: u32, x: u32, y: u32) -> u32 {
    var rx: u32;
    var ry: u32;
    var d: u32 = 0u;
    var s: u32 = n / 2u;
    var tx: u32 = x;
    var ty: u32 = y;
    
    while (s > 0u) {
        rx = (tx & s) >> firstTrailingBit(s);
        ry = (ty & s) >> firstTrailingBit(s);
        d += s * s * ((3u * rx) ^ ry);
        
        // rot(s, &tx, &ty, rx, ry)
        if (ry == 0u) {
            if (rx == 1u) {
                tx = (n - 1u) - tx;
                ty = (n - 1u) - ty;
            }
            let temp = tx;
            tx = ty;
            ty = temp;
        }
        
        s /= 2u;
    }
    return d;
}

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let px = id.x;
    let py = id.y;
    
    if (px >= config.screen_width || py >= config.screen_height) {
        return;
    }
    
    // World coordinates
    let wx = i32(px) + config.camera_x;
    let wy = i32(py) + config.camera_y;
    
    // Chunk coordinates
    let cs = i32(config.chunk_size);
    
    // div_euclid
    var cx = wx / cs;
    if (wx < 0 && wx % cs != 0) { cx -= 1; }
    var cy = wy / cs;
    if (wy < 0 && wy % cs != 0) { cy -= 1; }
    
    // Local coordinates (rem_euclid)
    let lx = u32(wx - (cx * cs));
    let ly = u32(wy - (cy * cs));
    
    // Simple wrap-around atlas mapping for demo purposes
    let atlas_cx = u32(abs(cx)) % config.atlas_width_chunks;
    let atlas_cy = u32(abs(cy)) % config.atlas_width_chunks;
    let chunk_idx = atlas_cy * config.atlas_width_chunks + atlas_cx;
    
    // Calculate Hilbert index within the chunk
    let h_idx = xy2d(config.chunk_size, lx, ly);
    
    // Global atlas offset
    let pixels_per_chunk = config.chunk_size * config.chunk_size;
    let offset = chunk_idx * pixels_per_chunk + h_idx;
    
    if (offset < arrayLength(&atlas)) {
        let color = atlas[offset];
        // Only write non-transparent pixels
        if ((color & 0xFFFFFFu) != 0u) {
            let out_idx = py * config.screen_width + px;
            output[out_idx] = color;
        }
    }
}
