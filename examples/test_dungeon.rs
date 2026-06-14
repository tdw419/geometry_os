use std::fs;

fn main() {
    let source = fs::read_to_string("programs/dungeon.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until 3 frames
    let mut frames_seen = 0;
    for i in 0..50_000_000u64 {
        if !vm.step() {
            println!("HALTED at step {}", i);
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 3 {
                println!("Frame {} at step {}", frames_seen, i);
                break;
            }
        }
    }

    // Check player position
    let px = vm.ram[0x4000];
    let py = vm.ram[0x4001];
    println!("Player: ({}, {})", px, py);

    // Check a few specific tiles around player
    println!("\nTiles around player:");
    for dy in -3..=3i32 {
        let row: Vec<String> = (-3i32..=3i32)
            .map(|dx| {
                let tx = (px as i32 + dx) as u32;
                let ty = (py as i32 + dy) as u32;
                if tx < 32 && ty < 32 {
                    let tile = vm.ram[0x2000 + (ty * 32 + tx) as usize];
                    let vis = vm.ram[0x3000 + (ty * 32 + tx) as usize];
                    format!(
                        "{}{}",
                        if tile == 1 { "." } else { "#" },
                        if vis == 2 {
                            "V"
                        } else if vis == 1 {
                            "E"
                        } else {
                            "H"
                        }
                    )
                } else {
                    "??".to_string()
                }
            })
            .collect();
        println!("  {}", row.join(" "));
    }

    // Visibility stats
    let mut vis = [0u32; 3];
    for i in 0..1024 {
        let v = vm.ram[0x3000 + i];
        if v < 3 {
            vis[v as usize] += 1;
        }
    }
    println!(
        "\nVisibility: hidden={} explored={} visible={}",
        vis[0], vis[1], vis[2]
    );

    // Check: is the player tile itself floor and visible?
    let pidx = (py * 32 + px) as usize;
    println!(
        "Player tile: type={} vis={}",
        vm.ram[0x2000 + pidx],
        vm.ram[0x3000 + pidx]
    );

    // Check all 8 adjacent tiles
    println!("\nAdjacent tiles:");
    for (dx, dy) in [
        (-1, 0),
        (1, 0),
        (0, -1),
        (0, 1),
        (-1, -1),
        (1, -1),
        (-1, 1),
        (1, 1),
    ] {
        let tx = (px as i32 + dx) as u32;
        let ty = (py as i32 + dy) as u32;
        if tx < 32 && ty < 32 {
            let idx = (ty * 32 + tx) as usize;
            println!(
                "  ({},{}) tile={} vis={}",
                tx,
                ty,
                vm.ram[0x2000 + idx],
                vm.ram[0x3000 + idx]
            );
        }
    }

    // Now run just a few more steps to see if LOS is computing
    // Reset visibility, run compute_los manually by stepping to it
    println!("\nManual LOS trace:");

    // Find compute_los label address
    let compute_los_addr = {
        let lines: Vec<&str> = source.lines().collect();
        let mut addr = 0u32;
        for line in &lines {
            let trimmed = line.trim();
            if trimmed.starts_with("compute_los:") {
                break;
            }
            // Count instructions (skip comments and labels)
            if trimmed.is_empty() || trimmed.starts_with(';') || trimmed.ends_with(':') {
                continue;
            }
            // Rough instruction count
            if let Some(words) = trimmed.split_whitespace().next() {
                if words
                    .chars()
                    .all(|c| c.is_ascii_alphabetic() || c == '_' || c == '.')
                {
                    addr += 3; // Most instructions are 3 words
                }
            }
        }
        addr
    };
    println!("Estimated compute_los address: {:#06X}", compute_los_addr);
}
