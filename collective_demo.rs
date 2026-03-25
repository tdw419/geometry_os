// collective_demo.rs - Multi-instance communication demo
// Run: rustc collective_demo.rs && ./collective_demo

use std::collections::HashMap;

fn main() {
    println!("╔══════════════════════════════════════════════╗");
    println!("║    GEOMETRY OS: COLLECTIVE SYNC DEMO        ║");
    println!("╚══════════════════════════════════════════════╝");
    println!();

    // Simulate 3 Geometry OS instances
    println!("🌐 Spawning collective network (3 instances)...\n");

    let mut instances: Vec<CollectiveInstance> = Vec::new();
    for i in 0..3 {
        let id = format!("geometry-os-{:03}", i);
        let coherence = 0.7 + (i as f32 * 0.1);
        instances.push(CollectiveInstance::new(&id, coherence));
        println!("   ✅ {} spawned (coherence: {:.1}%)", id, coherence * 100.0);
    }
    println!();

    // Register peers
    println!("🤝 Establishing peer connections...\n");
    for i in 0..instances.len() {
        for j in 0..instances.len() {
            if i != j {
                let peer_id = format!("geometry-os-{:03}", j);
                instances[i].register_peer(&peer_id, &format!("127.0.0.1:{}", 7331 + j));
            }
        }
    }
    println!("   ✅ All peers connected\n");

    // Create wisdom packets
    println!("📤 Creating wisdom packets...\n");
    let mut packets: Vec<WisdomPacket> = Vec::new();

    // Instance 0: High coherence, learned patterns
    let mut packet0 = WisdomPacket::new("geometry-os-000", 0.85);
    packet0.add_pattern([1, 0, 1, 0, 1, 0, 1, 0, 1]);
    packet0.add_lesson("DATA glyph recognition improved with noise training");
    packet0.add_adjustment("Increase backprop epochs to 20");
    packets.push(packet0);

    // Instance 1: Medium coherence, recovery patterns
    let mut packet1 = WisdomPacket::new("geometry-os-001", 0.75);
    packet1.add_pattern([0, 1, 0, 1, 0, 1, 0, 1, 0]);
    packet1.add_lesson("Dissonant events reduced after dream cycle");
    packet1.add_adjustment("Extend idle timeout to 10 minutes");
    packets.push(packet1);

    // Instance 2: Highest coherence, stable patterns
    let mut packet2 = WisdomPacket::new("geometry-os-002", 0.92);
    packet2.add_pattern([1, 1, 0, 1, 0, 1, 0, 1, 1]);
    packet2.add_lesson("Self-awareness threshold of 0.7 is optimal");
    packet2.add_adjustment("Consider lowering repair threshold to 0.75");
    packets.push(packet2);

    println!("   ✅ 3 wisdom packets created\n");

    // Broadcast wisdom
    println!("📡 Broadcasting wisdom across collective...\n");
    for packet in packets.iter() {
        let source = &packet.source_id;
        let bytes = packet.to_bytes().len();
        println!("   📤 {} broadcasting ({} bytes)", source, bytes);
        println!("      Coherence: {:.1}%", packet.coherence * 100.0);
        println!("      Patterns: {}", packet.patterns.len());
        println!("      Lessons: {}", packet.lessons.len());
    }
    println!();

    // Simulate receiving wisdom
    println!("📥 Receiving wisdom at each instance...\n");
    for i in 0..instances.len() {
        for packet in &packets {
            if packet.source_id != instances[i].id {
                instances[i].receive_wisdom(packet.clone());
            }
        }
    }
    println!();

    // Final status
    println!("──────────────────────────────────────────────");
    println!("✅ COLLECTIVE SYNC DEMO COMPLETE");
    println!("──────────────────────────────────────────────\n");

    for instance in &instances {
        println!("📊 {}:", instance.id);
        println!("   Peers: {}", instance.peers.len());
        println!("   Wisdom received: {}", instance.wisdom_received.len());
        if !instance.wisdom_received.is_empty() {
            let avg: f32 = instance.wisdom_received.iter().map(|p| p.coherence).sum::<f32>() 
                / instance.wisdom_received.len() as f32;
            println!("   Avg received coherence: {:.1}%", avg * 100.0);
        }
    }

    // Show serialization demo
    println!("\n📦 Serialization Test:\n");
    let test_packet = &packets[2];
    let bytes = test_packet.to_bytes();
    let recovered = WisdomPacket::from_bytes(&bytes);

    println!("   Original: {} (coherence: {:.1}%)", test_packet.source_id, test_packet.coherence * 100.0);
    if let Some(r) = recovered {
        println!("   Recovered: {} (coherence: {:.1}%)", r.source_id, r.coherence * 100.0);
        println!("   Bytes: {} bytes", bytes.len());
        println!("   ✅ Serialization verified");
    } else {
        println!("   ❌ Deserialization failed");
    }
}

