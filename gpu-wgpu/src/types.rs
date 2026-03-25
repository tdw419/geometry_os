// types.rs - GPU data structures (simplified)

/// Mirror state for GPU
#[derive(Debug, Clone)]
pub struct MirrorState {
    pub self_awareness_score: f32,
    pub total_tests: u32,
    pub coherent_count: u32,
    pub dissonant_count: u32,
    pub current_tick: u32,
    pub status: u32,
}

impl Default for MirrorState {
    fn default() -> Self {
        Self {
            self_awareness_score: 0.5,
            total_tests: 0,
            coherent_count: 0,
            dissonant_count: 0,
            current_tick: 0,
            status: 0,
        }
    }
}

/// Memory compression config
#[derive(Debug, Clone)]
pub struct CompressConfig {
    pub entry_count: u32,
    pub compression_ratio: u32,
    pub redundancy: u32,
}

/// Dream cycle config
#[derive(Debug, Clone)]
pub struct DreamConfig {
    pub instance_id: u32,
    pub total_memories: u32,
    pub dissonant_count: u32,
    pub resolution_target: u32,
    pub training_intensity: u32,
}

/// Collective sync config
#[derive(Debug, Clone)]
pub struct CollectiveConfig {
    pub instance_id: u32,
    pub peer_count: u32,
    pub wisdom_packet_size: u32,
    pub sync_interval_ms: u32,
}

/// System status
#[derive(Debug, Clone)]
pub struct SystemStatus {
    pub coherence: f32,
    pub tick: u64,
    pub uptime_secs: u64,
    pub mirror_dispatches: u64,
    pub compress_dispatches: u64,
    pub dream_dispatches: u64,
    pub collective_dispatches: u64,
}
