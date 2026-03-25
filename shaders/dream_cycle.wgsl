// dream_cycle.wgsl - REM Phase Processing on GPU
// Phase 23: Re-process dissonant memories during idle

struct DreamConfig {
    instance_id: u32,
    total_memories: u32,
    dissonant_count: u32,
    resolution_target: u32, // Target % to resolve
    training_intensity: u32, // Epochs per memory
}

struct DreamState {
    is_dreaming: u32,
    memories_processed: u32,
    memories_resolved: u32,
    training_iterations: u64,
    coherence_before: f32,
    coherence_after: f32,
}

@group(0) @binding(0) var<uniform> config: DreamConfig;
@group(0) @binding(1) var<storage, read_write> dream_state: DreamState;
@group(0) @binding(2) var<storage, read> memories: array<u32>; // Compressed 576-byte blocks
@group(0) @binding(3) var<storage, read_write> resolutions: array<u32>;
@group(0) @binding(4) var<storage, read_write> stats: array<u32>;

var<private> rand_state: u32;

fn xorshift() -> u32 {
    rand_state = rand_state ^ (rand_state << 13u);
    rand_state = rand_state ^ (rand_state >> 17u);
    rand_state = rand_state ^ (rand_state << 5u);
    return rand_state;
}

fn random_f32() -> f32 {
    return f32(xorshift()) / f32(0xFFFFFFFFu);
}

// Simulate backpropagation training on a memory
fn train_memory(memory_base: u32, intensity: u32) -> bool {
    // Initialize random seed from memory
    rand_state = memories[memory_base] ^ config.instance_id;
    
    // Simulate training iterations
    var confidence = 0.5;
    
    for (var i = 0u; i < intensity; i++) {
        // Each iteration has chance to improve confidence
        let improvement = random_f32() * 0.1;
        confidence = confidence + improvement;
        
        // Cap at 1.0
        if (confidence > 1.0) {
            confidence = 1.0;
        }
    }
    
    // Resolution succeeds if confidence > 0.7
    return confidence > 0.7;
}

// Decode status from compressed memory
fn get_memory_status(base: u32) -> u32 {
    // Status is in bytes 36-39 with 4x redundancy
    var sum: u32 = 0u;
    for (var i = 36u; i < 40u; i++) {
        sum = sum + memories[base + i];
    }
    return (sum / 4u) & 0xFu;
}

// Mark memory as resolved
fn mark_resolved(base: u32) {
    // Update status bytes to RESOLVED (0x02)
    for (var i = 36u; i < 40u; i++) {
        memories[base + i] = 0x02u;
    }
}

@compute @workgroup_size(64)
fn dream_process(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    
    // Only process up to dissonant_count
    if (idx >= config.dissonant_count) {
        return;
    }
    
    // Find next dissonant memory
    var dissonant_idx = 0u;
    var found = 0u;
    
    for (var i = 0u; i < config.total_memories; i++) {
        let base = i * 576u;
        let status = get_memory_status(base);
        
        if (status == 0x01u) { // DISSONANT
            if (dissonant_idx == idx) {
                found = i;
                break;
            }
            dissonant_idx = dissonant_idx + 1u;
        }
    }
    
    if (found == 0u && idx > 0u) {
        return; // No more dissonant memories
    }
    
    let memory_base = found * 576u;
    
    // Train on this memory
    let resolved = train_memory(memory_base, config.training_intensity);
    
    // Store result
    resolutions[idx] = select(0u, 1u, resolved);
    
    if (resolved) {
        // Mark as resolved in memory
        mark_resolved(memory_base);
        
        // Update stats
        atomicAdd(&stats[0], 1u); // Resolved count
    }
    
    atomicAdd(&stats[1], 1u); // Processed count
}

// Start dream cycle
@compute @workgroup_size(1)
fn begin_dream(@builtin(global_invocation_id) global_id: vec3<u32>) {
    dream_state.is_dreaming = 1u;
    dream_state.coherence_before = f32(stats[2]) / f32(max(stats[3], 1u));
    
    // Reset processing counters
    stats[0] = 0u; // Resolved
    stats[1] = 0u; // Processed
}

// End dream cycle and update coherence
@compute @workgroup_size(1)
fn end_dream(@builtin(global_invocation_id) global_id: vec3<u32>) {
    dream_state.is_dreaming = 0u;
    
    // Calculate new coherence
    let resolved = stats[0];
    let processed = stats[1];
    
    // Update memory counts
    dream_state.memories_processed = dream_state.memories_processed + processed;
    dream_state.memories_resolved = dream_state.memories_resolved + resolved;
    
    // Calculate coherence improvement
    if (processed > 0u) {
        let resolution_rate = f32(resolved) / f32(processed);
        dream_state.coherence_after = dream_state.coherence_before + resolution_rate * 0.05;
        
        // Cap at 1.0
        if (dream_state.coherence_after > 1.0) {
            dream_state.coherence_after = 1.0;
        }
    } else {
        dream_state.coherence_after = dream_state.coherence_before;
    }
    
    // Update training iterations
    dream_state.training_iterations = dream_state.training_iterations + 
        u64(processed * config.training_intensity);
}

// Check if dream cycle should trigger (called each tick)
@compute @workgroup_size(1)
fn check_dream_trigger(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // stats[4] = current dissonant count
    // stats[5] = total memory count
    let dissonant_ratio = f32(stats[4]) / f32(max(stats[5], 1u));
    
    // Trigger dream if dissonant ratio > 15%
    if (dissonant_ratio > 0.15) {
        stats[6] = 1u; // Trigger flag
    } else {
        stats[6] = 0u;
    }
}
