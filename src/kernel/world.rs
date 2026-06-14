#[derive(Clone, Debug)]
pub struct FileParticle {
    pub id: u64,
    pub size: u32,

    // Hilbert-space position
    pub x: u32,
    pub y: u32,

    // physics state
    pub vx: f32,
    pub vy: f32,

    pub energy: f32,
    pub file_type: u32,

    // semantic embedding vector (proxy for meaning / survival history)
    pub semantic_vector: [f32; 4],
}
