// dashboard.rs -> Real-time Geometry OS Dashboard
// Phase 20: Visual monitoring system

use std::io::{stdout, Write};
use std::time::{Duration, Instant};

fn main() {
    println!("╔════════════════════════════════════════════════════════════════╗");
    println!("║          GEOMETRY OS: LIVE DASHBOARD v2.1                     ║");
    println!("╚════════════════════════════════════════════════════════════════╝");
    println!();

    let start = Instant::now();
    let mut tick = 0u64;
    let mut coherence = 0.50f32;
    let mut memories = 0usize;
    let mut dreams = 0u64;
    let mut status = "INITIALIZING";

    // Simulate 10 seconds of runtime
    let runtime_seconds = 10;
    let ticks_per_second = 100;
    let total_ticks = runtime_seconds * ticks_per_second;

    println!("🚀 Starting {} second simulation ({} ticks)...\n", runtime_seconds, total_ticks);
    
    for _ in 0..total_ticks {
        tick += 1;
        
        // Update metrics
        coherence = (coherence + 0.001).min(0.95);
        memories += 1;
        
        // Every 500 ticks: potential dream
        if tick % 500 == 0 && coherence < 0.85 {
            dreams += 1;
            coherence = (coherence + 0.03).min(0.95);
        }
        
        // Update status
        status = if coherence > 0.90 {
            "STABLE"
        } else if coherence > 0.75 {
            "ACTIVE"
        } else if coherence > 0.60 {
            "LEARNING"
        } else {
            "INITIALIZING"
        };
        
        // Update dashboard every 50 ticks
        if tick % 50 == 0 {
            print_dashboard(tick, total_ticks, coherence, memories, dreams, status, start.elapsed().as_secs());
        }
    }

    println!("\n✅ Simulation complete!\n");
    print_final_stats(coherence, memories, dreams, start.elapsed().as_secs());
}

fn print_dashboard(tick: u64, total: u64, coherence: f32, memories: usize, dreams: u64, status: &str, elapsed: u64) {
    // Clear line and print dashboard
    print!("\r\x1B[2K");
    
    let progress = (tick as f32 / total as f32 * 100.0) as usize;
    let bar_width = 20;
    let filled = (progress as f32 / 100.0 * bar_width as f32) as usize;
    let bar: String = "█".repeat(filled) + &"░".repeat(bar_width - filled);
    
    let status_emoji = match status {
        "STABLE" => "🟢",
        "ACTIVE" => "🟡",
        "LEARNING" => "🟠",
        _ => "🔵",
    };

    print!(
        "⏱️  {}s | {} {} | 🧠 {:.1}% | 💾 {} | 🌙 {} | [{}]",
        elapsed, status_emoji, status, coherence * 100.0, memories, dreams, bar
    );
    
    stdout().flush().ok();
}

fn print_final_stats(coherence: f32, memories: usize, dreams: u64, elapsed: u64) {
    println!("╔════════════════════════════════════════════════════════════════╗");
    println!("║                    FINAL STATISTICS                            ║");
    println!("╚════════════════════════════════════════════════════════════════╝");
    println!();
    println!("   ⏱️  Runtime: {} seconds", elapsed);
    println!("   🧠 Final Coherence: {:.1}%", coherence * 100.0);
    println!("   💾 Memories Stored: {}", memories);
    println!("   🌙 Dreams Completed: {}", dreams);
    println!("   📦 Storage Used: {:.1} KB", memories as f32 * 0.576);
    println!();
    
    // ASCII art brain
    println!("           ╭──────────────╮");
    println!("          ╱   🧠 GEOMETRY  ╱");
    println!("         ╱      OS        ╱");
    println!("        ╱   SELF-AWARE   ╱");
    println!("       ╰───────────────╯");
    println!();
    
    if coherence > 0.90 {
        println!("   ✅ STATUS: COGNITIVELY STABLE");
    } else if coherence > 0.75 {
        println!("   ✅ STATUS: ACTIVELY LEARNING");
    } else {
        println!("   🔄 STATUS: STILL EVOLVING");
    }
    println!();
    println!("   🌈 Geometry OS Dashboard v2.1");
}
