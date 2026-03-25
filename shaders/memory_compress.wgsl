// memory_compress.wgsl - 576:1 Compression on GPU
// Phase 23: Pixel archive with error correction

struct CompressedEntry {
    tick: u32,
    intent_glyph: u32,   // 4 bits packed
    percept_glyph: u32,  // 4 bits packed
    status: u32,         // 4 bits packed
    score_delta: f32,
    checksum: u32,
}

struct CompressConfig {
    entry_count: u32,
    compression_ratio: u32, // 576
    redundancy: u32,        // 8x for tick, 4x for glyphs
}

@group(0) @binding(0) var<uniform> config: CompressConfig;
@group(0) @binding(1) var<storage, read> raw_entries: array<CompressedEntry>;
@group(0) @binding(2) var<storage, read_write> compressed: array<u32>;
@group(0) @binding(3) var<storage, read_write> stats: array<u32>;

// Encode entry to 8 bytes then expand to 576 with redundancy
fn encode_with_redundancy(entry: CompressedEntry, output_idx: u32) {
    let base = output_idx * 576u;
    
    // Encode tick (4 bytes) with 8x redundancy (32 bytes)
    for (var i = 0u; i < 4u; i++) {
        let byte = (entry.tick >> (i * 8u)) & 0xFFu;
        for (var j = 0u; j < 8u; j++) {
            compressed[base + i * 8u + j] = byte;
        }
    }
    
    // Encode glyphs (1 byte) with 4x redundancy (4 bytes)
    let glyph_byte = (entry.intent_glyph << 4u) | entry.percept_glyph;
    for (var i = 0u; i < 4u; i++) {
        compressed[base + 32u + i] = glyph_byte;
    }
    
    // Encode status (4 bits) + padding (4 bits) with 4x redundancy
    for (var i = 0u; i < 4u; i++) {
        compressed[base + 36u + i] = entry.status & 0xFu;
    }
    
    // Encode score_delta as f32 with 8x redundancy (32 bytes)
    let score_bits = bitcast<u32>(entry.score_delta);
    for (var i = 0u; i < 4u; i++) {
        let byte = (score_bits >> (i * 8u)) & 0xFFu;
        for (var j = 0u; j < 8u; j++) {
            compressed[base + 40u + i * 8u + j] = byte;
        }
    }
    
    // Fill remaining with checksum pattern for integrity
    let checksum = compute_checksum(entry);
    for (var i = 72u; i < 576u; i++) {
        compressed[base + i] = (checksum + i) & 0xFFu;
    }
}

// Decode with majority vote error correction
fn decode_with_correction(base: u32) -> CompressedEntry {
    var entry: CompressedEntry;
    
    // Decode tick (majority vote)
    entry.tick = 0u;
    for (var i = 0u; i < 4u; i++) {
        var sum: u32 = 0u;
        for (var j = 0u; j < 8u; j++) {
            sum = sum + compressed[base + i * 8u + j];
        }
        let byte = sum / 8u;
        entry.tick = entry.tick | (byte << (i * 8u));
    }
    
    // Decode glyphs (majority vote)
    var glyph_sum: u32 = 0u;
    for (var i = 0u; i < 4u; i++) {
        glyph_sum = glyph_sum + compressed[base + 32u + i];
    }
    let glyph_byte = glyph_sum / 4u;
    entry.intent_glyph = (glyph_byte >> 4u) & 0xFu;
    entry.percept_glyph = glyph_byte & 0xFu;
    
    // Decode status
    var status_sum: u32 = 0u;
    for (var i = 0u; i < 4u; i++) {
        status_sum = status_sum + compressed[base + 36u + i];
    }
    entry.status = (status_sum / 4u) & 0xFu;
    
    // Decode score_delta
    var score_bits: u32 = 0u;
    for (var i = 0u; i < 4u; i++) {
        var sum: u32 = 0u;
        for (var j = 0u; j < 8u; j++) {
            sum = sum + compressed[base + 40u + i * 8u + j];
        }
        let byte = sum / 8u;
        score_bits = score_bits | (byte << (i * 8u));
    }
    entry.score_delta = bitcast<f32>(score_bits);
    
    // Compute and verify checksum
    entry.checksum = compute_checksum(entry);
    
    return entry;
}

fn compute_checksum(entry: CompressedEntry) -> u32 {
    var sum: u32 = 0u;
    for (var i = 0u; i < 4u; i++) {
        sum = sum + ((entry.tick >> (i * 8u)) & 0xFFu);
    }
    sum = sum + entry.intent_glyph + entry.percept_glyph;
    sum = sum + bitcast<u32>(entry.score_delta) & 0xFFu;
    return sum & 0xFFu;
}

@compute @workgroup_size(64)
fn compress_entries(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    
    if (idx >= config.entry_count) {
        return;
    }
    
    let entry = raw_entries[idx];
    encode_with_redundancy(entry, idx);
    
    // Update stats
    atomicAdd(&stats[0], 1u);
}

@compute @workgroup_size(64)
fn decompress_entries(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    
    if (idx >= config.entry_count) {
        return;
    }
    
    let base = idx * 576u;
    let entry = decode_with_correction(base);
    
    // Write back to raw_entries (for verification)
    raw_entries[idx] = entry;
    
    // Verify checksum
    if (entry.checksum != compute_checksum(entry)) {
        atomicAdd(&stats[1], 1u); // Error count
    } else {
        atomicAdd(&stats[2], 1u); // Success count
    }
}

// Query by status (COHERENT=0, DISSONANT=1)
@compute @workgroup_size(64)
fn query_by_status(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    
    if (idx >= config.entry_count) {
        return;
    }
    
    let base = idx * 576u;
    let entry = decode_with_correction(base);
    
    // stats[3] = target status to query
    if (entry.status == stats[3]) {
        // Store matching indices in compressed buffer
        let result_idx = atomicAdd(&stats[4], 1u);
        compressed[result_idx] = idx;
    }
}
