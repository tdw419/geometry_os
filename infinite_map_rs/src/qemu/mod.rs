// QEMU bridge modules - re-export for spatial OS kernel integration

pub mod qmp;
pub mod memory_bridge;

// Re-export main types
pub use qmp::{QmpClient, QmpCommand, QmpError};
pub use memory_bridge::{SharedMemoryBridge, BridgeError};