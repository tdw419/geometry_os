// vm/checkpoint.rs -- Checkpointing for Memory Palace (Phase 201)
// Simplified checkpoint that captures essential VM state for rollback.

use super::types::Building;
use serde::{Deserialize, Serialize};
use std::fs;
use std::time::{SystemTime, UNIX_EPOCH};

/// A simplified checkpoint of Memory Palace VM state.
/// Focuses on RAM and CPU state; complex process/IPC state is reset on restore.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VmCheckpoint {
    /// Unix timestamp when this checkpoint was created.
    pub timestamp: u64,
    /// Optional human-readable description.
    pub description: Option<String>,

    // CPU state
    pub pc: u32,
    pub regs: [u32; 32],
    pub mode: u8, // CpuMode as u8 for serialization

    // Memory
    pub ram: Vec<u32>,
    pub screen: Vec<u32>,

    // Execution stats
    pub total_steps: u64,
    pub halted: bool,

    // Phase 202: Metadata persistence
    /// Building metadata (maps building_id -> metadata HashMap)
    pub building_metadata:
        std::collections::HashMap<u32, std::collections::HashMap<String, String>>,
    /// Coordinate metadata (maps packed (x<<32|y) -> metadata HashMap)
    pub coordinate_metadata:
        std::collections::HashMap<u64, std::collections::HashMap<String, String>>,

    // Phase 202+: Infinite building storage
    /// All buildings in the Memory Palace (unbounded).
    pub buildings: Vec<Building>,
}

/// Checkpoint error types.
#[derive(Debug)]
pub enum CheckpointError {
    Io(String),
    Serialize(String),
    Deserialize(String),
    NotFound(String),
    Invalid(String),
}

impl std::fmt::Display for CheckpointError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CheckpointError::Io(e) => write!(f, "IO error: {}", e),
            CheckpointError::Serialize(e) => write!(f, "Serialization error: {}", e),
            CheckpointError::Deserialize(e) => write!(f, "Deserialization error: {}", e),
            CheckpointError::NotFound(e) => write!(f, "Not found: {}", e),
            CheckpointError::Invalid(e) => write!(f, "Invalid data: {}", e),
        }
    }
}

impl std::error::Error for CheckpointError {}

impl From<std::io::Error> for CheckpointError {
    fn from(e: std::io::Error) -> Self {
        CheckpointError::Io(e.to_string())
    }
}

/// Create checkpoint directory if it doesn't exist.
pub fn ensure_checkpoint_dir() -> Result<std::path::PathBuf, CheckpointError> {
    let dir = std::path::PathBuf::from(".geometry_os/checkpoints");
    fs::create_dir_all(&dir)?;
    Ok(dir)
}

/// Generate a unique checkpoint filename based on current timestamp.
pub fn generate_checkpoint_filename() -> String {
    let timestamp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_millis();
    format!("checkpoint_{:016x}.json", timestamp)
}

/// Save checkpoint to JSON file.
pub fn save_checkpoint(
    checkpoint: &VmCheckpoint,
    checkpoint_dir: &std::path::Path,
) -> Result<String, CheckpointError> {
    let filename = format!("checkpoint_{:016x}.json", checkpoint.timestamp);
    let path = checkpoint_dir.join(&filename);
    let json = serde_json::to_string_pretty(checkpoint)
        .map_err(|e| CheckpointError::Serialize(e.to_string()))?;
    fs::write(&path, json)?;
    Ok(filename)
}

/// Load checkpoint from JSON file.
pub fn load_checkpoint(
    filename: &str,
    checkpoint_dir: &std::path::Path,
) -> Result<VmCheckpoint, CheckpointError> {
    let path = checkpoint_dir.join(filename);
    if !path.exists() {
        return Err(CheckpointError::NotFound(format!(
            "Checkpoint file not found: {}",
            filename
        )));
    }
    let json = fs::read_to_string(&path)?;
    serde_json::from_str(&json).map_err(|e| CheckpointError::Deserialize(e.to_string()))
}

/// List all checkpoint files in the directory.
pub fn list_checkpoints(checkpoint_dir: &std::path::Path) -> Result<Vec<String>, CheckpointError> {
    if !checkpoint_dir.exists() {
        return Ok(Vec::new());
    }
    let mut checkpoints = Vec::new();
    for entry in fs::read_dir(checkpoint_dir)? {
        let entry = entry?;
        let filename = entry.file_name();
        let filename_str = filename.to_string_lossy();
        if filename_str.starts_with("checkpoint_") && filename_str.ends_with(".json") {
            checkpoints.push(filename_str.to_string());
        }
    }
    checkpoints.sort();
    checkpoints.reverse(); // Newest first
    Ok(checkpoints)
}

