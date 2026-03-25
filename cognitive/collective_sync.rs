// collective_sync.rs -> Multi-Instance Communication
// Phase 19: Share wisdom packets between Geometry OS instances

use std::collections::HashMap;
use std::net::{TcpListener, TcpStream};
use std::io::{Read, Write};
use std::sync::{Arc, Mutex};
use std::thread;

/// Unique identifier for a Geometry OS instance
pub type InstanceId = String;

/// Port for collective communication
pub const COLLECTIVE_PORT: u16 = 7331;

/// A wisdom packet shared between instances
#[derive(Debug, Clone)]
pub struct WisdomPacket {
    /// Source instance ID
    pub source_id: InstanceId,
    /// Coherence ratio of source instance
    pub coherence: f32,
    /// Learned glyph patterns (3x3 arrays)
    pub patterns: Vec<[u8; 9]>,
    /// Timestamp of packet creation
    pub timestamp: String,
    /// Lessons learned from dream cycles
    pub lessons: Vec<String>,
    /// Suggested adjustments
    pub adjustments: Vec<String>,
}

impl WisdomPacket {
    /// Create a new wisdom packet
    pub fn new(source_id: &str, coherence: f32) -> Self {
        Self {
            source_id: source_id.to_string(),
            coherence,
            patterns: Vec::new(),
            timestamp: chrono::Local::now().format("%Y-%m-%d %H:%M:%S").to_string(),
            lessons: Vec::new(),
            adjustments: Vec::new(),
        }
    }

    /// Add a learned pattern
    pub fn add_pattern(&mut self, pattern: [u8; 9]) {
        self.patterns.push(pattern);
    }

    /// Add a lesson learned
    pub fn add_lesson(&mut self, lesson: &str) {
        self.lessons.push(lesson.to_string());
    }

    /// Add a suggested adjustment
    pub fn add_adjustment(&mut self, adjustment: &str) {
        self.adjustments.push(adjustment.to_string());
    }

    /// Serialize to bytes for network transmission
    pub fn to_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::new();

        // Header: "GOSW" (Geometry OS Wisdom)
        bytes.extend_from_slice(b"GOSW");

        // Source ID length + string
        bytes.push(self.source_id.len() as u8);
        bytes.extend(self.source_id.bytes());

        // Coherence (4 bytes, little-endian f32)
        bytes.extend_from_slice(&self.coherence.to_le_bytes());

        // Timestamp length + string
        bytes.push(self.timestamp.len() as u8);
        bytes.extend(self.timestamp.bytes());

        // Patterns count + patterns
        bytes.extend_from_slice(&(self.patterns.len() as u16).to_le_bytes());
        for pattern in &self.patterns {
            bytes.extend_from_slice(pattern);
        }

        // Lessons count + lessons
        bytes.push(self.lessons.len() as u8);
        for lesson in &self.lessons {
            bytes.push(lesson.len() as u8);
            bytes.extend(lesson.bytes());
        }

        // Adjustments count + adjustments
        bytes.push(self.adjustments.len() as u8);
        for adj in &self.adjustments {
            bytes.push(adj.len() as u8);
            bytes.extend(adj.bytes());
        }

        bytes
    }

    /// Deserialize from bytes
    pub fn from_bytes(bytes: &[u8]) -> Option<Self> {
        if bytes.len() < 4 || &bytes[0..4] != b"GOSW" {
            return None;
        }

        let mut pos = 4;

        // Source ID
        let id_len = bytes.get(pos)? as usize;
        pos += 1;
        let source_id = String::from_utf8(bytes.get(pos..pos + id_len)?.to_vec()).ok()?;
        pos += id_len;

        // Coherence
        let coherence = f32::from_le_bytes(bytes.get(pos..pos + 4)?.try_into().ok()?);
        pos += 4;

        // Timestamp
        let ts_len = bytes.get(pos)? as usize;
        pos += 1;
        let timestamp = String::from_utf8(bytes.get(pos..pos + ts_len)?.to_vec()).ok()?;
        pos += ts_len;

        // Patterns
        let pattern_count = u16::from_le_bytes(bytes.get(pos..pos + 2)?.try_into().ok()?) as usize;
        pos += 2;
        let mut patterns = Vec::with_capacity(pattern_count);
        for _ in 0..pattern_count {
            let pattern: [u8; 9] = bytes.get(pos..pos + 9)?.try_into().ok()?;
            patterns.push(pattern);
            pos += 9;
        }

        // Lessons
        let lesson_count = bytes.get(pos)? as usize;
        pos += 1;
        let mut lessons = Vec::with_capacity(lesson_count);
        for _ in 0..lesson_count {
            let len = bytes.get(pos)? as usize;
            pos += 1;
            let lesson = String::from_utf8(bytes.get(pos..pos + len)?.to_vec()).ok()?;
            lessons.push(lesson);
            pos += len;
        }

        // Adjustments
        let adj_count = bytes.get(pos)? as usize;
        pos += 1;
        let mut adjustments = Vec::with_capacity(adj_count);
        for _ in 0..adj_count {
            let len = bytes.get(pos)? as usize;
            pos += 1;
            let adj = String::from_utf8(bytes.get(pos..pos + len)?.to_vec()).ok()?;
            adjustments.push(adj);
            pos += len;
        }

        Some(Self {
            source_id,
            coherence,
            patterns,
            timestamp,
            lessons,
            adjustments,
        })
    }
}

