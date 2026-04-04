// pmp-trace -- CLI tracer for Geometry OS filmstrip VM transitions
//
// Polls the daemon's /api/v1/status endpoint and renders a live
// text-based flow trace of frame transitions (jump log).
//
// Usage:
//   cargo run --bin pmp-trace [--url URL] [--watch] [--vm N]
//
// Modes:
//   One-shot (default):  Print current jump log and exit.
//   --watch:             Continuously poll and print new transitions.
//
// Output format:
//   [Tick 5] VM0  Frame 0 ──(auto)──▶ Frame 1   PC=0x00020000
//   [Tick 8] VM0  Frame 1 ──(FRAME)──▶ Frame 3  PC=0x00040006
//   [Tick 12] VM0 Frame 3 ──(auto)──▶ Frame 4   PC=0x00080000
//
// Dead frame detection:
//   After printing all transitions, shows which frames (if any)
//   were never visited -- useful for spotting unreachable code.

use std::io::{Read, Write};
use std::net::TcpStream;
use std::time::Duration;

// ── JSON types (hand-parsed to avoid extra deps) ──

#[derive(Debug)]
struct FrameTransition {
    vm_id: u32,
    from_frame: u32,
    to_frame: u32,
    pc_at_transition: u32,
    cause: String,
    dispatch_frame: u32,
}

#[derive(Debug)]
struct VmStatus {
    vm_id: u32,
    state: String,
    pc: u32,
    frame_ptr: u32,
    frame_count: u32,
    jump_log: Vec<FrameTransition>,
}

// ── Minimal HTTP GET ──

fn http_get(host: &str, port: u16, path: &str) -> Result<String, String> {
    let mut stream = TcpStream::connect_timeout(
        &format!("{}:{}", host, port).parse().map_err(|e| format!("{}", e))?,
        Duration::from_secs(5),
    ).map_err(|e| format!("Connect failed: {}", e))?;

    let request = format!(
        "GET {} HTTP/1.1\r\nHost: {}:{}\r\nConnection: close\r\n\r\n",
        path, host, port
    );
    stream.write_all(request.as_bytes()).map_err(|e| format!("Write failed: {}", e))?;

    let mut response = Vec::new();
    stream.read_to_end(&mut response).map_err(|e| format!("Read failed: {}", e))?;

    // Split headers from body
    let body = if let Some(pos) = response.windows(4).position(|w| w == b"\r\n\r\n") {
        &response[pos + 4..]
    } else {
        &response[..]
    };

    Ok(String::from_utf8_lossy(body).to_string())
}

// ── Simple JSON extraction ──

/// Extract a string value for a key from JSON.
fn json_str<'a>(json: &'a str, key: &str) -> Option<&'a str> {
    let pattern = format!("\"{}\"", key);
    let start = json.find(&pattern)?;
    let after = &json[start + pattern.len()..];
    let colon = after.find(':')?;
    let rest = &after[colon + 1..];
    let trimmed = rest.trim_start();
    if trimmed.starts_with('"') {
        let val_start = 1;
        let val_end = trimmed[1..].find('"')?;
        Some(&trimmed[val_start..val_start + val_end])
    } else {
        None
    }
}

/// Extract a numeric value for a key from JSON.
fn json_num(json: &str, key: &str) -> Option<u64> {
    let pattern = format!("\"{}\"", key);
    let start = json.find(&pattern)?;
    let after = &json[start + pattern.len()..];
    let colon = after.find(':')?;
    let rest = &after[colon + 1..];
    let trimmed = rest.trim_start();
    let end = trimmed.find(|c: char| !c.is_ascii_digit()).unwrap_or(trimmed.len());
    trimmed[..end].parse().ok()
}

/// Parse a JSON array of frame transition objects from a vm_states entry.
fn parse_jump_log(vm_json: &str) -> Vec<FrameTransition> {
    // Find the "jump_log" array
    let pattern = "\"jump_log\":[";
    let start = match vm_json.find(pattern) {
        Some(s) => s + pattern.len() - 1, // point at '['
        None => return Vec::new(),
    };

    // Find the matching ']'
    let mut depth = 0;
    let mut end = start;
    for (i, c) in vm_json[start..].char_indices() {
        match c {
            '[' => depth += 1,
            ']' => {
                depth -= 1;
                if depth == 0 {
                    end = start + i;
                    break;
                }
            }
            _ => {}
        }
    }
    let arr_content = &vm_json[start + 1..end];

    if arr_content.trim().is_empty() {
        return Vec::new();
    }

    // Split on '},' to get individual transition objects
    let mut transitions = Vec::new();
    let mut obj_start = 0;
    let mut brace_depth = 0;

    for (i, c) in arr_content.char_indices() {
        match c {
            '{' => {
                if brace_depth == 0 {
                    obj_start = i;
                }
                brace_depth += 1;
            }
            '}' => {
                brace_depth -= 1;
                if brace_depth == 0 {
                    let obj = &arr_content[obj_start..=i];
                    transitions.push(FrameTransition {
                        vm_id: json_num(obj, "vm_id").unwrap_or(0) as u32,
                        from_frame: json_num(obj, "from_frame").unwrap_or(0) as u32,
                        to_frame: json_num(obj, "to_frame").unwrap_or(0) as u32,
                        pc_at_transition: json_num(obj, "pc_at_transition").unwrap_or(0) as u32,
                        cause: json_str(obj, "cause").unwrap_or("unknown").to_string(),
                        dispatch_frame: json_num(obj, "dispatch_frame").unwrap_or(0) as u32,
                    });
                }
            }
            _ => {}
        }
    }

    transitions
}

