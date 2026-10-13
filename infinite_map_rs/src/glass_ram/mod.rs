// systems/infinite_map_rs/src/glass_ram/mod.rs
//
// Glass RAM Substrate - Non-intrusive process memory introspection system
// Treats process memory as a "glassy" state of matter, visualized via Hilbert curve mapping

pub mod bridge;
pub mod uffd_wrapper;

pub mod compressed_sensing;
pub mod density_renderer;
pub mod dma_sync;
pub mod dmabuf_exporter;
pub mod fault_poller;
pub mod glass_ram_integration;
pub mod hilbert_skilling;
pub mod kms_scanout;
pub mod monitor;
pub mod process_attacher;
pub mod process_maps;

// Re-export commonly used types
pub use bridge::{BridgeServer, VisualCommand};