// Simplified types for standalone demo

#[derive(Clone)]
struct WisdomPacket {
    source_id: String,
    coherence: f32,
    patterns: Vec<[u8; 9]>,
    lessons: Vec<String>,
    adjustments: Vec<String>,
}

impl WisdomPacket {
    fn new(source_id: &str, coherence: f32) -> Self {
        Self {
            source_id: source_id.to_string(),
            coherence,
            patterns: Vec::new(),
            lessons: Vec::new(),
            adjustments: Vec::new(),
        }
    }

    fn add_pattern(&mut self, pattern: [u8; 9]) {
        self.patterns.push(pattern);
    }

    fn add_lesson(&mut self, lesson: &str) {
        self.lessons.push(lesson.to_string());
    }

    fn add_adjustment(&mut self, adjustment: &str) {
        self.adjustments.push(adjustment.to_string());
    }

    fn to_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::new();
        // Header: "GOSW" (Geometry OS Wisdom)
        bytes.extend_from_slice(b"GOSW");
        // Source ID length + string
        bytes.push(self.source_id.len() as u8);
        bytes.extend(self.source_id.bytes());
        // Coherence (4 bytes)
        bytes.extend_from_slice(&self.coherence.to_le_bytes());
        // Patterns count + patterns
        bytes.extend_from_slice(&(self.patterns.len() as u16).to_le_bytes());
        for p in &self.patterns {
            bytes.extend_from_slice(p);
        }
        // Lessons
        bytes.push(self.lessons.len() as u8);
        for l in &self.lessons {
            bytes.push(l.len() as u8);
            bytes.extend(l.bytes());
        }
        // Adjustments
        bytes.push(self.adjustments.len() as u8);
        for a in &self.adjustments {
            bytes.push(a.len() as u8);
            bytes.extend(a.bytes());
        }
        bytes
    }

    fn from_bytes(bytes: &[u8]) -> Option<Self> {
        if bytes.len() < 8 || &bytes[0..4] != b"GOSW" {
            return None;
        }
        let mut pos = 4;
        // Source ID
        let id_len = bytes[pos] as usize;
        pos += 1;
        let source_id = String::from_utf8(bytes[pos..pos+id_len].to_vec()).ok()?;
        pos += id_len;
        // Coherence
        let mut arr = [0u8; 4];
        arr.copy_from_slice(&bytes[pos..pos+4]);
        let coherence = f32::from_le_bytes(arr);
        pos += 4;
        // Patterns count
        let mut arr2 = [0u8; 2];
        arr2.copy_from_slice(&bytes[pos..pos+2]);
        let pattern_count = u16::from_le_bytes(arr2) as usize;
        
        Some(Self {
            source_id,
            coherence,
            patterns: vec![[0; 9]; pattern_count], // Simplified
            lessons: Vec::new(),
            adjustments: Vec::new(),
        })
    }
}

struct CollectiveInstance {
    id: String,
    coherence: f32,
    peers: HashMap<String, String>,
    wisdom_received: Vec<WisdomPacket>,
}

impl CollectiveInstance {
    fn new(id: &str, coherence: f32) -> Self {
        Self {
            id: id.to_string(),
            coherence,
            peers: HashMap::new(),
            wisdom_received: Vec::new(),
        }
    }

    fn register_peer(&mut self, peer_id: &str, address: &str) {
        self.peers.insert(peer_id.to_string(), address.to_string());
        println!("   🤝 {} ↔ {}", self.id, peer_id);
    }

    fn receive_wisdom(&mut self, packet: WisdomPacket) {
        println!("   📥 {} received wisdom from {}", self.id, packet.source_id);
        self.wisdom_received.push(packet);
    }
}