/// Parse all VM statuses from the status response JSON.
fn parse_status(json: &str) -> Vec<VmStatus> {
    // Find the "vm_states" array
    let pattern = "\"vm_states\":[";
    let start = match json.find(pattern) {
        Some(s) => s + pattern.len() - 1,
        None => return Vec::new(),
    };

    // Find matching ']'
    let mut depth = 0;
    let mut end = start;
    for (i, c) in json[start..].char_indices() {
        match c {
            '[' => depth += 1,
            ']' => {
                depth -= 1;
                if depth == 0 {
                    end = start + i;
                    break;
                }
            }
            _ => {}
        }
    }

    let arr = &json[start + 1..end];
    let mut vms = Vec::new();

    // Split into individual VM objects
    let mut obj_start = 0;
    let mut brace_depth = 0;
    for (i, c) in arr.char_indices() {
        match c {
            '{' => {
                if brace_depth == 0 {
                    obj_start = i;
                }
                brace_depth += 1;
            }
            '}' => {
                brace_depth -= 1;
                if brace_depth == 0 {
                    let obj = &arr[obj_start..=i];
                    let jump_log = parse_jump_log(obj);
                    vms.push(VmStatus {
                        vm_id: json_num(obj, "vm_id").unwrap_or(0) as u32,
                        state: json_str(obj, "state").unwrap_or("unknown").to_string(),
                        pc: json_num(obj, "pc").unwrap_or(0) as u32,
                        frame_ptr: json_num(obj, "frame_ptr").unwrap_or(0) as u32,
                        frame_count: json_num(obj, "frame_count").unwrap_or(0) as u32,
                        jump_log,
                    });
                }
            }
            _ => {}
        }
    }

    vms
}

// ── Rendering ──

fn render_transition(t: &FrameTransition) -> String {
    let cause_label = match t.cause.as_str() {
        "auto_advance" => "auto",
        "frame_opcode" => "FRAME",
        _ => &t.cause,
    };

    // Arrow style: ──▶ for forward, ══▶ for frame_opcode (explicit jump)
    let arrow = if t.cause == "frame_opcode" {
        "══▶"
    } else {
        "──▶"
    };

    // Direction indicator
    let direction = if t.to_frame > t.from_frame {
        "↓" // forward
    } else if t.to_frame < t.from_frame {
        "↑" // loop-back
    } else {
        "→" // same (shouldn't happen, but defensive)
    };

    format!(
        "[Tick {:>4}] VM{}  Frame {:>2} {} ({:^5}) {} Frame {:>2}   PC=0x{:08X}  {}",
        t.dispatch_frame,
        t.vm_id,
        t.from_frame,
        arrow,
        cause_label,
        direction,
        t.to_frame,
        t.pc_at_transition,
        if t.cause == "frame_opcode" { "◆" } else { "" },
    )
}

fn render_strip(vm: &VmStatus) -> String {
    if vm.frame_count == 0 {
        return format!("VM{}: not a filmstrip", vm.vm_id);
    }

    // Collect visited frames from jump log
    let mut visited = std::collections::HashSet::new();
    visited.insert(0); // frame 0 is always visited (spawn point)
    for t in &vm.jump_log {
        visited.insert(t.to_frame);
    }

    // Build strip: [0][1][2][3][4]
    let mut strip = String::new();
    strip.push_str(&format!("VM{} Filmstrip ({} frames): ", vm.vm_id, vm.frame_count));

    for i in 0..vm.frame_count {
        let is_current = i == vm.frame_ptr;
        let is_visited = visited.contains(&(i as u32));

        let block = if is_current {
            format!("[▸{}]", i)
        } else if is_visited {
            format!("[{}]", i)
        } else {
            format!("[·{}]", i) // dead/unvisited frame
        };

        strip.push_str(&block);

        if i < vm.frame_count - 1 {
            // Show transition arrow between adjacent frames if it exists in jump log
            let has_auto = vm.jump_log.iter().any(|t| {
                t.from_frame == i && t.to_frame == i as u32 + 1 && t.cause == "auto_advance"
            });
            strip.push_str(if has_auto { "─" } else { " " });
        }
    }

    strip
}

