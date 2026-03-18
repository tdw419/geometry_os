//! Test loading ASCII cartridge into Synthetic VRAM
use std::path::Path;

fn main() {
    let path = Path::new("test_dashboard.rts.png");

    if !path.exists() {
        eprintln!("File not found: test_dashboard.rts.png");
        std::process::exit(1);
    }

    println!("Loading ASCII cartridge: test_dashboard.rts.png");

    // Load cartridge using AsciiCartridge loader
    match geometry_os::ascii_cartridge::AsciiCartridge::load(path) {
        Ok(cartridge) => {
            println!("✓ Cartridge loaded successfully");
            println!("  Name: {}", cartridge.bootstrap.name);
            println!("  Version: {}", cartridge.bootstrap.version);
            println!("  Pattern count: {}", cartridge.bootstrap.pattern_count);
            println!(
                "  Glyph grid size: {}x{}",
                geometry_os::ascii_cartridge::GLYPH_WIDTH,
                geometry_os::ascii_cartridge::GLYPH_HEIGHT
            );
            println!("  SIT entries: {}", cartridge.sit_entries.len());
            println!(
                "  State buffer size: {} bytes",
                cartridge.state_buffer.len()
            );
        },
        Err(e) => {
            eprintln!("✗ Failed to load cartridge: {}", e);
            std::process::exit(1);
        },
    }
}
