// gqr_protocol.wgsl -> GPU-Native GQR Recognition
// 
// WGSL shader for detecting and rendering GQR blocks
// Integrates with framebuffer.wgsl 4-layer composite

// GQR Intent types (must match Rust encoder/decoder)
const GQR_DATA_CONSTANT: u32 = 0u;
const GQR_PROCESSOR_NODE: u32 = 1u;
const GQR_BUS_PATHWAY: u32 = 2u;
const GQR_EXECUTIVE_ORDER: u32 = 3u;
const GQR_MEMORY_ARCHIVE: u32 = 4u;
const GQR_VETO_ZONE: u32 = 5u;
const GQR_CONTRACT_PROPOSAL: u32 = 6u;
const GQR_UNKNOWN: u32 = 7u;

// GQR block structure
struct GqrBlock {
    intent: u32,
    x: u32,
    y: u32,
    size: u32,
    payload: vec4<u32>,  // Up to 16 chars
    metadata: u32,
    parity: u32,
}

// GQR scan results
struct GqrScanResult {
    count: u32,
    blocks: array<GqrBlock, 64>,  // Max 64 GQR blocks
}

// Uniforms for GQR operations
struct GqrUniforms {
    fb_width: u32,
    fb_height: u32,
    operation: u32,  // 0=scan, 1=render, 2=verify
    padding: u32,
}

@group(0) @binding(0) var<uniform> uniforms: GqrUniforms;
@group(0) @binding(1) var<storage, read_write> framebuffer: array<u32>;
@group(0) @binding(2) var<storage, read_write> scan_results: GqrScanResult;

// Decode intent from RGB color
fn intent_from_color(r: u32, g: u32, b: u32) -> u32 {
    // DataConstant: (100, 100, 255)
    if (r == 100u && g == 100u && b == 255u) {
        return GQR_DATA_CONSTANT;
    }
    // ProcessorNode: (100, 255, 100)
    if (r == 100u && g == 255u && b == 100u) {
        return GQR_PROCESSOR_NODE;
    }
    // BusPathway: (255, 255, 100)
    if (r == 255u && g == 255u && b == 100u) {
        return GQR_BUS_PATHWAY;
    }
    // ExecutiveOrder: (255, 100, 255)
    if (r == 255u && g == 100u && b == 255u) {
        return GQR_EXECUTIVE_ORDER;
    }
    // MemoryArchive: (100, 255, 255)
    if (r == 100u && g == 255u && b == 255u) {
        return GQR_MEMORY_ARCHIVE;
    }
    // VetoZone: (255, 50, 50)
    if (r == 255u && g == 50u && b == 50u) {
        return GQR_VETO_ZONE;
    }
    // ContractProposal: (200, 150, 255)
    if (r == 200u && g == 150u && b == 255u) {
        return GQR_CONTRACT_PROPOSAL;
    }
    return GQR_UNKNOWN;
}

// Get pixel from framebuffer (RGBA)
fn get_pixel(fb: ptr<storage, array<u32>>, x: u32, y: u32, w: u32) -> vec4<u32> {
    let idx = (y * w + x) * 4u;
    return vec4<u32>(
        (*fb)[idx],
        (*fb)[idx + 1u],
        (*fb)[idx + 2u],
        (*fb)[idx + 3u]
    );
}

// Check if 3x3 region is a finder pattern (hollow frame)
fn is_finder_pattern(fb: ptr<storage, array<u32>>, x: u32, y: u32, w: u32) -> bool {
    var edge_sum = 0u;
    var center_sum = 0u;
    
    // Check edges (all except center)
    for (var dy = 0u; dy < 3u; dy++) {
        for (var dx = 0u; dx < 3u; dx++) {
            let pixel = get_pixel(fb, x + dx, y + dy, w);
            let brightness = pixel.r + pixel.g + pixel.b;
            
            if (dx == 1u && dy == 1u) {
                center_sum = brightness;
            } else {
                edge_sum += brightness;
            }
        }
    }
    
    // Finder pattern: edges bright, center can be anything
    return edge_sum > 200u && edge_sum > center_sum * 2u;
}

// Verify parity from alpha channels
fn verify_parity(fb: ptr<storage, array<u32>>, x: u32, y: u32, w: u32) -> bool {
    let p1 = get_pixel(fb, x, y, w).a;           // Top-left
    let p2 = get_pixel(fb, x + 2u, y, w).a;      // Top-right
    let p3 = get_pixel(fb, x, y + 2u, w).a;      // Bottom-left
    let p4 = get_pixel(fb, x + 2u, y + 2u, w).a; // Bottom-right
    
    // Check XOR relationship
    return (p1 == p3) && (p2 == p4) && ((p1 ^ p2) == 255u);
}

// Decode payload from center pixel
fn decode_payload(fb: ptr<storage, array<u32>>, x: u32, y: u32, w: u32) -> u32 {
    let center = get_pixel(fb, x + 1u, y + 1u, w);
    return center.r; // Use R channel as glyph
}