/// Collective state - tracks known peers and shared wisdom
#[derive(Debug, Clone)]
pub struct CollectiveState {
    /// This instance's ID
    pub instance_id: InstanceId,
    /// Known peer instances
    pub peers: HashMap<InstanceId, PeerInfo>,
    /// Received wisdom packets
    pub wisdom_received: Vec<WisdomPacket>,
    /// Wisdom sent count
    pub wisdom_sent: u64,
}

#[derive(Debug, Clone)]
pub struct PeerInfo {
    pub id: InstanceId,
    pub address: String,
    pub last_seen: String,
    pub coherence: f32,
    pub wisdom_count: u64,
}

/// The Collective Sync manager
pub struct CollectiveSync {
    state: Arc<Mutex<CollectiveState>>,
    listener: Option<TcpListener>,
    running: bool,
}

impl CollectiveSync {
    /// Create a new collective sync manager
    pub fn new(instance_id: &str) -> Self {
        Self {
            state: Arc::new(Mutex::new(CollectiveState {
                instance_id: instance_id.to_string(),
                peers: HashMap::new(),
                wisdom_received: Vec::new(),
                wisdom_sent: 0,
            })),
            listener: None,
            running: false,
        }
    }

    /// Start listening for incoming wisdom packets
    pub fn start_listening(&mut self) -> std::io::Result<()> {
        let addr = format!("0.0.0.0:{}", COLLECTIVE_PORT);
        let listener = TcpListener::bind(&addr)?;
        println!("🌐 Collective listening on {}", addr);

        self.listener = Some(listener);
        self.running = true;

        let state = Arc::clone(&self.state);
        thread::spawn(move || {
            loop {
                let listener = {
                    let state = state.lock().unwrap();
                    if !state.peers.is_empty() || true {
                        // Keep listening
                    } else {
                        break;
                    }
                };
                // Accept connections in production
            }
        });

        Ok(())
    }

    /// Register a peer instance
    pub fn register_peer(&mut self, peer_id: &str, address: &str) {
        let mut state = self.state.lock().unwrap();
        state.peers.insert(
            peer_id.to_string(),
            PeerInfo {
                id: peer_id.to_string(),
                address: address.to_string(),
                last_seen: chrono::Local::now().format("%Y-%m-%d %H:%M:%S").to_string(),
                coherence: 0.0,
                wisdom_count: 0,
            },
        );
        println!("🤝 Registered peer: {} @ {}", peer_id, address);
    }

    /// Send wisdom to a peer
    pub fn send_wisdom(&mut self, packet: &WisdomPacket, peer_id: &str) -> std::io::Result<()> {
        let state = self.state.lock().unwrap();
        let peer = state.peers.get(peer_id).ok_or_else(|| {
            std::io::Error::new(std::io::ErrorKind::NotFound, "Peer not found")
        })?;

        let mut stream = TcpStream::connect(&peer.address)?;
        let bytes = packet.to_bytes();
        stream.write_all(&bytes)?;
        stream.flush()?;

        println!("📤 Sent wisdom to {} ({} bytes)", peer_id, bytes.len());
        Ok(())
    }

