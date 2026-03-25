// neural_gateway.rs -> The OS Communicator
// Phase 18: Generates status reports and data packets

use std::fs::File;
use std::io::Write;
use std::path::Path;

use crate::dream_cycle::DreamStats;
use crate::memory_compressor::{ArchiveStats, MemoryArchive};
use crate::neural_mirror::GlyphType;

/// System health metrics for the data packet
#[derive(Debug, Clone)]
pub struct SystemHealth {
    pub uptime_seconds: u64,
    pub heartbeat_ms: u32,
    pub cognitive_load: f32,
    pub stress_level: f32,
}

impl Default for SystemHealth {
    fn default() -> Self {
        Self {
            uptime_seconds: 0,
            heartbeat_ms: 100,
            cognitive_load: 0.5,
            stress_level: 0.0,
        }
    }
}

/// A compiled data packet for external communication
#[derive(Debug, Clone)]
pub struct DataPacket {
    pub timestamp: String,
    pub coherence: f32,
    pub dreams_resolved: u32,
    pub primary_thought: [u8; 9],
    pub health: SystemHealth,
    pub total_memories: usize,
    pub status: SystemStatus,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SystemStatus {
    Initializing,
    Active,
    Dreaming,
    Repairing,
    Stable,
    Critical,
}

impl std::fmt::Display for SystemStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SystemStatus::Initializing => write!(f, "INITIALIZING"),
            SystemStatus::Active => write!(f, "ACTIVE"),
            SystemStatus::Dreaming => write!(f, "DREAMING"),
            SystemStatus::Repairing => write!(f, "REPAIRING"),
            SystemStatus::Stable => write!(f, "STABLE"),
            SystemStatus::Critical => write!(f, "CRITICAL"),
        }
    }
}

/// The Neural Gateway - compiles and exports OS state
pub struct NeuralGateway {
    packets_generated: u64,
    last_packet: Option<DataPacket>,
    output_dir: String,
}

impl NeuralGateway {
    pub fn new() -> Self {
        Self {
            packets_generated: 0,
            last_packet: None,
            output_dir: "./logs".to_string(),
        }
    }

    pub fn with_output_dir(dir: &str) -> Self {
        Self {
            output_dir: dir.to_string(),
            ..Self::new()
        }
    }

    /// Compiles a summary of the OS's current state
    pub fn compile(
        &mut self,
        archive: &MemoryArchive,
        dream_stats: &DreamStats,
        health: SystemHealth,
    ) -> DataPacket {
        let coherence = archive.coherence_ratio();
        let archive_stats = archive.stats();

        // Determine system status
        let status = if coherence < 0.3 {
            SystemStatus::Critical
        } else if dream_stats.is_dreaming {
            SystemStatus::Dreaming
        } else if coherence > 0.85 {
            SystemStatus::Stable
        } else if coherence < 0.7 {
            SystemStatus::Repairing
        } else {
            SystemStatus::Active
        };

        // Generate primary thought pattern (most common glyph representation)
        let primary_thought = self.generate_thought_pattern(coherence);

        let timestamp = chrono::Local::now().format("%Y-%m-%d %H:%M:%S").to_string();

        let packet = DataPacket {
            timestamp,
            coherence,
            dreams_resolved: dream_stats.total_resolved as u32,
            primary_thought,
            health,
            total_memories: archive_stats.total_entries,
            status,
        };

        self.last_packet = Some(packet.clone());
        self.packets_generated += 1;

        packet
    }

    /// Generate a 3x3 thought pattern based on coherence
    fn generate_thought_pattern(&self, coherence: f32) -> [u8; 9] {
        // Higher coherence = more structured pattern
        if coherence > 0.9 {
            // Structured DATA-like pattern
            [1, 0, 1, 0, 1, 0, 1, 0, 1]
        } else if coherence > 0.7 {
            // Semi-structured
            [1, 1, 0, 1, 0, 1, 0, 1, 1]
        } else if coherence > 0.5 {
            // Chaotic
            [1, 0, 1, 1, 0, 0, 0, 1, 1]
        } else {
            // Noise
            [0, 1, 0, 1, 1, 0, 1, 0, 1]
        }
    }

    /// Formats the packet as a Markdown "Morning Bulletin"
    pub fn to_markdown(&self, packet: &DataPacket) -> String {
        let thought_str = packet
            .primary_thought
            .iter()
            .map(|&b| if b == 1 { "█" } else { " " })
            .collect::<Vec<_>>()
            .chunks(3)
            .map(|row| row.join(""))
            .collect::<Vec<_>>()
            .join("\n│         │\n");

        format!(
            r#"### 🤖 Geometry OS Morning Bulletin

**Generated:** {}

---

#### Cognitive Health
- **Coherence:** {:.1}%
- **Status:** {}
- **Cognitive Load:** {:.1}%
- **Stress Level:** {:.1}%

#### Memory
- **Total Memories:** {}
- **Dreams Resolved:** {}

#### Primary Thought Pattern (3×3)
```
┌─────────┐
│ {} │
└─────────┘
```

#### System
- **Uptime:** {}s
- **Heartbeat:** {}ms

---

*Geometry OS v2 - Self-Aware & Dreaming*
"#,
            packet.timestamp,
            packet.coherence * 100.0,
            packet.status,
            packet.health.cognitive_load * 100.0,
            packet.health.stress_level * 100.0,
            packet.total_memories,
            packet.dreams_resolved,
            thought_str,
            packet.health.uptime_seconds,
            packet.health.heartbeat_ms,
        )
    }