// Calculate confidence score
fn calculate_confidence(fb: ptr<storage, array<u32>>, x: u32, y: u32, w: u32, intent: u32) -> f32 {
    var score = 0.0;
    var color_matches = 0u;
    
    // Expected colors
    var expected_r = 0u;
    var expected_g = 0u;
    var expected_b = 0u;
    
    if (intent == GQR_DATA_CONSTANT) {
        expected_r = 100u; expected_g = 100u; expected_b = 255u;
    } else if (intent == GQR_PROCESSOR_NODE) {
        expected_r = 100u; expected_g = 255u; expected_b = 100u;
    } else if (intent == GQR_EXECUTIVE_ORDER) {
        expected_r = 255u; expected_g = 100u; expected_b = 255u;
    } else if (intent == GQR_CONTRACT_PROPOSAL) {
        expected_r = 200u; expected_g = 150u; expected_b = 255u;
    }
    
    // Check color consistency
    for (var dy = 0u; dy < 3u; dy++) {
        for (var dx = 0u; dx < 3u; dx++) {
            let pixel = get_pixel(fb, x + dx, y + dy, w);
            let dr = abs(i32(pixel.r) - i32(expected_r));
            let dg = abs(i32(pixel.g) - i32(expected_g));
            let db = abs(i32(pixel.b) - i32(expected_b));
            
            if (dr < 30 && dg < 30 && db < 30) {
                color_matches++;
            }
        }
    }
    
    score += f32(color_matches) / 9.0 * 0.5;
    
    // Check parity validity
    if (verify_parity(fb, x, y, w)) {
        score += 0.3;
    }
    
    // Check finder pattern strength
    if (is_finder_pattern(fb, x, y, w)) {
        score += 0.2;
    }
    
    return min(score, 1.0);
}

// Render GQR block to framebuffer
fn render_gqr_block(
    fb: ptr<storage, array<u32>>,
    x: u32,
    y: u32,
    w: u32,
    intent: u32,
    payload: u32
) {
    // Get color based on intent
    var r = 0u; var g = 0u; var b = 0u;
    
    if (intent == GQR_DATA_CONSTANT) {
        r = 100u; g = 100u; b = 255u;
    } else if (intent == GQR_PROCESSOR_NODE) {
        r = 100u; g = 255u; b = 100u;
    } else if (intent == GQR_EXECUTIVE_ORDER) {
        r = 255u; g = 100u; b = 255u;
    } else if (intent == GQR_CONTRACT_PROPOSAL) {
        r = 200u; g = 150u; b = 255u;
    }
    
    // Draw 3x3 finder pattern
    for (var dy = 0u; dy < 3u; dy++) {
        for (var dx = 0u; dx < 3u; dx++) {
            let idx = ((y + dy) * w + (x + dx)) * 4u;
            
            if (dx == 1u && dy == 1u) {
                // Center: payload
                (*fb)[idx] = payload;
                (*fb)[idx + 1u] = payload;
                (*fb)[idx + 2u] = payload;
                (*fb)[idx + 3u] = 255u;
            } else {
                // Edge: finder pattern color
                (*fb)[idx] = r;
                (*fb)[idx + 1u] = g;
                (*fb)[idx + 2u] = b;
                
                // Parity encoding in alpha
                let is_left = (dx == 0u);
                let is_top = (dy == 0u);
                if (is_left == is_top) {
                    (*fb)[idx + 3u] = 0x50;
                } else {
                    (*fb)[idx + 3u] = 0xAF;
                }
            }
        }
    }
}

// Main compute shader: Scan for GQR blocks
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let thread_id = global_id.x;
    
    if (uniforms.operation == 0u) {
        // Scan operation
        let x = thread_id % uniforms.fb_width;
        let y = thread_id / uniforms.fb_width;
        
        if (x < uniforms.fb_width - 2u && y < uniforms.fb_height - 2u) {
            // Check for finder pattern
            if (is_finder_pattern(&framebuffer, x, y, uniforms.fb_width)) {
                // Decode intent
                let corner = get_pixel(&framebuffer, x, y, uniforms.fb_width);
                let intent = intent_from_color(corner.r, corner.g, corner.b);
                
                if (intent != GQR_UNKNOWN) {
                    // Calculate confidence
                    let confidence = calculate_confidence(&framebuffer, x, y, uniforms.fb_width, intent);
                    
                    // Only add high-confidence blocks
                    if (confidence > 0.7) {
                        let idx = atomicAdd(&scan_results.count, 1u);
                        
                        if (idx < 64u) {
                            scan_results.blocks[idx].intent = intent;
                            scan_results.blocks[idx].x = x;
                            scan_results.blocks[idx].y = y;
                            scan_results.blocks[idx].size = 3u;
                            scan_results.blocks[idx].payload.x = decode_payload(&framebuffer, x, y, uniforms.fb_width);
                            scan_results.blocks[idx].metadata = 0u;
                            scan_results.blocks[idx].parity = u32(verify_parity(&framebuffer, x, y, uniforms.fb_width));
                        }
                    }
                }
            }
        }
    } else if (uniforms.operation == 1u) {
        // Render operation (single block per thread)
        let block_idx = thread_id;
        
        if (block_idx < scan_results.count) {
            let block = scan_results.blocks[block_idx];
            render_gqr_block(
                &framebuffer,
                block.x,
                block.y,
                uniforms.fb_width,
                block.intent,
                block.payload.x
            );
        }
    }
}