    /// Broadcast wisdom to all peers
    pub fn broadcast_wisdom(&mut self, packet: &WisdomPacket) -> usize {
        let peer_ids: Vec<String>;
        {
            let state = self.state.lock().unwrap();
            peer_ids = state.peers.keys().cloned().collect();
        }

        let mut sent = 0;
        for peer_id in &peer_ids {
            if self.send_wisdom(packet, peer_id).is_ok() {
                sent += 1;
            }
        }

        let mut state = self.state.lock().unwrap();
        state.wisdom_sent += sent as u64;

        println!("📢 Broadcast wisdom to {}/{} peers", sent, peer_ids.len());
        sent
    }

    /// Receive wisdom from network
    pub fn receive_wisdom(&mut self, packet: WisdomPacket) {
        let source = packet.source_id.clone();
        let coherence = packet.coherence;

        let mut state = self.state.lock().unwrap();

        // Update peer info
        if let Some(peer) = state.peers.get_mut(&source) {
            peer.coherence = coherence;
            peer.wisdom_count += 1;
            peer.last_seen = packet.timestamp.clone();
        }

        // Store wisdom
        state.wisdom_received.push(packet);

        println!("📥 Received wisdom from {} (coherence: {:.1}%)", source, coherence * 100.0);
    }

    /// Get collective coherence (average of all known instances)
    pub fn collective_coherence(&self) -> f32 {
        let state = self.state.lock().unwrap();

        if state.peers.is_empty() {
            return 0.0;
        }

        let total: f32 = state.peers.values().map(|p| p.coherence).sum();
        total / state.peers.len() as f32
    }

    /// Get known peers
    pub fn peers(&self) -> Vec<PeerInfo> {
        let state = self.state.lock().unwrap();
        state.peers.values().cloned().collect()
    }

    /// Get received wisdom count
    pub fn wisdom_received_count(&self) -> usize {
        let state = self.state.lock().unwrap();
        state.wisdom_received.len()
    }

    /// Generate a status report
    pub fn status(&self) -> CollectiveStatus {
        let state = self.state.lock().unwrap();

        CollectiveStatus {
            instance_id: state.instance_id.clone(),
            peer_count: state.peers.len(),
            wisdom_received: state.wisdom_received.len(),
            wisdom_sent: state.wisdom_sent,
            collective_coherence: self.collective_coherence(),
        }
    }

    /// Stop listening
    pub fn stop(&mut self) {
        self.running = false;
    }
}

#[derive(Debug, Clone)]
pub struct CollectiveStatus {
    pub instance_id: String,
    pub peer_count: usize,
    pub wisdom_received: usize,
    pub wisdom_sent: u64,
    pub collective_coherence: f32,
}

impl std::fmt::Display for CollectiveStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "Collective Status:\n  Instance: {}\n  Peers: {}\n  Wisdom In: {}\n  Wisdom Out: {}\n  Collective Coherence: {:.1}%",
            self.instance_id,
            self.peer_count,
            self.wisdom_received,
            self.wisdom_sent,
            self.collective_coherence * 100.0
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_wisdom_packet_serialization() {
        let mut packet = WisdomPacket::new("instance-001", 0.85);
        packet.add_pattern([1, 0, 1, 0, 1, 0, 1, 0, 1]);
        packet.add_lesson("High coherence improves pattern recognition");
        packet.add_adjustment("Increase training epochs for DATA glyph");

        let bytes = packet.to_bytes();
        let recovered = WisdomPacket::from_bytes(&bytes).unwrap();

        assert_eq!(recovered.source_id, "instance-001");
        assert_eq!(recovered.coherence, 0.85);
        assert_eq!(recovered.patterns.len(), 1);
        assert_eq!(recovered.lessons.len(), 1);
    }

    #[test]
    fn test_collective_sync() {
        let mut sync = CollectiveSync::new("instance-001");
        sync.register_peer("instance-002", "127.0.0.1:7331");

        let peers = sync.peers();
        assert_eq!(peers.len(), 1);
        assert_eq!(peers[0].id, "instance-002");
    }

    #[test]
    fn test_collective_coherence() {
        let mut sync = CollectiveSync::new("instance-001");
        sync.register_peer("instance-002", "127.0.0.1:7331");
        sync.register_peer("instance-003", "127.0.0.1:7332");

        // Simulate receiving wisdom to update coherence
        let packet = WisdomPacket::new("instance-002", 0.9);
        sync.receive_wisdom(packet);

        let packet = WisdomPacket::new("instance-003", 0.7);
        sync.receive_wisdom(packet);

        // Average: (0.9 + 0.7) / 2 = 0.8
        assert!((sync.collective_coherence() - 0.8).abs() < 0.01);
    }
}