fn render_jump_summary(vm: &VmStatus) -> String {
    if vm.jump_log.is_empty() {
        return "  No transitions recorded.".to_string();
    }

    // Count transitions per (from, to) pair
    let mut counts: std::collections::HashMap<(u32, u32), u32> = std::collections::HashMap::new();
    for t in &vm.jump_log {
        *counts.entry((t.from_frame, t.to_frame)).or_insert(0) += 1;
    }

    let mut lines: Vec<String> = vec!["  Jump frequency:".to_string()];
    let mut pairs: Vec<_> = counts.iter().collect();
    pairs.sort_by_key(|((from, to), _)| (*from, *to));

    for ((from, to), count) in pairs {
        let bar: String = "█".repeat((*count).min(20) as usize);
        let label = if *to == *from + 1 {
            "sequential"
        } else if *to < *from {
            "loop-back"
        } else {
            "skip"
        };
        lines.push(format!(
            "    {}→{} ({}): {} {}x",
            from, to, label, bar, count
        ));
    }

    lines.join("\n")
}

fn print_vm_trace(vm: &VmStatus, verbose: bool) {
    if vm.state == "inactive" {
        if verbose {
            println!("VM{}: inactive", vm.vm_id);
        }
        return;
    }

    println!();
    println!("╔══ VM{} ═════════════════════════════════════════════════╗", vm.vm_id);
    println!("║  State: {:<10}  PC: 0x{:08X}  Frame: {}/{}",
        vm.state, vm.pc, vm.frame_ptr, vm.frame_count);

    if vm.frame_count > 0 {
        println!("║");
        println!("║  {}", render_strip(vm));
    }

    if !vm.jump_log.is_empty() {
        println!("║");
        println!("║  Transitions ({} events):", vm.jump_log.len());
        println!("╟──────────────────────────────────────────────────────────╢");
        for t in &vm.jump_log {
            println!("║  {}", render_transition(t));
        }
        println!("║");
        println!("{}", render_jump_summary(vm));
    }

    println!("╚════════════════════════════════════════════════════════════╝");
}

// ── Main ──

fn main() {
    let args: Vec<String> = std::env::args().collect();

    let host = {
        let idx = args.iter().position(|a| a == "--host");
        idx.and_then(|i| args.get(i + 1).cloned()).unwrap_or_else(|| "127.0.0.1".into())
    };

    let port: u16 = {
        let idx = args.iter().position(|a| a == "--port");
        idx.and_then(|i| args.get(i + 1).cloned())
            .map(|s| s.parse().unwrap_or(3101))
            .unwrap_or(3101)
    };

    let watch = args.contains(&"--watch".to_string());

    let filter_vm: Option<u32> = {
        let idx = args.iter().position(|a| a == "--vm");
        idx.and_then(|i| args.get(i + 1).cloned())
            .map(|s| s.parse().unwrap_or(0))
    };

    let interval: u64 = {
        let idx = args.iter().position(|a| a == "--interval");
        idx.and_then(|i| args.get(i + 1).cloned())
            .map(|s| s.parse().unwrap_or(500))
            .unwrap_or(500)
    };

    println!("pmp-trace -- Geometry OS Filmstrip Tracer");
    println!("Connecting to http://{}:{}...", host, port);

    if watch {
        // Watch mode: track which transitions we've already printed
        let mut seen_count: std::collections::HashMap<u32, usize> = std::collections::HashMap::new();

        loop {
            match http_get(&host, port, "/api/v1/status") {
                Ok(body) => {
                    let vms = parse_status(&body);
                    let mut any_new = false;

                    for vm in &vms {
                        if let Some(f) = filter_vm {
                            if vm.vm_id != f {
                                continue;
                            }
                        }

                        let prev = *seen_count.get(&vm.vm_id).unwrap_or(&0);
                        if vm.jump_log.len() > prev {
                            let new_transitions = &vm.jump_log[prev..];
                            if !new_transitions.is_empty() && !any_new {
                                any_new = true;
                            }
                            for t in new_transitions {
                                println!("{}", render_transition(t));
                            }
                            seen_count.insert(vm.vm_id, vm.jump_log.len());
                        }
                    }

                    if !any_new {
                        // Quiet -- no new transitions. Print a heartbeat every 5 seconds.
                        std::thread::sleep(Duration::from_millis(interval));
                    }
                }
                Err(e) => {
                    eprintln!("Error: {} (retrying in {}ms)", e, interval);
                    std::thread::sleep(Duration::from_millis(interval));
                }
            }
        }
    } else {
        // One-shot mode: print full trace
        match http_get(&host, port, "/api/v1/status") {
            Ok(body) => {
                let vms = parse_status(&body);
                for vm in &vms {
                    if let Some(f) = filter_vm {
                        if vm.vm_id != f {
                            continue;
                        }
                    }
                    print_vm_trace(vm, filter_vm.is_none());
                }
            }
            Err(e) => {
                eprintln!("Error: {}", e);
                std::process::exit(1);
            }
        }
    }
}