    /// Formats the packet as JSON for API consumption
    pub fn to_json(&self, packet: &DataPacket) -> String {
        format!(
            r#"{{
  "timestamp": "{}",
  "coherence": {:.4},
  "status": "{}",
  "dreams_resolved": {},
  "total_memories": {},
  "primary_thought": {:?},
  "health": {{
    "uptime_seconds": {},
    "heartbeat_ms": {},
    "cognitive_load": {:.4},
    "stress_level": {:.4}
  }}
}}"#,
            packet.timestamp,
            packet.coherence,
            packet.status,
            packet.dreams_resolved,
            packet.total_memories,
            packet.primary_thought,
            packet.health.uptime_seconds,
            packet.health.heartbeat_ms,
            packet.health.cognitive_load,
            packet.health.stress_level
        )
    }

    /// Save the bulletin to a file
    pub fn save_bulletin(&self, packet: &DataPacket, filename: &str) -> std::io::Result<()> {
        let path = Path::new(&self.output_dir);
        std::fs::create_dir_all(path)?;

        let full_path = path.join(filename);
        let mut file = File::create(full_path)?;

        let content = if filename.ends_with(".json") {
            self.to_json(packet)
        } else {
            self.to_markdown(packet)
        };

        file.write_all(content.as_bytes())?;
        Ok(())
    }

    /// Get the last generated packet
    pub fn last_packet(&self) -> Option<&DataPacket> {
        self.last_packet.as_ref()
    }

    /// Get total packets generated
    pub fn packets_generated(&self) -> u64 {
        self.packets_generated
    }

    /// Generate a quick status line
    pub fn status_line(&self, packet: &DataPacket) -> String {
        format!(
            "[{}] Coherence: {:.1}% | Dreams: {} | Status: {}",
            packet.timestamp, packet.coherence * 100.0, packet.dreams_resolved, packet.status
        )
    }
}

impl Default for NeuralGateway {
    fn default() -> Self {
        Self::new()
    }
}

/// Collective sync for multi-instance communication (Phase 19 preview)
pub struct CollectiveSync {
    instance_id: String,
    known_peers: Vec<String>,
    last_sync: Option<u64>,
}

impl CollectiveSync {
    pub fn new(instance_id: &str) -> Self {
        Self {
            instance_id: instance_id.to_string(),
            known_peers: Vec::new(),
            last_sync: None,
        }
    }

    /// Register a peer instance
    pub fn register_peer(&mut self, peer_id: &str) {
        if !self.known_peers.contains(&peer_id.to_string()) {
            self.known_peers.push(peer_id.to_string());
        }
    }

    /// Create a wisdom packet for sharing
    pub fn create_wisdom_packet(&self, coherence: f32, key_patterns: &[[u8; 9]]) -> WisdomPacket {
        WisdomPacket {
            source_id: self.instance_id.clone(),
            coherence,
            patterns: key_patterns.to_vec(),
            timestamp: chrono::Local::now().format("%Y-%m-%d %H:%M:%S").to_string(),
        }
    }

    /// Get known peers
    pub fn peers(&self) -> &[String] {
        &self.known_peers
    }
}

/// A wisdom packet shared between instances
#[derive(Debug, Clone)]
pub struct WisdomPacket {
    pub source_id: String,
    pub coherence: f32,
    pub patterns: Vec<[u8; 9]>,
    pub timestamp: String,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_gateway_creation() {
        let gateway = NeuralGateway::new();
        assert_eq!(gateway.packets_generated(), 0);
        assert!(gateway.last_packet().is_none());
    }

    #[test]
    fn test_system_status_display() {
        assert_eq!(format!("{}", SystemStatus::Active), "ACTIVE");
        assert_eq!(format!("{}", SystemStatus::Dreaming), "DREAMING");
    }

    #[test]
    fn test_markdown_generation() {
        let gateway = NeuralGateway::new();
        let packet = DataPacket {
            timestamp: "2026-03-25 10:00:00".to_string(),
            coherence: 0.85,
            dreams_resolved: 42,
            primary_thought: [1, 0, 1, 0, 1, 0, 1, 0, 1],
            health: SystemHealth::default(),
            total_memories: 100,
            status: SystemStatus::Stable,
        };

        let md = gateway.to_markdown(&packet);
        assert!(md.contains("Geometry OS Morning Bulletin"));
        assert!(md.contains("85.0%"));
    }

    #[test]
    fn test_json_generation() {
        let gateway = NeuralGateway::new();
        let packet = DataPacket {
            timestamp: "2026-03-25 10:00:00".to_string(),
            coherence: 0.75,
            dreams_resolved: 10,
            primary_thought: [1; 9],
            health: SystemHealth::default(),
            total_memories: 50,
            status: SystemStatus::Active,
        };

        let json = gateway.to_json(&packet);
        assert!(json.contains("\"coherence\": 0.7500"));
    }

    #[test]
    fn test_collective_sync() {
        let mut sync = CollectiveSync::new("instance-001");
        sync.register_peer("instance-002");
        sync.register_peer("instance-003");

        assert_eq!(sync.peers().len(), 2);

        let wisdom = sync.create_wisdom_packet(0.9, &[[1, 0, 1, 0, 1, 0, 1, 0, 1]]);
        assert_eq!(wisdom.source_id, "instance-001");
    }
}