/// Delete a checkpoint file.
pub fn delete_checkpoint(
    filename: &str,
    checkpoint_dir: &std::path::Path,
) -> Result<(), CheckpointError> {
    let path = checkpoint_dir.join(filename);
    if !path.exists() {
        return Err(CheckpointError::NotFound(format!(
            "Checkpoint file not found: {}",
            filename
        )));
    }
    fs::remove_file(&path)?;
    Ok(())
}

/// Compare two checkpoints and return a structured diff.
pub fn diff_checkpoints(a: &VmCheckpoint, b: &VmCheckpoint) -> serde_json::Value {
    serde_json::json!({
        "timestamp_delta": b.timestamp as i64 - a.timestamp as i64,
        "pc_changed": a.pc != b.pc,
        "pc_delta": (b.pc as i64 - a.pc as i64),
        "ram_size_delta": b.ram.len() as i64 - a.ram.len() as i64,
        "screen_size_delta": b.screen.len() as i64 - a.screen.len() as i64,
        "total_steps_delta": b.total_steps as i64 - a.total_steps as i64,
        "halted_changed": a.halted != b.halted,
        "registers_changed": a.regs.iter()
            .zip(b.regs.iter())
            .enumerate()
            .filter(|(_, (ra, rb))| ra != rb)
            .map(|(i, _)| i)
            .collect::<Vec<_>>(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::TempDir;

    #[test]
    fn test_checkpoint_serialization() {
        let checkpoint = VmCheckpoint {
            timestamp: 1234567890,
            description: Some("test".to_string()),
            pc: 0x1000,
            regs: [0u32; 32],
            mode: 0,
            ram: vec![0u32; 1024],
            screen: vec![0u32; 256 * 256],
            total_steps: 0,
            halted: false,
            building_metadata: std::collections::HashMap::new(),
            coordinate_metadata: std::collections::HashMap::new(),
            buildings: Vec::new(),
        };

        let json = serde_json::to_string(&checkpoint).unwrap();
        let restored: VmCheckpoint = serde_json::from_str(&json).unwrap();

        assert_eq!(checkpoint.timestamp, restored.timestamp);
        assert_eq!(checkpoint.pc, restored.pc);
    }

    #[test]
    fn test_save_and_load_checkpoint() {
        let temp_dir = TempDir::new().unwrap();
        let checkpoint_dir = temp_dir.path();

        let checkpoint = VmCheckpoint {
            timestamp: 1234567890,
            description: Some("test checkpoint".to_string()),
            pc: 0x1000,
            regs: [1u32; 32],
            mode: 0,
            ram: vec![42u32; 512],
            screen: vec![0u32; 256],
            total_steps: 5000,
            halted: false,
            building_metadata: std::collections::HashMap::new(),
            coordinate_metadata: std::collections::HashMap::new(),
            buildings: Vec::new(),
        };

        let filename = save_checkpoint(&checkpoint, checkpoint_dir).unwrap();
        let restored = load_checkpoint(&filename, checkpoint_dir).unwrap();

        assert_eq!(checkpoint.timestamp, restored.timestamp);
        assert_eq!(checkpoint.pc, restored.pc);
        assert_eq!(checkpoint.ram, restored.ram);
    }

    #[test]
    fn test_list_checkpoints() {
        let temp_dir = TempDir::new().unwrap();
        let checkpoint_dir = temp_dir.path();

        assert!(list_checkpoints(checkpoint_dir).unwrap().is_empty());

        let cp1 = VmCheckpoint {
            timestamp: 1,
            description: None,
            pc: 0,
            regs: [0u32; 32],
            mode: 0,
            ram: Vec::new(),
            screen: Vec::new(),
            total_steps: 0,
            halted: false,
            building_metadata: std::collections::HashMap::new(),
            coordinate_metadata: std::collections::HashMap::new(),
            buildings: Vec::new(),
        };

        let cp2 = VmCheckpoint {
            timestamp: 2,
            description: None,
            pc: 0,
            regs: [0u32; 32],
            mode: 0,
            ram: Vec::new(),
            screen: Vec::new(),
            total_steps: 0,
            halted: false,
            building_metadata: std::collections::HashMap::new(),
            coordinate_metadata: std::collections::HashMap::new(),
            buildings: Vec::new(),
        };

        save_checkpoint(&cp1, checkpoint_dir).unwrap();
        save_checkpoint(&cp2, checkpoint_dir).unwrap();

        let list = list_checkpoints(checkpoint_dir).unwrap();
        assert_eq!(list.len(), 2);
        assert!(list[0] > list[1]); // Newest first
    }

    #[test]
    fn test_delete_checkpoint() {
        let temp_dir = TempDir::new().unwrap();
        let checkpoint_dir = temp_dir.path();

        let cp = VmCheckpoint {
            timestamp: 1,
            description: None,
            pc: 0,
            regs: [0u32; 32],
            mode: 0,
            ram: Vec::new(),
            screen: Vec::new(),
            total_steps: 0,
            halted: false,
            building_metadata: std::collections::HashMap::new(),
            coordinate_metadata: std::collections::HashMap::new(),
            buildings: Vec::new(),
        };

        let filename = save_checkpoint(&cp, checkpoint_dir).unwrap();
        assert!(list_checkpoints(checkpoint_dir).unwrap().len() == 1);

        delete_checkpoint(&filename, checkpoint_dir).unwrap();
        assert!(list_checkpoints(checkpoint_dir).unwrap().is_empty());
    }

    #[test]
    fn test_diff_checkpoints() {
        let cp1 = VmCheckpoint {
            timestamp: 1,
            description: None,
            pc: 0x1000,
            regs: [0u32; 32],
            mode: 0,
            ram: vec![0u32; 512],
            screen: vec![0u32; 256],
            total_steps: 1000,
            halted: false,
            building_metadata: std::collections::HashMap::new(),
            coordinate_metadata: std::collections::HashMap::new(),
            buildings: Vec::new(),
        };

        let mut cp2 = cp1.clone();
        cp2.timestamp = 2;
        cp2.pc = 0x2000;
        cp2.regs[5] = 42;
        cp2.ram.resize(1024, 0);
        cp2.total_steps = 5000;

        let diff = diff_checkpoints(&cp1, &cp2);
        assert_eq!(diff["timestamp_delta"], 1);
        assert_eq!(diff["pc_changed"], true);
        assert_eq!(diff["pc_delta"], 4096);
        assert_eq!(diff["registers_changed"].as_array().unwrap().len(), 1);
        assert_eq!(diff["ram_size_delta"], 512);
        assert_eq!(diff["total_steps_delta"], 4000);
    }

    #[test]
    fn test_metadata_checkpoint_persistence() -> Result<(), CheckpointError> {
        use super::*;

        let mut checkpoint = VmCheckpoint {
            timestamp: 1234567890,
            description: None,
            pc: 0x1000,
            regs: [0u32; 32],
            mode: 0,
            ram: vec![0u32; 512],
            screen: vec![0u32; 256],
            total_steps: 1000,
            halted: false,
            building_metadata: std::collections::HashMap::new(),
            coordinate_metadata: std::collections::HashMap::new(),
            buildings: Vec::new(),
        };

        // Add metadata
        let building_id = 42;
        checkpoint.building_metadata.insert(
            building_id,
            [("description".to_string(), "Test building".to_string())]
                .iter()
                .cloned()
                .collect(),
        );

        let coord_key = (10u64 << 32) | 20u64;
        checkpoint.coordinate_metadata.insert(
            coord_key,
            [("note".to_string(), "Interesting spot".to_string())]
                .iter()
                .cloned()
                .collect(),
        );

        let temp_dir = TempDir::new().unwrap();
        let checkpoint_dir = temp_dir.path();

        let filename = save_checkpoint(&checkpoint, checkpoint_dir).unwrap();
        let restored = load_checkpoint(&filename, checkpoint_dir).unwrap();

        assert!(restored.building_metadata.contains_key(&building_id));
        let building_meta = restored.building_metadata.get(&building_id).unwrap();
        assert_eq!(
            building_meta.get("description"),
            Some(&"Test building".to_string())
        );

        assert!(restored.coordinate_metadata.contains_key(&coord_key));
        let coord_meta = restored.coordinate_metadata.get(&coord_key).unwrap();
        assert_eq!(
            coord_meta.get("note"),
            Some(&"Interesting spot".to_string())
        );

        Ok(())
    }
}
