// collective_sync.wgsl - Peer-to-Peer Wisdom Exchange on GPU
// Phase 23: Network synchronization between instances

struct CollectiveConfig {
    instance_id: u32,
    peer_count: u32,
    wisdom_packet_size: u32, // Max bytes per packet
    sync_interval_ms: u32,
}

struct WisdomPacket {
    source_id: u32,
    coherence: f32,
    pattern_count: u32,
    lesson_count: u32,
    timestamp: u32,
}

struct PeerInfo {
    peer_id: u32,
    address: vec4<u32>, // IPv6 address as 4 u32s
    port: u32,
    last_seen: u32,
    coherence: f32,
    wisdom_count: u32,
}

@group(0) @binding(0) var<uniform> config: CollectiveConfig;
@group(0) @binding(1) var<storage, read> local_wisdom: array<u32>;
@group(0) @binding(2) var<storage, read_write> peer_wisdom: array<u32>;
@group(0) @binding(3) var<storage, read> peers: array<PeerInfo>;
@group(0) @binding(4) var<storage, read_write> stats: array<atomic<u32>>;

const GOSW_MAGIC: u32 = 0x57534F47u; // "GOSW" in little-endian

// Serialize wisdom packet for network transmission
fn serialize_wisdom(packet: WisdomPacket, patterns: array<u32, 10>, output: ptr<function, array<u32, 256>>) -> u32 {
    var idx = 0u;
    
    // Header: "GOSW"
    (*output)[idx] = GOSW_MAGIC;
    idx = idx + 1u;
    
    // Source ID
    (*output)[idx] = packet.source_id;
    idx = idx + 1u;
    
    // Coherence as f32 bits
    (*output)[idx] = bitcast<u32>(packet.coherence);
    idx = idx + 1u;
    
    // Pattern count
    (*output)[idx] = packet.pattern_count;
    idx = idx + 1u;
    
    // Patterns (9 u32s per pattern)
    for (var i = 0u; i < packet.pattern_count; i++) {
        for (var j = 0u; j < 9u; j++) {
            let pattern_idx = i * 9u + j;
            if (pattern_idx < 90u) { // Max 10 patterns
                (*output)[idx] = patterns[pattern_idx];
                idx = idx + 1u;
            }
        }
    }
    
    // Lesson count
    (*output)[idx] = packet.lesson_count;
    idx = idx + 1u;
    
    // Timestamp
    (*output)[idx] = packet.timestamp;
    idx = idx + 1u;
    
    return idx; // Return byte count
}

// Deserialize wisdom packet from network
fn deserialize_wisdom(input: array<u32, 256>, packet: ptr<function, WisdomPacket>) -> bool {
    var idx = 0u;
    
    // Verify header
    if (input[idx] != GOSW_MAGIC) {
        return false;
    }
    idx = idx + 1u;
    
    // Source ID
    (*packet).source_id = input[idx];
    idx = idx + 1u;
    
    // Coherence
    (*packet).coherence = bitcast<f32>(input[idx]);
    idx = idx + 1u;
    
    // Pattern count
    (*packet).pattern_count = input[idx];
    idx = idx + 1u;
    
    // Skip patterns for now (would store in separate buffer)
    idx = idx + (*packet).pattern_count * 9u;
    
    // Lesson count
    (*packet).lesson_count = input[idx];
    idx = idx + 1u;
    
    // Timestamp
    (*packet).timestamp = input[idx];
    
    return true;
}

// Calculate collective coherence across all peers
fn collective_coherence() -> f32 {
    if (config.peer_count == 0u) {
        return 0.0;
    }
    
    var total: f32 = 0.0;
    
    for (var i = 0u; i < config.peer_count; i++) {
        total = total + peers[i].coherence;
    }
    
    return total / f32(config.peer_count);
}

// Broadcast wisdom to all peers
@compute @workgroup_size(1)
fn broadcast_wisdom(@builtin(global_invocation_id) global_id: vec3<u32>) {
    var packet: WisdomPacket;
    packet.source_id = config.instance_id;
    packet.coherence = bitcast<f32>(stats[0]); // Local coherence stored in stats[0]
    packet.pattern_count = min(stats[1], 10u); // Pattern count
    packet.lesson_count = stats[2]; // Lesson count
    packet.timestamp = stats[3]; // Current tick
    
    // Serialize packet
    var buffer: array<u32, 256>;
    let size = serialize_wisdom(packet, local_wisdom, &buffer);
    
    // In production: send to network layer
    // For simulation: increment broadcast counter
    atomicAdd(&stats[4], 1u); // Broadcasts sent
    
    // Copy to peer_wisdom for each peer
    for (var i = 0u; i < config.peer_count; i++) {
        let peer_offset = i * 256u;
        for (var j = 0u; j < size; j++) {
            peer_wisdom[peer_offset + j] = buffer[j];
        }
    }
}

// Receive wisdom from peers
@compute @workgroup_size(64)
fn receive_wisdom(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let peer_idx = global_id.x;
    
    if (peer_idx >= config.peer_count) {
        return;
    }
    
    let peer_offset = peer_idx * 256u;
    
    // Deserialize packet from peer
    var packet: WisdomPacket;
    var buffer: array<u32, 256>;
    
    for (var i = 0u; i < 256u; i++) {
        buffer[i] = peer_wisdom[peer_offset + i];
    }
    
    if (deserialize_wisdom(buffer, &packet)) {
        // Update peer info
        peers[peer_idx].coherence = packet.coherence;
        peers[peer_idx].wisdom_count = peers[peer_idx].wisdom_count + 1u;
        peers[peer_idx].last_seen = stats[3]; // Current tick
        
        // Increment received counter
        atomicAdd(&stats[5], 1u); // Wisdom received
    }
}

// Update collective status
@compute @workgroup_size(1)
fn update_collective(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let collective = collective_coherence();
    
    // Store collective coherence in stats[6]
    let coherence_bits = bitcast<u32>(collective);
    atomicStore(&stats[6], coherence_bits);
    
    // Check if collective is stable (>80% coherence)
    if (collective > 0.8) {
        atomicStore(&stats[7], 1u); // Collective stable flag
    } else {
        atomicStore(&stats[7], 0u);
    }
}

// Register new peer
@compute @workgroup_size(1)
fn register_peer(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // New peer info comes from stats[10-15]
    let new_idx = config.peer_count;
    
    if (new_idx < 64u) { // Max 64 peers
        peers[new_idx].peer_id = atomicLoad(&stats[10]);
        peers[new_idx].address = vec4<u32>(
            atomicLoad(&stats[11]),
            atomicLoad(&stats[12]),
            atomicLoad(&stats[13]),
            atomicLoad(&stats[14])
        );
        peers[new_idx].port = atomicLoad(&stats[15]);
        peers[new_idx].coherence = 0.0;
        peers[new_idx].wisdom_count = 0u;
        peers[new_idx].last_seen = 0u;
        
        atomicAdd(&stats[8], 1u); // Increment peer count
    }
}

// Sync with specific peer
@compute @workgroup_size(1)
fn sync_with_peer(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let peer_idx = global_id.x;
    
    if (peer_idx >= config.peer_count) {
        return;
    }
    
    // Check if peer is recent (last_seen within sync_interval)
    let current_tick = stats[3];
    let peer_age = current_tick - peers[peer_idx].last_seen;
    
    if (peer_age < config.sync_interval_ms) {
        // Peer is active, sync wisdom
        atomicAdd(&stats[9], 1u); // Successful sync
    }
}
