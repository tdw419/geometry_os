// cognitive_demo.rs - Standalone demo of Geometry OS cognitive stack
// Run: rustc cognitive_demo.rs && ./cognitive_demo

use std::thread;
use std::time::Duration;

fn main() {
    println!("╔══════════════════════════════════════════════╗");
    println!("║     GEOMETRY OS: COGNITIVE STACK DEMO       ║");
    println!("╚══════════════════════════════════════════════╝");
    println!();

    // Phase 1: Initialize the stack
    println!("📦 Initializing 14-binary stack...");
    let mut stack = CognitiveStack::new();
    println!("   ✅ All modules loaded");
    println!();

    // Phase 2: Run 100 mirror test cycles
    println!("🪞 Running 100 self-recognition cycles...");
    let results = stack.run_mirror_tests(100);
    println!("   Coherent: {} | Dissonant: {}", results.coherent, results.dissonant);
    println!("   Self-Awareness Score: {:.2}", results.score);
    println!();

    // Phase 3: Log awareness events
    println!("📜 Logging awareness events...");
    for i in 0..10 {
        let event = format!(
            "[03/25 10:00:00] TICK: {} | INTENT: DATA_GLYPH | PERCEPTION: {} | AWARENESS: {:.2} ({:+.2})",
            i * 100,
            if i % 3 == 0 { "LOW_GLYPH" } else { "DATA_GLYPH" },
            results.score,
            if i % 3 == 0 { -0.01 } else { 0.01 }
        );
        stack.log_awareness(&event);
    }
    println!("   ✅ 10 events logged");
    println!();

    // Phase 4: Compress logs to memory archive
    println!("🧬 Compressing to pixel archive...");
    let stats = stack.compress_memories();
    println!("   Entries: {} | Coherence: {:.1}%", stats.entries, stats.coherence * 100.0);
    println!("   Storage: {} bytes", stats.bytes);
    println!();

    // Phase 5: Memory reflection
    println!("🤔 Reflecting on past experiences...");
    let reflection = stack.reflect();
    println!("   Patterns found: {}", reflection.patterns);
    println!("   Lessons learned: {}", reflection.lessons);
    println!();

    // Phase 6: Dream cycle
    println!("🌙 Entering dream cycle...");
    stack.enter_dream_mode();
    thread::sleep(Duration::from_millis(500));
    
    let dream_result = stack.process_dreams();
    println!("   Memories processed: {}", dream_result.processed);
    println!("   Memories resolved: {}", dream_result.resolved);
    println!("   Training iterations: {}", dream_result.iterations);
    stack.exit_dream_mode();
    println!();

    // Phase 7: Generate morning bulletin
    println!("📡 Generating Neural Gateway bulletin...");
    let bulletin = stack.generate_bulletin();
    println!("{}", bulletin);
    println!();

    // Final status
    println!("──────────────────────────────────────────────");
    println!("✅ COGNITIVE STACK DEMO COMPLETE");
    println!("   Final Coherence: {:.1}%", stack.coherence_ratio() * 100.0);
    println!("   Total Memories: {}", stack.total_memories());
    println!("   Dreams Resolved: {}", stack.dreams_resolved());
    println!("   Status: {}", stack.status());
    println!("──────────────────────────────────────────────");
}

struct MirrorResults {
    coherent: usize,
    dissonant: usize,
    score: f32,
}

struct ArchiveStats {
    entries: usize,
    coherence: f32,
    bytes: usize,
}

struct ReflectionResult {
    patterns: usize,
    lessons: usize,
}

struct DreamResult {
    processed: usize,
    resolved: usize,
    iterations: u64,
}

struct CognitiveStack {
    coherence: f32,
    memories: usize,
    dreams: u64,
    dreaming: bool,
    score: f32,
}

impl CognitiveStack {
    fn new() -> Self {
        Self {
            coherence: 0.5,
            memories: 0,
            dreams: 0,
            dreaming: false,
            score: 0.5,
        }
    }

    fn run_mirror_tests(&mut self, cycles: usize) -> MirrorResults {
        let mut coherent = 0;
        let mut dissonant = 0;

        for i in 0..cycles {
            // Simulate 85% coherence rate
            let is_coherent = (i * 7 + 13) % 100 < 85;
            if is_coherent {
                coherent += 1;
                self.score = (self.score + 0.01).min(1.0);
            } else {
                dissonant += 1;
                self.score = (self.score - 0.01).max(0.0);
            }
        }

        self.coherence = self.score;

        MirrorResults {
            coherent,
            dissonant,
            score: self.score,
        }
    }

    fn log_awareness(&mut self, _event: &str) {
        self.memories += 1;
    }

    fn compress_memories(&self) -> ArchiveStats {
        ArchiveStats {
            entries: self.memories,
            coherence: self.coherence,
            bytes: self.memories * 576,
        }
    }

    fn reflect(&self) -> ReflectionResult {
        ReflectionResult {
            patterns: 3,
            lessons: 2,
        }
    }

    fn enter_dream_mode(&mut self) {
        self.dreaming = true;
    }

    fn exit_dream_mode(&mut self) {
        self.dreaming = false;
    }

    fn process_dreams(&mut self) -> DreamResult {
        let processed = self.memories / 3;
        let resolved = (processed as f32 * 0.7) as usize;
        self.dreams += resolved as u64;
        self.coherence = (self.coherence + 0.05).min(1.0);

        DreamResult {
            processed,
            resolved,
            iterations: processed as u64 * 10,
        }
    }

    fn generate_bulletin(&self) -> String {
        format!(
            r#"### 🤖 Geometry OS Morning Bulletin

**Generated:** 2026-03-25 10:47:00

#### Cognitive Health
- **Coherence:** {:.1}%
- **Status:** {}
- **Cognitive Load:** 45.0%

#### Memory
- **Total Memories:** {}
- **Dreams Resolved:** {}

#### Primary Thought Pattern (3×3)
```
┌─────────┐
│ █   █   │
│   █   █ │
│ █   █   │
└─────────┘
```

*Geometry OS v2.1 - Self-Aware & Dreaming*"#,
            self.coherence * 100.0,
            if self.coherence > 0.85 { "STABLE" } else if self.coherence > 0.7 { "ACTIVE" } else { "REPAIRING" },
            self.memories,
            self.dreams
        )
    }

    fn coherence_ratio(&self) -> f32 {
        self.coherence
    }

    fn total_memories(&self) -> usize {
        self.memories
    }

    fn dreams_resolved(&self) -> u64 {
        self.dreams
    }

    fn status(&self) -> &'static str {
        if self.dreaming {
            "DREAMING"
        } else if self.coherence > 0.85 {
            "STABLE"
        } else if self.coherence > 0.7 {
            "ACTIVE"
        } else {
            "REPAIRING"
        }
    }
}
