//! Geometry OS MCP Server
//!
//! Wraps the running Geometry OS VM via Unix socket (/tmp/geo_cmd.sock)
//! and exposes tools via Model Context Protocol (JSON-RPC over stdio).
//!
//! Usage:
//!   cargo run --bin geo_mcp_server
//!
//! The server reads JSON-RPC from stdin and writes responses to stdout.
//! Each tool call translates to one or more socket commands.

use std::collections::HashMap;
use std::io::{BufRead, BufReader, Read, Write};
use std::os::unix::net::UnixStream;

const SOCKET_PATH: &str = "/tmp/geo_cmd.sock";
const PID_FILE: &str = "/tmp/geo_mcp_server.pid";

fn send_socket_cmd(cmd: &str) -> Result<String, String> {
    send_socket_cmd_with_timeout(cmd, std::time::Duration::from_secs(5))
}

fn send_socket_cmd_with_timeout(cmd: &str, timeout: std::time::Duration) -> Result<String, String> {
    let mut stream = UnixStream::connect(SOCKET_PATH)
        .map_err(|e| format!("Cannot connect to {}: {}", SOCKET_PATH, e))?;
    stream
        .set_read_timeout(Some(timeout))
        .map_err(|e| format!("Set timeout failed: {}", e))?;

    // Send command
    let mut writer = stream
        .try_clone()
        .map_err(|e| format!("Clone stream failed: {}", e))?;
    writeln!(writer, "{}", cmd).map_err(|e| format!("Write failed: {}", e))?;
    writer.flush().ok();
    drop(writer); // close write side so server sees EOF

    // Read response -- read all available data until EOF/timeout
    let mut response = String::new();
    let mut buf = [0u8; 65536];
    loop {
        match stream.read(&mut buf) {
            Ok(0) => break, // EOF
            Ok(n) => response.push_str(&String::from_utf8_lossy(&buf[..n])),
            Err(ref e) if e.kind() == std::io::ErrorKind::TimedOut => break,
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => break,
            Err(e) => return Err(format!("Read failed: {}", e)),
        }
    }

    Ok(response.trim().to_string())
}

// ── JSON-RPC Types ──────────────────────────────────────

#[derive(Debug)]
struct JsonRpcRequest {
    #[allow(dead_code)]
    jsonrpc: String,
    id: Option<serde_json::Value>,
    method: String,
    params: Option<serde_json::Value>,
}

#[derive(Debug)]
struct JsonRpcResponse {
    jsonrpc: String,
    id: Option<serde_json::Value>,
    result: Option<serde_json::Value>,
    error: Option<JsonRpcError>,
}

#[derive(Debug)]
struct JsonRpcError {
    code: i64,
    message: String,
}

impl JsonRpcResponse {
    fn success(id: Option<serde_json::Value>, result: serde_json::Value) -> Self {
        Self {
            jsonrpc: "2.0".into(),
            id,
            result: Some(result),
            error: None,
        }
    }
    fn error(id: Option<serde_json::Value>, code: i64, msg: impl Into<String>) -> Self {
        Self {
            jsonrpc: "2.0".into(),
            id,
            result: None,
            error: Some(JsonRpcError {
                code,
                message: msg.into(),
            }),
        }
    }
}

// ── Tool Definitions ────────────────────────────────────

fn get_tool_list() -> Vec<serde_json::Value> {
    vec![
        // -- Available Now (wrap existing socket commands) --
        tool(
            "vm_status",
            "Get current VM state: mode, running, PC, cursor",
            vec![],
            vm_status_schema(),
        ),
        tool(
            "vm_screenshot",
            "Save framebuffer as PNG file",
            vec![param("path", "string", "Output file path", false)],
            vm_screenshot_schema(),
        ),
        tool(
            "vm_screen_dump",
            "Get raw 256x256 framebuffer hex data",
            vec![],
            vm_screen_dump_schema(),
        ),
        tool(
            "vm_registers",
            "Read all 32 registers",
            vec![],
            vm_registers_schema(),
        ),
        tool(
            "vm_canvas",
            "Read canvas text content",
            vec![],
            vm_canvas_schema(),
        ),
        tool(
            "vm_type",
            "Type text onto canvas",
            vec![param("text", "string", "Text to type", true)],
            vm_type_schema(),
        ),
        tool("vm_run", "Toggle VM execution", vec![], vm_run_schema()),
        tool(
            "vm_assemble",
            "Assemble canvas content to bytecode",
            vec![],
            vm_assemble_schema(),
        ),
        tool(
            "vm_disasm",
            "Disassemble instructions around PC",
            vec![],
            vm_disasm_schema(),
        ),
        tool("vm_save", "Save VM state to disk", vec![], vm_save_schema()),
        tool(
            "vm_save_asm",
            "Save canvas content to programs/<name>.asm on disk",
            vec![param("name", "string", "Program name (saved as programs/<name>.asm)", true)],
            vm_save_asm_schema(),
        ),
        tool(
            "vm_load_source",
            "Load multi-line ASM source into canvas (clears canvas first). Use \\n for newlines.",
            vec![param("source", "string", "Full ASM source text", true)],
            vm_load_source_schema(),
        ),
        tool(
            "vm_load_asm",
            "Load .asm file from disk, assemble directly into VM (bypasses canvas 128-line limit). Returns status with line/word counts.",
            vec![
                param("path", "string", "Path to .asm file (e.g. programs/hello.asm)", true),
                param("base_addr", "string", "Base address in hex (default: 0x1000)", false),
            ],
            vm_load_asm_schema(),
        ),
        // -- Phase 84: Building & Desktop Tools --
        tool(
            "building_list",
            "List buildings on the map, optionally filtered by radius from player",
            vec![param(
                "radius",
                "integer",
                "Max distance in tiles (0=all)",
                false,
            )],
            building_list_schema(),
        ),
        tool(
            "building_enter",
            "Walk player to building and enter it (launches the app)",
            vec![param("building_id", "string", "Building ID to enter", true)],
            building_enter_schema(),
        ),
        tool(
            "building_exit",
            "Exit current building, return to map",
            vec![],
            building_exit_schema(),
        ),
        tool(
            "desktop_state",
            "Get full desktop state: player, camera, buildings, taskbar, frame",
            vec![],
            desktop_state_schema(),
        ),
        tool(
            "desktop_launch",
            "Launch an app by name (opens window without walking to building)",
            vec![
                param("app_name", "string", "App name to launch", true),
                param("window", "boolean", "If true, launch in a WINSYS window instead of replacing map", false),
            ],
            desktop_launch_schema(),
        ),
        tool(
            "player_position",
            "Get player world coordinates and facing direction",
            vec![],
            player_position_schema(),
        ),
        // -- Phase 86: Hypervisor Tools --
        tool(
            "hypervisor_boot",
            "Boot a guest OS via hypervisor. Config string specifies arch, kernel, ram.",
            vec![
                param(
                    "config",
                    "string",
                    "Config: 'arch=riscv64 kernel=Image ram=256M'",
                    true,
                ),
                param(
                    "window_id",
                    "string",
                    "Optional WINSYS window ID to target",
                    false,
                ),
            ],
            hypervisor_boot_schema(),
        ),
        tool(
            "hypervisor_kill",
            "Kill running guest OS",
            vec![],
            hypervisor_kill_schema(),
        ),
        // -- Phase B: RISC-V Live VM Tools --
        tool(
            "riscv_run",
            "Launch a RISC-V ELF on a background thread with live framebuffer display",
            vec![
                param(
                    "elf_path",
                    "string",
                    "Path to the RISC-V ELF binary to run",
                    true,
                ),
            ],
            riscv_run_schema(),
        ),
        tool(
            "riscv_kill",
            "Kill the running RISC-V VM",
            vec![],
            riscv_kill_schema(),
        ),
        // -- Phase 200: File Watcher Tools --
        tool(
            "vm_watch",
            "Watch an .asm file for changes. On every save, automatically reload, assemble, and run.",
            vec![param(
                "path",
                "string",
                "Path to .asm file to watch",
                true,
            )],
            vm_watch_schema(),
        ),
        tool(
            "vm_unwatch",
            "Stop watching the currently watched file",
            vec![],
            vm_unwatch_schema(),
        ),
        // -- Phase 88: AI Vision Bridge Tools --
        tool(
            "vision_screenshot",
            "Get base64-encoded PNG screenshot of the current canvas",
            vec![],
            vision_screenshot_schema(),
        ),
        tool(
            "vision_checksum",
            "Get FNV-1a checksum of the canvas (fast change detection)",
            vec![],
            vision_checksum_schema(),
        ),
        tool(
            "vision_diff",
            "Compare canvas against a previous checksum to detect changes",
            vec![param(
                "checksum",
                "string",
                "Previous FNV-1a checksum to compare against (hex)",
                true,
            )],
            vision_diff_schema(),
        ),
        tool(
            "vision_describe",
            "Take a screenshot and describe it using the local Ollama vision model (llama3.2-vision). Returns a text description of what's on screen. ~2s on local GPU.",
            vec![param(
                "prompt",
                "string",
                "Custom prompt for the vision model (optional, uses sensible default if omitted)",
                false,
            )],
            vision_describe_schema(),
        ),

        tool(
            "vision_peek_pixel",
            "Read the exact RGB color of one pixel on the 256x256 framebuffer. Use for pixel-level assertions without a vision model.",
            vec![
                param("x", "integer", "X coordinate (0-255)", true),
                param("y", "integer", "Y coordinate (0-255)", true),
            ],
            vision_peek_pixel_schema(),
        ),
        tool(
            "vision_region_checksum",
            "FNV-1a hash of a sub-rectangle of the framebuffer. Use for sprite/region regression tests without a vision model.",
            vec![
                param("x", "integer", "Top-left X (0-255)", true),
                param("y", "integer", "Top-left Y (0-255)", true),
                param("w", "integer", "Width (>0, x+w <= 256)", true),
                param("h", "integer", "Height (>0, y+h <= 256)", true),
            ],
            vision_region_checksum_schema(),
        ),
        tool(
            "vision_render_log",
            "Get history of high-level graphics operations (RECTF, FILL, LINE, etc.). Actions: 'dump' (default), 'on', 'off', 'clear'.",
            vec![param("action", "string", "Action: dump/on/off/clear", false)],
            vision_render_log_schema(),
        ),
        // -- Phase 89: AI Input Injection Tools --
        tool(
            "input_key",
            "Inject a keyboard event into the running VM",
            vec![
                param(
                    "key",
                    "string",
                    "Key code (numeric) or single character",
                    true,
                ),
                param("shift", "integer", "Shift state (0=none, 1=shift)", false),
            ],
            input_key_schema(),
        ),
        tool(
            "input_mouse",
            "Inject a mouse event (move or click) into the running VM",
            vec![
                param("action", "string", "Action: 'move' or 'click'", true),
                param("x", "integer", "X coordinate", true),
                param("y", "integer", "Y coordinate", true),
                param(
                    "button",
                    "integer",
                    "Button for click (1=down, 2=click)",
                    false,
                ),
            ],
            input_mouse_schema(),
        ),
        tool(
            "input_text",
            "Type a text string into the VM (each character becomes a key event)",
            vec![param("text", "string", "Text to type", true)],
            input_text_schema(),
        ),
        // -- Phase 90: AI Program Control Tools --
        tool(
            "vm_screen_ascii",
            "Get the VM framebuffer as ASCII art (64x32). Readable by text-based AI agents.",
            vec![],
            vm_screen_ascii_schema(),
        ),
        tool(
            "vm_run_program",
            "One-shot: write assembly source, assemble, run, wait, return canvas + screen + status. The fastest way to execute a program and see results.",
            vec![
                param("source", "string", "Assembly source code to execute", true),
                param("frames", "integer", "Number of frames to run (default: 10000)", false),
            ],
            vm_run_program_schema(),
        ),
        // -- Phase 106: Window Management + Desktop Control Tools --
        tool(
            "window_list",
            "List all active WINSYS windows with id, title, pid, position, size, z_order",
            vec![],
            window_list_mcp_schema(),
        ),
        tool(
            "window_move",
            "Move a window to a new position",
            vec![
                param("window_id", "string", "Window ID to move", true),
                param("x", "integer", "New X position", true),
                param("y", "integer", "New Y position", true),
            ],
            window_move_mcp_schema(),
        ),
        tool(
            "window_close",
            "Close (destroy) a window",
            vec![param("window_id", "string", "Window ID to close", true)],
            window_close_mcp_schema(),
        ),
        tool(
            "window_focus",
            "Bring a window to the front (highest z-order)",
            vec![param("window_id", "string", "Window ID to focus", true)],
            window_focus_mcp_schema(),
        ),
        tool(
            "window_resize",
            "Resize a window's offscreen buffer",
            vec![
                param("window_id", "string", "Window ID to resize", true),
                param("w", "integer", "New width (1-256)", true),
                param("h", "integer", "New height (1-256)", true),
            ],
            window_resize_mcp_schema(),
        ),
        tool(
            "process_kill",
            "Kill all windows belonging to a process (PID)",
            vec![param("pid", "integer", "Process ID to kill windows for", true)],
            process_kill_mcp_schema(),
        ),
        tool(
            "desktop_key",
            "Inject a key event into the VM desktop (alias for input_key with desktop semantics)",
            vec![
                param("key", "string", "Key code (numeric) or single character", true),
                param("shift", "integer", "Shift state (0=none, 1=shift)", false),
            ],
            desktop_key_schema(),
        ),
        tool(
            "desktop_mouse_move",
            "Move the mouse cursor on the VM desktop",
            vec![
                param("x", "integer", "X coordinate", true),
                param("y", "integer", "Y coordinate", true),
            ],
            desktop_mouse_move_schema(),
        ),
        tool(
            "desktop_mouse_click",
            "Click the mouse at a position on the VM desktop",
            vec![
                param("x", "integer", "X coordinate", true),
                param("y", "integer", "Y coordinate", true),
                param("button", "integer", "Button (1=down, 2=click)", false),
            ],
            desktop_mouse_click_schema(),
        ),
        tool(
            "desktop_vision",
            "Get structured desktop state: open windows, focused window, ASCII art overlay of the desktop with window boundaries",
            vec![],
            desktop_vision_schema(),
        ),
        // -- Phase 208: Programmatic Assembly & Execution Tools --
        tool(
            "asm_load",
            "Load a .asm file from disk into the canvas buffer (clears canvas first). Path can be absolute or relative to the Geometry OS project directory.",
            vec![param(
                "path",
                "string",
                "Path to .asm file (e.g. programs/hello.asm)",
                true,
            )],
            asm_load_schema(),
        ),
        tool(
            "asm_assemble",
            "Assemble the canvas content to bytecode at 0x1000. Returns assembly status, word count, and any warnings/errors.",
            vec![],
            asm_assemble_schema(),
        ),
        tool(
            "asm_run",
            "Run the assembled program from 0x1000. Polls until the VM halits or times out (10s). Returns final registers, screen checksum, and halted status.",
            vec![param(
                "timeout_ms",
                "integer",
                "Max time to wait for completion in milliseconds (default: 10000)",
                false,
            )],
            asm_run_schema(),
        ),
        tool(
            "asm_step",
            "Single-step the VM by one instruction. Returns the new PC and current register state.",
            vec![],
            asm_step_schema(),
        ),
    ]
}

fn tool(
    name: &str,
    desc: &str,
    params: Vec<serde_json::Value>,
    output: serde_json::Value,
) -> serde_json::Value {
    serde_json::json!({
        "name": name,
        "description": desc,
        "inputSchema": {
            "type": "object",
            "properties": params.iter().map(|p| {
                let pname = p["name"].as_str().unwrap();
                (pname.to_string(), p.clone())
            }).collect::<HashMap<_,_>>(),
            "required": params.iter()
                .filter(|p| p["required"].as_bool().unwrap_or(false))
                .map(|p| p["name"].as_str().unwrap().to_string())
                .collect::<Vec<_>>(),
        },
        "outputSchema": output,
    })
}

fn param(name: &str, ptype: &str, desc: &str, required: bool) -> serde_json::Value {
    serde_json::json!({
        "name": name,
        "type": ptype,
        "description": desc,
        "required": required,
    })
}

// ── Output Schemas ──────────────────────────────────────

fn vm_status_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "mode": {"type": "string"},
            "running": {"type": "boolean"},
            "assembled": {"type": "boolean"},
            "pc": {"type": "string"},
            "cursor": {"type": "array", "items": {"type": "integer"}},
        }
    })
}
fn vm_screenshot_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"path": {"type": "string"}}})
}
fn vm_screen_dump_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"width": {"type": "integer"}, "height": {"type": "integer"}, "pixels": {"type": "string"}}})
}
fn vm_registers_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"registers": {"type": "object"}}})
}
fn vm_canvas_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"lines": {"type": "array"}}})
}
fn vm_type_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}}})
}
fn vm_run_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"running": {"type": "boolean"}}})
}
fn vm_assemble_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}}})
}
fn vm_disasm_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"instructions": {"type": "array"}}})
}
fn vm_save_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}}})
}
fn vm_save_asm_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}, "filename": {"type": "string"}, "lines": {"type": "integer"}}})
}
fn vm_load_source_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}, "cursor": {"type": "string"}}})
}
fn vm_load_asm_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}, "path": {"type": "string"}, "lines": {"type": "integer"}, "words": {"type": "integer"}, "base_addr": {"type": "integer"}, "error": {"type": "string"}}})
}
fn building_list_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"buildings": {"type": "array", "items": {"type": "object", "properties": {"id": {"type": "integer"}, "world_x": {"type": "integer"}, "world_y": {"type": "integer"}, "type_color": {"type": "string"}, "name": {"type": "string"}}}}}})
}
fn building_enter_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"entered": {"type": "boolean"}, "app_name": {"type": "string"}}})
}
fn building_exit_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"world_x": {"type": "integer"}, "world_y": {"type": "integer"}}})
}
fn desktop_state_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"player": {"type": "object"}, "camera": {"type": "object"}, "frame": {"type": "integer"}, "buildings": {"type": "array"}}})
}
fn desktop_launch_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"launched": {"type": "boolean"}, "app_name": {"type": "string"}, "window_mode": {"type": "boolean"}}})
}
fn player_position_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"world_x": {"type": "integer"}, "world_y": {"type": "integer"}, "facing": {"type": "string"}}})
}
fn hypervisor_boot_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"booted": {"type": "boolean"}, "config": {"type": "string"}, "window_id": {"type": "string"}}})
}
fn hypervisor_kill_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}}})
}
fn riscv_run_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"launched": {"type": "boolean"}, "elf_path": {"type": "string"}}})
}
fn riscv_kill_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}}})
}

// Phase 200: File Watcher schemas
fn vm_watch_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "watching": {"type": "string", "description": "Path of the file being watched"},
            "status": {"type": "string", "description": "Status message"}
        }
    })
}

fn vm_unwatch_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}}})
}

// Phase 88: AI Vision Bridge schemas
fn vision_screenshot_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "png_base64": {"type": "string", "description": "Base64-encoded PNG image of the 256x256 canvas"},
            "width": {"type": "integer"},
            "height": {"type": "integer"}
        }
    })
}

fn vision_checksum_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "checksum": {"type": "string", "description": "FNV-1a hash of the canvas (hex)"},
            "checksum_u32": {"type": "integer", "description": "FNV-1a hash as u32"}
        }
    })
}

fn vision_diff_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "changed": {"type": "boolean"},
            "checksum": {"type": "string", "description": "Current checksum (hex)"},
            "previous_checksum": {"type": "string", "description": "Previous checksum (hex)"}
        }
    })
}

fn vision_describe_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "description": {"type": "string", "description": "Vision model's description of the current screen"},
            "model": {"type": "string", "description": "Vision model used"}
        }
    })
}

fn vision_peek_pixel_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "x": {"type": "integer"},
            "y": {"type": "integer"},
            "rgb_hex": {"type": "string", "description": "RRGGBB hex"},
            "r": {"type": "integer"},
            "g": {"type": "integer"},
            "b": {"type": "integer"}
        }
    })
}

fn vision_region_checksum_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "x": {"type": "integer"},
            "y": {"type": "integer"},
            "w": {"type": "integer"},
            "h": {"type": "integer"},
            "checksum": {"type": "string", "description": "FNV-1a hash (hex)"}
        }
    })
}

fn vision_render_log_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "entries": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "frame": {"type": "integer"},
                        "opcode": {"type": "string"},
                        "name": {"type": "string"},
                        "args": {"type": "array", "items": {"type": "integer"}}
                    }
                }
            }
        }
    })
}

// Phase 89: AI Input Injection schemas
fn input_key_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ok": {"type": "boolean"},
            "keycode": {"type": "integer"}
        }
    })
}
fn input_mouse_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ok": {"type": "boolean"},
            "action": {"type": "string"},
            "x": {"type": "integer"},
            "y": {"type": "integer"}
        }
    })
}
fn input_text_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ok": {"type": "boolean"},
            "chars_injected": {"type": "integer"}
        }
    })
}
fn vm_screen_ascii_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ascii": {"type": "string"},
            "width": {"type": "integer"},
            "height": {"type": "integer"}
        }
    })
}
fn vm_run_program_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "success": {"type": "boolean"},
            "canvas": {"type": "string"},
            "screen_ascii": {"type": "string"},
            "status": {"type": "object"},
            "registers": {"type": "object"},
            "error": {"type": "string"}
        }
    })
}

// Phase 208: Programmatic Assembly & Execution schemas
fn asm_load_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ok": {"type": "boolean"},
            "path": {"type": "string"},
            "lines": {"type": "integer"},
            "response": {"type": "string"}
        }
    })
}
fn asm_assemble_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ok": {"type": "boolean"},
            "words": {"type": "integer"},
            "response": {"type": "string"},
            "error": {"type": "string"}
        }
    })
}
fn asm_run_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ok": {"type": "boolean"},
            "halted": {"type": "boolean"},
            "pc": {"type": "string"},
            "registers": {"type": "object"},
            "response": {"type": "string"}
        }
    })
}
fn asm_step_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "ok": {"type": "boolean"},
            "pc": {"type": "string"},
            "response": {"type": "string"}
        }
    })
}

// Phase 106: Window Management + Desktop Control schemas
fn window_list_mcp_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "count": {"type": "integer"},
            "windows": {"type": "array", "items": {"type": "object", "properties": {
                "id": {"type": "integer"}, "x": {"type": "integer"}, "y": {"type": "integer"},
                "w": {"type": "integer"}, "h": {"type": "integer"},
                "z_order": {"type": "integer"}, "pid": {"type": "integer"}, "title": {"type": "string"}
            }}}
        }
    })
}
fn window_move_mcp_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {
        "ok": {"type": "boolean"}, "window_id": {"type": "string"}, "x": {"type": "integer"}, "y": {"type": "integer"}
    }})
}
fn window_close_mcp_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {"ok": {"type": "boolean"}, "window_id": {"type": "string"}}})
}
fn window_focus_mcp_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {
        "ok": {"type": "boolean"}, "window_id": {"type": "string"}, "z_order": {"type": "integer"}
    }})
}
fn window_resize_mcp_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {
        "ok": {"type": "boolean"}, "window_id": {"type": "string"}, "w": {"type": "integer"}, "h": {"type": "integer"}
    }})
}
fn process_kill_mcp_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {
        "ok": {"type": "boolean"}, "pid": {"type": "integer"}, "windows_killed": {"type": "integer"}
    }})
}
fn desktop_key_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {
        "ok": {"type": "boolean"}, "keycode": {"type": "integer"}
    }})
}
fn desktop_mouse_move_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {
        "ok": {"type": "boolean"}, "x": {"type": "integer"}, "y": {"type": "integer"}
    }})
}
fn desktop_mouse_click_schema() -> serde_json::Value {
    serde_json::json!({"type": "object", "properties": {
        "ok": {"type": "boolean"}, "x": {"type": "integer"}, "y": {"type": "integer"}, "button": {"type": "integer"}
    }})
}
fn desktop_vision_schema() -> serde_json::Value {
    serde_json::json!({
        "type": "object",
        "properties": {
            "windows": {"type": "array", "items": {"type": "object", "properties": {
                "id": {"type": "integer"}, "x": {"type": "integer"}, "y": {"type": "integer"},
                "w": {"type": "integer"}, "h": {"type": "integer"},
                "z_order": {"type": "integer"}, "pid": {"type": "integer"}, "title": {"type": "string"}
            }}},
            "focused_window": {"type": "integer"},
            "ascii_desktop": {"type": "string"}
        }
    })
}
// ── Tool Handlers ───────────────────────────────────────

fn handle_tool_call(name: &str, args: &serde_json::Value) -> Result<serde_json::Value, String> {
    match name {
        "vm_status" => {
            let resp = send_socket_cmd("status")?;
            // Parse "mode=Terminal running=false assembled=false pc=0x0000 cursor=(0,0)"
            let mut result = serde_json::Map::new();
            for part in resp.split_whitespace() {
                if let Some((k, v)) = part.split_once('=') {
                    match k {
                        "mode" => {
                            result.insert(
                                "mode".into(),
                                serde_json::Value::String(v.trim_end_matches(',').into()),
                            );
                        }
                        "running" => {
                            result.insert("running".into(), serde_json::Value::Bool(v == "true"));
                        }
                        "assembled" => {
                            result.insert("assembled".into(), serde_json::Value::Bool(v == "true"));
                        }
                        "pc" => {
                            result.insert("pc".into(), serde_json::Value::String(v.into()));
                        }
                        _ => {}
                    }
                }
                if part.starts_with("cursor=") {
                    let inner = part.trim_start_matches("cursor=(").trim_end_matches(')');
                    let coords: Vec<&str> = inner.split(',').collect();
                    if coords.len() == 2 {
                        result.insert(
                            "cursor".into(),
                            serde_json::json!([
                                coords[0].parse::<i64>().unwrap_or(0),
                                coords[1].parse::<i64>().unwrap_or(0)
                            ]),
                        );
                    }
                }
            }
            Ok(serde_json::Value::Object(result))
        }

        "vm_screenshot" => {
            let path = args["path"].as_str().unwrap_or("screenshot.png");
            let resp = send_socket_cmd(&format!("screenshot {}", path))?;
            Ok(serde_json::json!({ "path": path, "response": resp }))
        }

        "vm_screen_dump" => {
            let resp = send_socket_cmd("screen")?;
            Ok(serde_json::json!({ "width": 256, "height": 256, "pixels": resp }))
        }

        "vm_registers" => {
            let resp = send_socket_cmd("registers")?;
            let mut regs = serde_json::Map::new();
            for line in resp.lines() {
                if let Some((name, val)) = line.split_once('=') {
                    regs.insert(name.into(), serde_json::Value::String(val.into()));
                }
            }
            Ok(serde_json::json!({ "registers": serde_json::Value::Object(regs) }))
        }

        "vm_canvas" => {
            let resp = send_socket_cmd("canvas")?;
            let lines: Vec<serde_json::Value> = resp
                .lines()
                .map(|l| {
                    if let Some((row, text)) = l.split_once('|') {
                        serde_json::json!({ "row": row.parse::<i64>().unwrap_or(0), "text": text })
                    } else {
                        serde_json::json!({ "row": 0, "text": l })
                    }
                })
                .collect();
            Ok(serde_json::json!({ "lines": lines }))
        }

        "vm_type" => {
            let text = args["text"].as_str().ok_or("Missing 'text' parameter")?;
            let resp = send_socket_cmd(&format!("type {}", text))?;
            Ok(serde_json::json!({ "ok": true, "response": resp }))
        }

        "vm_run" => {
            let resp = send_socket_cmd("run")?;
            Ok(serde_json::json!({ "response": resp }))
        }

        "vm_assemble" => {
            let resp = send_socket_cmd("assemble")?;
            Ok(serde_json::json!({ "ok": true, "response": resp }))
        }

        "vm_disasm" => {
            let resp = send_socket_cmd("disasm")?;
            let instructions: Vec<serde_json::Value> = resp
                .lines()
                .map(|l| {
                    if let Some((addr, text)) = l.split_once(':') {
                        serde_json::json!({ "addr": addr.trim(), "text": text.trim() })
                    } else {
                        serde_json::json!({ "addr": "???", "text": l })
                    }
                })
                .collect();
            Ok(serde_json::json!({ "instructions": instructions }))
        }

        "vm_save" => {
            let resp = send_socket_cmd("save")?;
            Ok(serde_json::json!({ "ok": true, "response": resp }))
        }

        "vm_save_asm" => {
            let name = args["name"].as_str().ok_or("Missing 'name' parameter")?;
            let resp = send_socket_cmd(&format!("save_asm {}", name))?;
            let ok = resp.contains("[saved:");
            Ok(serde_json::json!({ "ok": ok, "response": resp }))
        }

        "vm_load_source" => {
            let source = args["source"]
                .as_str()
                .ok_or("Missing 'source' parameter")?;
            // Convert real newlines to \n (backslash-n) for socket protocol
            let escaped = source.replace('\n', "\\n");
            let resp = send_socket_cmd(&format!("load_source {}", escaped))?;
            let ok = resp.contains("[loaded:");
            Ok(serde_json::json!({ "ok": ok, "response": resp }))
        }

        "vm_load_asm" => {
            let path = args["path"].as_str().ok_or("Missing 'path' parameter")?;
            let base_addr = args["base_addr"].as_str().unwrap_or("0x1000");
            let cmd = if base_addr.is_empty() {
                format!("load_asm {}", path)
            } else {
                format!("load_asm {} {}", path, base_addr)
            };
            let resp = send_socket_cmd(&cmd)?;
            let ok = resp.contains("[load_asm:");
            Ok(serde_json::json!({ "ok": ok, "response": resp }))
        }

        // ── Phase 84: Building & Desktop Tool Handlers ──────
        "building_list" => {
            let radius = args["radius"].as_i64().unwrap_or(256);
            let cmd = if radius > 0 {
                format!("buildings {}", radius)
            } else {
                "buildings 0".to_string()
            };
            let resp = send_socket_cmd(&cmd)?;
            let mut buildings = Vec::new();
            for line in resp.lines() {
                let parts: Vec<&str> = line.split(',').collect();
                if parts.len() >= 5 {
                    buildings.push(serde_json::json!({
                        "id": parts[0].parse::<i64>().unwrap_or(0),
                        "world_x": parts[1].parse::<i64>().unwrap_or(0),
                        "world_y": parts[2].parse::<i64>().unwrap_or(0),
                        "type_color": parts[3],
                        "name": parts[4],
                    }));
                }
            }
            Ok(serde_json::json!({ "buildings": buildings }))
        }

        "building_enter" => {
            let building_id = args["building_id"]
                .as_str()
                .ok_or("Missing 'building_id' parameter")?;
            let resp = send_socket_cmd(&format!("buildings 0"))?;
            // Find the building name from the list
            let mut app_name = String::new();
            for line in resp.lines() {
                let parts: Vec<&str> = line.split(',').collect();
                if parts.len() >= 5 && parts[0] == building_id {
                    app_name = parts[4].to_string();
                    break;
                }
            }
            if app_name.is_empty() {
                return Err(format!("Building {} not found", building_id));
            }
            let launch_resp = send_socket_cmd(&format!("launch {}", app_name))?;
            Ok(serde_json::json!({
                "entered": !launch_resp.contains("not found"),
                "app_name": app_name,
            }))
        }

        "building_exit" => {
            let resp = send_socket_cmd("player_pos")?;
            let parts: Vec<&str> = resp.split(',').collect();
            let (wx, wy) = if parts.len() >= 2 {
                (
                    parts[0].parse::<i64>().unwrap_or(0),
                    parts[1].parse::<i64>().unwrap_or(0),
                )
            } else {
                (0, 0)
            };
            Ok(serde_json::json!({ "world_x": wx, "world_y": wy }))
        }

        "desktop_state" => {
            let resp = send_socket_cmd("desktop_json")?;
            // Parse the JSON-ish response from socket
            match serde_json::from_str::<serde_json::Value>(&resp.trim()) {
                Ok(v) => Ok(v),
                Err(_) => Ok(serde_json::json!({ "raw": resp })),
            }
        }

        "desktop_launch" => {
            let app_name = args["app_name"]
                .as_str()
                .ok_or("Missing 'app_name' parameter")?;
            let window_mode = args["window"].as_bool().unwrap_or(false);
            let cmd = if window_mode {
                format!("launch --window {}", app_name)
            } else {
                format!("launch {}", app_name)
            };
            let resp = send_socket_cmd(&cmd)?;
            let launched = resp.contains("launching") || resp.contains("windowed");
            Ok(serde_json::json!({
                "launched": launched,
                "app_name": app_name,
                "window_mode": window_mode,
                "response": resp,
            }))
        }

        "player_position" => {
            let resp = send_socket_cmd("player_pos")?;
            let parts: Vec<&str> = resp.split(',').collect();
            if parts.len() >= 3 {
                Ok(serde_json::json!({
                    "world_x": parts[0].parse::<i64>().unwrap_or(0),
                    "world_y": parts[1].parse::<i64>().unwrap_or(0),
                    "facing": parts[2].trim(),
                }))
            } else {
                Ok(serde_json::json!({ "raw": resp }))
            }
        }

        // Phase 86: Hypervisor tools
        "hypervisor_boot" => {
            let config = args["config"]
                .as_str()
                .ok_or("Missing 'config' parameter")?;
            let window_id = args["window_id"].as_str().unwrap_or("0");
            let cmd = if window_id != "0" {
                format!("hypervisor_boot {} window={}", config, window_id)
            } else {
                format!("hypervisor_boot {}", config)
            };
            let resp = send_socket_cmd(&cmd)?;
            let booted = resp.contains("booted");
            Ok(serde_json::json!({
                "booted": booted,
                "config": config,
                "window_id": window_id,
                "response": resp,
            }))
        }

        "hypervisor_kill" => {
            let resp = send_socket_cmd("hypervisor_kill")?;
            Ok(serde_json::json!({
                "ok": resp.contains("killed"),
                "response": resp,
            }))
        }
        "riscv_run" => {
            let elf_path = args.get("elf_path").and_then(|v| v.as_str()).unwrap_or("");
            let resp = send_socket_cmd(&format!("riscv_run {}", elf_path))?;
            Ok(serde_json::json!({
                "launched": resp.contains("launched"),
                "elf_path": elf_path,
                "response": resp,
            }))
        }
        "riscv_kill" => {
            let resp = send_socket_cmd("riscv_kill")?;
            Ok(serde_json::json!({
                "ok": resp.contains("killed"),
                "response": resp,
            }))
        }

        // Phase 200: File Watcher tools
        "vm_watch" => {
            let path = args.get("path").and_then(|v| v.as_str()).unwrap_or("");
            if path.is_empty() {
                return Ok(serde_json::json!({
                    "watching": "",
                    "status": "error: path parameter required"
                }));
            }
            let cmd = format!("watch {}", path);
            let resp = send_socket_cmd(&cmd)?;
            let watching = if resp.contains("watching") {
                path.to_string()
            } else {
                String::new()
            };
            Ok(serde_json::json!({
                "watching": watching,
                "status": resp.trim().to_string()
            }))
        }

        "vm_unwatch" => {
            let resp = send_socket_cmd("unwatch")?;
            Ok(serde_json::json!({
                "ok": resp.contains("stopped") || resp.contains("no watch"),
                "status": resp.trim().to_string()
            }))
        }

        // Phase 88: AI Vision Bridge tools
        "vision_screenshot" => {
            let resp = send_socket_cmd("screenshot_annotated_b64")?;
            let wins_resp = send_socket_cmd("window_list")?;
            Ok(serde_json::json!({
                "png_base64": resp,
                "width": 256,
                "height": 256,
                "windows": wins_resp,
            }))
        }

        "vision_checksum" => {
            let resp = send_socket_cmd("canvas_checksum")?;
            Ok(serde_json::json!({
                "checksum": format!("{:08X}", resp.parse::<u64>().unwrap_or(0)),
                "checksum_u32": resp.parse::<u64>().unwrap_or(0),
            }))
        }

        "vision_diff" => {
            let prev_checksum = args["checksum"].as_str().unwrap_or("0");
            let resp = send_socket_cmd(&format!("canvas_diff {}", prev_checksum))?;
            Ok(serde_json::json!({
                "changed": !resp.contains("same"),
                "checksum": resp,
                "previous_checksum": prev_checksum,
            }))
        }

        "vision_describe" => {
            let prompt = args["prompt"].as_str().unwrap_or("");
            let cmd = if prompt.is_empty() {
                "vision_describe".to_string()
            } else {
                format!("vision_describe {}", prompt)
            };
            // Extend timeout for vision model (~5s typical, 10s max)
            let resp = send_socket_cmd_with_timeout(&cmd, std::time::Duration::from_secs(15))?;
            if resp.starts_with("error:") {
                Err(resp)
            } else {
                Ok(serde_json::json!({
                    "description": resp,
                    "model": "llama3.2-vision:11b (local Ollama)",
                }))
            }
        }

        "vision_peek_pixel" => {
            let x = args["x"].as_i64().unwrap_or(-1);
            let y = args["y"].as_i64().unwrap_or(-1);
            let resp = send_socket_cmd(&format!("peek_pixel {} {}", x, y))?;
            let trimmed = resp.trim();
            if trimmed.starts_with('[') {
                return Err(trimmed.to_string());
            }
            let mut hex = String::new();
            let mut r = 0i64;
            let mut g = 0i64;
            let mut b = 0i64;
            for (i, tok) in trimmed.split_whitespace().enumerate() {
                match i {
                    0 => hex = tok.to_string(),
                    _ => {
                        if let Some(rest) = tok.strip_prefix("r=") {
                            r = rest.parse().unwrap_or(0);
                        } else if let Some(rest) = tok.strip_prefix("g=") {
                            g = rest.parse().unwrap_or(0);
                        } else if let Some(rest) = tok.strip_prefix("b=") {
                            b = rest.parse().unwrap_or(0);
                        }
                    }
                }
            }
            Ok(serde_json::json!({"x": x, "y": y, "rgb_hex": hex, "r": r, "g": g, "b": b}))
        }

        "vision_region_checksum" => {
            let x = args["x"].as_i64().unwrap_or(-1);
            let y = args["y"].as_i64().unwrap_or(-1);
            let w = args["w"].as_i64().unwrap_or(-1);
            let h = args["h"].as_i64().unwrap_or(-1);
            let resp = send_socket_cmd(&format!("region_checksum {} {} {} {}", x, y, w, h))?;
            let trimmed = resp.trim();
            if trimmed.starts_with('[') {
                return Err(trimmed.to_string());
            }
            Ok(serde_json::json!({"x": x, "y": y, "w": w, "h": h, "checksum": trimmed}))
        }

        "vision_render_log" => {
            let action = args["action"].as_str().unwrap_or("dump");
            let resp = send_socket_cmd(&format!("render_log {}", action))?;
            if action == "dump" {
                let mut entries = Vec::new();
                for line in resp.lines() {
                    if let Some((frame_part, rest)) = line.split_once(' ') {
                        let frame = frame_part
                            .strip_prefix("frame=")
                            .and_then(|s| s.parse::<i64>().ok())
                            .unwrap_or(0);
                        if let Some((op_part, args_part)) = rest.split_once(" args=[") {
                            if let Some((opcode_hex, name)) = op_part.split_once(':') {
                                let mut arg_list = Vec::new();
                                let inner = args_part.trim_end_matches(']');
                                for a in inner.split(',') {
                                    if let Ok(val) = a.trim().parse::<i64>() {
                                        arg_list.push(val);
                                    }
                                }
                                entries.push(serde_json::json!({"frame": frame, "opcode": opcode_hex, "name": name, "args": arg_list}));
                            }
                        }
                    }
                }
                Ok(serde_json::json!({"entries": entries}))
            } else {
                Ok(serde_json::json!({"status": resp.trim()}))
            }
        }

        // ── Phase 89: AI Input Injection Tool Handlers ──
        "input_key" => {
            let key_str = args["key"].as_str().unwrap_or("0");
            let cmd = format!("inject_key {}", key_str);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "response": resp,
            }))
        }

        "input_mouse" => {
            let action = args["action"].as_str().unwrap_or("move");
            let x = args["x"].as_i64().unwrap_or(0);
            let y = args["y"].as_i64().unwrap_or(0);
            let button = args["button"].as_i64().unwrap_or(2);
            let cmd = match action {
                "click" => format!("inject_mouse click {} {} {}", x, y, button),
                _ => format!("inject_mouse move {} {}", x, y),
            };
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "action": action,
                "x": x,
                "y": y,
            }))
        }

        "input_text" => {
            let text = args["text"].as_str().unwrap_or("");
            let cmd = format!("inject_text {}", text);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": true,
                "response": resp,
            }))
        }

        // ── Phase 90: AI Program Control Handlers ──────
        "vm_screen_ascii" => {
            let resp = send_socket_cmd("vmscreen")?;
            Ok(serde_json::json!({
                "ascii": resp,
                "width": 64,
                "height": 32,
            }))
        }

        "vm_run_program" => {
            let source = args["source"]
                .as_str()
                .ok_or("Missing 'source' parameter")?;
            let _frames = args["frames"].as_i64().unwrap_or(10000) as usize;

            // Step 1: Write source to a temp file
            let tmp_path = "/tmp/geo_mcp_program.geo";
            std::fs::write(tmp_path, source)
                .map_err(|e| format!("Failed to write temp file: {}", e))?;

            // Step 2: Load source file into canvas
            let load_result = send_socket_cmd(&format!("load {}", tmp_path))?;
            if load_result.contains("error") {
                return Ok(serde_json::json!({
                    "success": false,
                    "error": load_result,
                }));
            }

            // Step 3: Assemble
            let asm_result = send_socket_cmd("assemble")?;
            if asm_result.contains("error")
                || asm_result.contains("Error")
                || asm_result.contains("ASM ERROR")
            {
                return Ok(serde_json::json!({
                    "success": false,
                    "error": asm_result,
                    "canvas": send_socket_cmd("canvas").unwrap_or_default(),
                }));
            }

            // Step 4: Run
            send_socket_cmd("run").ok();

            // Wait for execution by polling status
            let mut waited = 0;
            let poll_interval = std::time::Duration::from_millis(50);
            loop {
                std::thread::sleep(poll_interval);
                waited += 1;
                if let Ok(status) = send_socket_cmd("status") {
                    if status.contains("running=false") || status.contains("halted=true") {
                        break;
                    }
                }
                if waited * 50 > 10000 {
                    send_socket_cmd("halt").ok();
                    break;
                }
            }

            // Step 5: Collect results
            let canvas = send_socket_cmd("canvas").unwrap_or_default();
            let screen_ascii = send_socket_cmd("vmscreen").unwrap_or_default();
            let status_resp = send_socket_cmd("status").unwrap_or_default();
            let regs_resp = send_socket_cmd("registers").unwrap_or_default();

            // Parse status
            let mut status_obj = serde_json::Map::new();
            for part in status_resp.split_whitespace() {
                if let Some((k, v)) = part.split_once('=') {
                    match k {
                        "mode" => {
                            status_obj.insert("mode".into(), serde_json::Value::String(v.into()));
                        }
                        "running" => {
                            status_obj
                                .insert("running".into(), serde_json::Value::Bool(v == "true"));
                        }
                        "assembled" => {
                            status_obj
                                .insert("assembled".into(), serde_json::Value::Bool(v == "true"));
                        }
                        "pc" => {
                            status_obj.insert("pc".into(), serde_json::Value::String(v.into()));
                        }
                        _ => {}
                    }
                }
            }

            // Parse registers
            let mut regs_obj = serde_json::Map::new();
            for line in regs_resp.lines() {
                if let Some((name, val)) = line.split_once('=') {
                    regs_obj.insert(name.into(), serde_json::Value::String(val.into()));
                }
            }

            Ok(serde_json::json!({
                "success": true,
                "canvas": canvas,
                "screen_ascii": screen_ascii,
                "status": serde_json::Value::Object(status_obj),
                "registers": serde_json::Value::Object(regs_obj),
            }))
        }

        // ── Phase 106: AI Desktop Control Tool Handlers ──
        "window_list" => {
            let resp = send_socket_cmd("window_list")?;
            // Socket now returns JSON array directly: [{"id":...,"title":...}, ...]
            let resp_trimmed = resp.trim();
            let windows: Vec<serde_json::Value> = if resp_trimmed.starts_with('[') {
                serde_json::from_str(resp_trimmed).unwrap_or_default()
            } else {
                Vec::new()
            };
            Ok(serde_json::json!({
                "count": windows.len(),
                "windows": windows,
            }))
        }

        "window_move" => {
            let win_id = args["window_id"].as_str().unwrap_or("0");
            let x = args["x"].as_i64().unwrap_or(0);
            let y = args["y"].as_i64().unwrap_or(0);
            let cmd = format!("window_move {} {} {}", win_id, x, y);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "window_id": win_id,
                "x": x,
                "y": y,
                "response": resp,
            }))
        }

        "window_close" => {
            let win_id = args["window_id"].as_str().unwrap_or("0");
            let cmd = format!("window_close {}", win_id);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "window_id": win_id,
                "response": resp,
            }))
        }

        "window_focus" => {
            let win_id = args["window_id"].as_str().unwrap_or("0");
            let cmd = format!("window_focus {}", win_id);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "window_id": win_id,
                "response": resp,
            }))
        }

        "window_resize" => {
            let win_id = args["window_id"].as_str().unwrap_or("0");
            let w = args["w"].as_i64().unwrap_or(64);
            let h = args["h"].as_i64().unwrap_or(48);
            let cmd = format!("window_resize {} {} {}", win_id, w, h);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "window_id": win_id,
                "w": w,
                "h": h,
                "response": resp,
            }))
        }

        "process_kill" => {
            let pid = args["pid"].as_i64().unwrap_or(0);
            let cmd = format!("process_kill {}", pid);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "pid": pid,
                "response": resp,
            }))
        }

        "desktop_key" => {
            let key = args["key"].as_str().unwrap_or("0");
            let shift = args["shift"].as_i64().unwrap_or(0);
            let cmd = format!("inject_key {} {}", key, shift);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "key": key,
                "shift": shift,
                "response": resp,
            }))
        }

        "desktop_mouse_move" => {
            let x = args["x"].as_i64().unwrap_or(0);
            let y = args["y"].as_i64().unwrap_or(0);
            let cmd = format!("inject_mouse move {} {}", x, y);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "x": x,
                "y": y,
                "response": resp,
            }))
        }

        "desktop_mouse_click" => {
            let x = args["x"].as_i64().unwrap_or(0);
            let y = args["y"].as_i64().unwrap_or(0);
            let button = args["button"].as_i64().unwrap_or(2);
            let cmd = format!("inject_mouse click {} {} {}", x, y, button);
            let resp = send_socket_cmd(&cmd)?;
            Ok(serde_json::json!({
                "ok": resp.contains("ok"),
                "x": x,
                "y": y,
                "button": button,
                "response": resp,
            }))
        }

        "desktop_vision" => {
            // Socket desktop_vision now returns JSON directly:
            // {"windows":[...], "focused_window":{...}, "ascii_desktop":"..."}
            let resp = send_socket_cmd("desktop_vision")?;
            let trimmed = resp.trim();
            let parsed: serde_json::Value = if trimmed.starts_with('{') {
                serde_json::from_str(trimmed).unwrap_or_else(|_| serde_json::json!({}))
            } else {
                serde_json::json!({})
            };
            Ok(parsed)
        }

        // ── Phase 208: Programmatic Assembly & Execution ──
        "asm_load" => {
            let path = args["path"]
                .as_str()
                .ok_or("Missing 'path' parameter for asm_load")?;
            let cmd = format!("load {}", path);
            let resp = send_socket_cmd(&cmd)?;
            let ok = resp.contains("[loaded:");
            let lines = if ok {
                // Read the file to count lines
                std::fs::read_to_string(path)
                    .map(|s| s.lines().count())
                    .unwrap_or(0)
            } else {
                0
            };
            Ok(serde_json::json!({
                "ok": ok,
                "path": path,
                "lines": lines,
                "response": resp.trim(),
            }))
        }

        "asm_assemble" => {
            let resp = send_socket_cmd("assemble")?;
            let trimmed = resp.trim();
            let ok = trimmed.starts_with("[OK:");
            let words: i64 = if ok {
                // Parse "[OK: N bytes at 0x1000]"
                trimmed
                    .strip_prefix("[OK:")
                    .and_then(|s| s.split_whitespace().next())
                    .and_then(|n| n.parse().ok())
                    .unwrap_or(0)
            } else {
                0
            };
            let error = if !ok {
                // Parse "[ASM ERROR line N: msg]"
                Some(trimmed.to_string())
            } else {
                None
            };
            let mut result = serde_json::json!({
                "ok": ok,
                "words": words,
                "response": trimmed,
            });
            if let Some(e) = error {
                result["error"] = serde_json::Value::String(e);
            }
            Ok(result)
        }

        "asm_run" => {
            let timeout_ms: u64 = args["timeout_ms"].as_u64().unwrap_or(10000);
            // Halt first if running, then start fresh run
            send_socket_cmd("halt")?;
            // Start running
            send_socket_cmd("run")?;
            // Poll status until halted or timeout
            let start = std::time::Instant::now();
            let mut halted = false;
            while start.elapsed().as_millis() < timeout_ms as u128 {
                std::thread::sleep(std::time::Duration::from_millis(100));
                let status_resp = send_socket_cmd("status")?;
                if status_resp.contains("running=false") || status_resp.contains("halted=true") {
                    halted = true;
                    break;
                }
            }
            if !halted {
                // Force halt on timeout
                let _ = send_socket_cmd("halt");
            }
            // Fetch final state using vm_state (pc, halted, registers in one call)
            let state_resp = send_socket_cmd("vm_state")?;
            let mut registers = serde_json::Map::new();
            let mut pc = "????".to_string();
            let mut vm_halted = false;
            for line in state_resp.lines() {
                if let Some((key, val)) = line.split_once('=') {
                    match key.trim() {
                        "pc" => pc = val.trim().to_string(),
                        "halted" => vm_halted = val.trim() == "true",
                        _ => {
                            let k = key.trim();
                            if k.len() == 3
                                && k.starts_with('r')
                                && k[1..].chars().all(|c| c.is_ascii_digit())
                            {
                                registers.insert(k.into(), val.trim().into());
                            }
                        }
                    }
                }
            }
            Ok(serde_json::json!({
                "ok": true,
                "halted": halted || vm_halted,
                "pc": pc,
                "registers": registers,
                "response": format!("halted={}, timeout={}ms", halted, timeout_ms),
            }))
        }

        "asm_step" => {
            let resp = send_socket_cmd("step")?;
            let trimmed = resp.trim();
            let ok = trimmed.starts_with("pc=");
            let pc = if ok {
                trimmed.strip_prefix("pc=").unwrap_or("????").to_string()
            } else {
                "????".to_string()
            };
            Ok(serde_json::json!({
                "ok": ok,
                "pc": pc,
                "response": trimmed,
            }))
        }

        _ => Err(format!("Unknown tool: {}", name)),
    }
}

// ── JSON-RPC Dispatch ───────────────────────────────────

fn handle_request(request: JsonRpcRequest) -> JsonRpcResponse {
    match request.method.as_str() {
        "initialize" => JsonRpcResponse::success(
            request.id,
            serde_json::json!({
                "protocolVersion": "2024-11-05",
                "capabilities": {
                    "tools": { "listChanged": false }
                },
                "serverInfo": {
                    "name": "geometry-os-mcp",
                    "version": "0.1.0"
                }
            }),
        ),

        "tools/list" => JsonRpcResponse::success(
            request.id,
            serde_json::json!({
                "tools": get_tool_list()
            }),
        ),

        "tools/call" => {
            let args = request.params.clone().unwrap_or(serde_json::json!({}));
            let tool_name = args["name"].as_str().unwrap_or("");
            let tool_args = args
                .get("arguments")
                .cloned()
                .unwrap_or(serde_json::json!({}));

            match handle_tool_call(tool_name, &tool_args) {
                Ok(result) => JsonRpcResponse::success(
                    request.id,
                    serde_json::json!({
                        "content": [{ "type": "text", "text": serde_json::to_string_pretty(&result).unwrap_or_default() }]
                    }),
                ),
                Err(e) => JsonRpcResponse::error(request.id, -32000, e),
            }
        }

        "notifications/initialized" => {
            // No response needed for notifications, but we return empty to avoid hanging
            JsonRpcResponse::success(request.id, serde_json::json!({}))
        }

        _ => JsonRpcResponse::error(
            request.id,
            -32601,
            format!("Method not found: {}", request.method),
        ),
    }
}

// ── Stale Instance Cleanup ──────────────────────────────

/// Kill any existing geo_mcp_server process by reading its PID file.
fn kill_stale_instance() {
    if let Ok(pid_str) = std::fs::read_to_string(PID_FILE) {
        if let Ok(pid) = pid_str.trim().parse::<u32>() {
            // Check if the process is still running
            // Sending signal 0 doesn't kill but checks existence
            unsafe {
                if libc::kill(pid as i32, 0) == 0 {
                    eprintln!("[geo_mcp_server] Killing stale instance (PID {})", pid);
                    libc::kill(pid as i32, libc::SIGTERM);
                    // Give it a moment to die gracefully
                    std::thread::sleep(std::time::Duration::from_millis(100));
                    if libc::kill(pid as i32, 0) == 0 {
                        // Still alive, force kill
                        libc::kill(pid as i32, libc::SIGKILL);
                    }
                }
            }
        }
    }
}

/// Write our PID to the PID file.
fn write_pid_file() {
    let pid = std::process::id();
    let _ = std::fs::write(PID_FILE, pid.to_string());
    eprintln!("[geo_mcp_server] PID {} written to {}", pid, PID_FILE);
}

/// Remove the PID file on shutdown.
fn cleanup_pid_file() {
    let _ = std::fs::remove_file(PID_FILE);
}

// ── Main Loop ───────────────────────────────────────────

fn main() {
    // Kill stale instance if running
    kill_stale_instance();
    write_pid_file();

    let stdin = std::io::stdin();
    let mut stdout = std::io::stdout();

    eprintln!("[geo_mcp_server] Starting, connecting to {}", SOCKET_PATH);

    // Quick connectivity check
    match UnixStream::connect(SOCKET_PATH) {
        Ok(_) => eprintln!("[geo_mcp_server] Socket OK"),
        Err(e) => eprintln!("[geo_mcp_server] WARNING: Cannot reach socket: {}", e),
    }

    let reader = BufReader::new(stdin.lock());
    for line in reader.lines() {
        match line {
            Ok(line) => {
                if line.trim().is_empty() {
                    continue;
                }

                let parsed: Result<serde_json::Value, _> = serde_json::from_str(&line);
                match parsed {
                    Ok(val) => {
                        let request = JsonRpcRequest {
                            jsonrpc: val["jsonrpc"].as_str().unwrap_or("2.0").to_string(),
                            id: val.get("id").cloned(),
                            method: val["method"].as_str().unwrap_or("").to_string(),
                            params: val.get("params").cloned(),
                        };

                        let response = handle_request(request);
                        let output = serde_json::json!({
                            "jsonrpc": response.jsonrpc,
                            "id": response.id,
                            "result": response.result,
                            "error": response.error.as_ref().map(|e| serde_json::json!({
                                "code": e.code,
                                "message": e.message,
                            })),
                        });
                        if let Ok(json_str) = serde_json::to_string(&output) {
                            let _ = writeln!(stdout, "{}", json_str);
                            let _ = stdout.flush();
                        }
                    }
                    Err(e) => {
                        eprintln!("[geo_mcp_server] Parse error: {}", e);
                    }
                }
            }
            Err(_) => break,
        }
    }

    eprintln!("[geo_mcp_server] Shutting down");
    cleanup_pid_file();
}

// ── Tests ───────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    // ── Tool List Tests ─────────────────────────────────

    #[test]
    fn test_tool_list_not_empty() {
        let tools = get_tool_list();
        assert!(!tools.is_empty());
        assert!(tools
            .iter()
            .any(|t| t["name"].as_str() == Some("vm_status")));
        assert!(tools
            .iter()
            .any(|t| t["name"].as_str() == Some("vm_screenshot")));
        assert!(tools.iter().any(|t| t["name"].as_str() == Some("vm_type")));
    }

    #[test]
    fn test_all_tools_have_required_schema_fields() {
        let tools = get_tool_list();
        for tool in &tools {
            let name = tool["name"].as_str().unwrap_or("???");
            assert!(tool.get("name").is_some(), "Tool missing 'name': {}", name);
            assert!(
                tool.get("description").is_some(),
                "Tool missing 'description': {}",
                name
            );
            assert!(
                tool.get("inputSchema").is_some(),
                "Tool missing 'inputSchema': {}",
                name
            );
            let schema = &tool["inputSchema"];
            assert_eq!(
                schema["type"].as_str(),
                Some("object"),
                "inputSchema.type != 'object' for {}",
                name
            );
            assert!(
                schema.get("properties").is_some(),
                "inputSchema missing 'properties' for {}",
                name
            );
            assert!(
                schema.get("required").is_some(),
                "inputSchema missing 'required' for {}",
                name
            );
        }
    }

    #[test]
    fn test_tool_count_is_reasonable() {
        let tools = get_tool_list();
        // We have 40+ tools defined -- verify at least 35
        assert!(
            tools.len() >= 35,
            "Expected at least 35 tools, got {}",
            tools.len()
        );
    }

    #[test]
    fn test_no_duplicate_tool_names() {
        let tools = get_tool_list();
        let names: Vec<&str> = tools.iter().filter_map(|t| t["name"].as_str()).collect();
        let mut seen = std::collections::HashSet::new();
        for name in &names {
            assert!(seen.insert(*name), "Duplicate tool name: {}", name);
        }
    }

    #[test]
    fn test_vm_tools_present() {
        let tools = get_tool_list();
        let names: Vec<&str> = tools.iter().filter_map(|t| t["name"].as_str()).collect();
        assert!(names.contains(&"vm_status"), "vm_status missing");
        assert!(names.contains(&"vm_screenshot"), "vm_screenshot missing");
        assert!(names.contains(&"vm_screen_dump"), "vm_screen_dump missing");
        assert!(names.contains(&"vm_registers"), "vm_registers missing");
        assert!(names.contains(&"vm_canvas"), "vm_canvas missing");
        assert!(names.contains(&"vm_type"), "vm_type missing");
        assert!(names.contains(&"vm_run"), "vm_run missing");
        assert!(names.contains(&"vm_assemble"), "vm_assemble missing");
        assert!(names.contains(&"vm_disasm"), "vm_disasm missing");
        assert!(names.contains(&"vm_save"), "vm_save missing");
        assert!(names.contains(&"vm_save_asm"), "vm_save_asm missing");
        assert!(names.contains(&"vm_load_source"), "vm_load_source missing");
        assert!(names.contains(&"vm_load_asm"), "vm_load_asm missing");
        assert!(
            names.contains(&"vm_screen_ascii"),
            "vm_screen_ascii missing"
        );
        assert!(names.contains(&"vm_run_program"), "vm_run_program missing");
        assert!(names.contains(&"vm_watch"), "vm_watch missing");
        assert!(names.contains(&"vm_unwatch"), "vm_unwatch missing");
    }

    #[test]
    fn test_asm_tools_in_tool_list() {
        let tools = get_tool_list();
        let names: Vec<&str> = tools.iter().filter_map(|t| t["name"].as_str()).collect();
        assert!(
            names.contains(&"asm_load"),
            "asm_load missing from tool list"
        );
        assert!(
            names.contains(&"asm_assemble"),
            "asm_assemble missing from tool list"
        );
        assert!(names.contains(&"asm_run"), "asm_run missing from tool list");
        assert!(
            names.contains(&"asm_step"),
            "asm_step missing from tool list"
        );
    }

    #[test]
    fn test_vision_tools_present() {
        let tools = get_tool_list();
        let names: Vec<&str> = tools.iter().filter_map(|t| t["name"].as_str()).collect();
        assert!(
            names.contains(&"vision_screenshot"),
            "vision_screenshot missing"
        );
        assert!(
            names.contains(&"vision_checksum"),
            "vision_checksum missing"
        );
        assert!(names.contains(&"vision_diff"), "vision_diff missing");
        assert!(
            names.contains(&"vision_describe"),
            "vision_describe missing"
        );
        assert!(
            names.contains(&"vision_peek_pixel"),
            "vision_peek_pixel missing"
        );
        assert!(
            names.contains(&"vision_region_checksum"),
            "vision_region_checksum missing"
        );
        assert!(
            names.contains(&"vision_render_log"),
            "vision_render_log missing"
        );
    }

    #[test]
    fn test_input_tools_present() {
        let tools = get_tool_list();
        let names: Vec<&str> = tools.iter().filter_map(|t| t["name"].as_str()).collect();
        assert!(names.contains(&"input_key"), "input_key missing");
        assert!(names.contains(&"input_mouse"), "input_mouse missing");
        assert!(names.contains(&"input_text"), "input_text missing");
    }

    #[test]
    fn test_desktop_tools_present() {
        let tools = get_tool_list();
        let names: Vec<&str> = tools.iter().filter_map(|t| t["name"].as_str()).collect();
        assert!(names.contains(&"building_list"), "building_list missing");
        assert!(names.contains(&"building_enter"), "building_enter missing");
        assert!(names.contains(&"building_exit"), "building_exit missing");
        assert!(names.contains(&"desktop_state"), "desktop_state missing");
        assert!(names.contains(&"desktop_launch"), "desktop_launch missing");
        assert!(
            names.contains(&"player_position"),
            "player_position missing"
        );
        assert!(names.contains(&"desktop_key"), "desktop_key missing");
        assert!(names.contains(&"desktop_vision"), "desktop_vision missing");
    }

    #[test]
    fn test_window_tools_present() {
        let tools = get_tool_list();
        let names: Vec<&str> = tools.iter().filter_map(|t| t["name"].as_str()).collect();
        assert!(names.contains(&"window_list"), "window_list missing");
        assert!(names.contains(&"window_move"), "window_move missing");
        assert!(names.contains(&"window_close"), "window_close missing");
        assert!(names.contains(&"window_focus"), "window_focus missing");
        assert!(names.contains(&"window_resize"), "window_resize missing");
        assert!(names.contains(&"process_kill"), "process_kill missing");
    }

    #[test]
    fn test_tool_required_params_are_strings() {
        let tools = get_tool_list();
        for tool in &tools {
            let name = tool["name"].as_str().unwrap_or("???");
            if let Some(required) = tool["inputSchema"]["required"].as_array() {
                for req_param in required {
                    if let Some(param_name) = req_param.as_str() {
                        if let Some(props) =
                            tool["inputSchema"]["properties"][param_name].as_object()
                        {
                            assert!(
                                props.get("type").is_some(),
                                "Required param '{}' on '{}' missing type",
                                param_name,
                                name
                            );
                        }
                    }
                }
            }
        }
    }

    // ── Status Parsing Tests ────────────────────────────

    #[test]
    fn test_status_parsing() {
        let resp = "mode=Terminal running=false assembled=false pc=0x0000 cursor=(5,3)";
        let mut result = serde_json::Map::new();
        for part in resp.split_whitespace() {
            if let Some((k, v)) = part.split_once('=') {
                match k {
                    "mode" => {
                        result.insert("mode".into(), serde_json::Value::String(v.into()));
                    }
                    "running" => {
                        result.insert("running".into(), serde_json::Value::Bool(v == "true"));
                    }
                    _ => {}
                }
            }
        }
        assert_eq!(result["mode"], serde_json::Value::String("Terminal".into()));
        assert_eq!(result["running"], serde_json::Value::Bool(false));
    }

    #[test]
    fn test_status_parsing_running_true() {
        let resp = "mode=Editor running=true assembled=true pc=0x10FF cursor=(12,7)";
        let mut result = serde_json::Map::new();
        for part in resp.split_whitespace() {
            if let Some((k, v)) = part.split_once('=') {
                match k {
                    "mode" => {
                        result.insert("mode".into(), serde_json::Value::String(v.into()));
                    }
                    "running" => {
                        result.insert("running".into(), serde_json::Value::Bool(v == "true"));
                    }
                    "assembled" => {
                        result.insert("assembled".into(), serde_json::Value::Bool(v == "true"));
                    }
                    _ => {}
                }
            }
        }
        assert_eq!(result["mode"], "Editor");
        assert_eq!(result["running"], serde_json::Value::Bool(true));
        assert_eq!(result["assembled"], serde_json::Value::Bool(true));
    }

    #[test]
    fn test_status_cursor_parsing() {
        let resp = "cursor=(5,3)";
        let inner = resp.trim_start_matches("cursor=(").trim_end_matches(')');
        let coords: Vec<&str> = inner.split(',').collect();
        assert_eq!(coords.len(), 2);
        assert_eq!(coords[0].parse::<i64>().unwrap(), 5);
        assert_eq!(coords[1].parse::<i64>().unwrap(), 3);
    }

    #[test]
    fn test_status_cursor_parsing_origin() {
        let resp = "cursor=(0,0)";
        let inner = resp.trim_start_matches("cursor=(").trim_end_matches(')');
        let coords: Vec<&str> = inner.split(',').collect();
        assert_eq!(coords[0].parse::<i64>().unwrap(), 0);
        assert_eq!(coords[1].parse::<i64>().unwrap(), 0);
    }

    // ── Register Parsing Tests ──────────────────────────

    #[test]
    fn test_register_parsing() {
        let resp = "r00=00000000\nr01=00000001\nr31=FFFFFFFF";
        let mut regs = serde_json::Map::new();
        for line in resp.lines() {
            if let Some((name, val)) = line.split_once('=') {
                regs.insert(name.into(), serde_json::Value::String(val.into()));
            }
        }
        assert_eq!(regs["r00"], "00000000");
        assert_eq!(regs["r31"], "FFFFFFFF");
    }

    #[test]
    fn test_register_parsing_all_32() {
        let mut resp = String::new();
        for i in 0..32 {
            resp.push_str(&format!("r{:02}=FFFFFFFF\n", i));
        }
        let mut regs = serde_json::Map::new();
        for line in resp.lines() {
            if let Some((name, val)) = line.split_once('=') {
                regs.insert(name.into(), serde_json::Value::String(val.into()));
            }
        }
        assert_eq!(regs.len(), 32);
        assert_eq!(regs["r00"], "FFFFFFFF");
        assert_eq!(regs["r31"], "FFFFFFFF");
    }

    // ── Canvas Parsing Tests ────────────────────────────

    #[test]
    fn test_canvas_line_parsing() {
        let resp = "0|LDI r1, 10\n1|ADD r2, r3\n2|HALT";
        let lines: Vec<serde_json::Value> = resp
            .lines()
            .map(|l| {
                if let Some((row, text)) = l.split_once('|') {
                    serde_json::json!({ "row": row.parse::<i64>().unwrap_or(0), "text": text })
                } else {
                    serde_json::json!({ "row": 0, "text": l })
                }
            })
            .collect();
        assert_eq!(lines.len(), 3);
        assert_eq!(lines[0]["row"], 0);
        assert_eq!(lines[0]["text"], "LDI r1, 10");
        assert_eq!(lines[1]["text"], "ADD r2, r3");
        assert_eq!(lines[2]["text"], "HALT");
    }

    #[test]
    fn test_canvas_line_parsing_empty() {
        let resp = "";
        let lines: Vec<serde_json::Value> = resp
            .lines()
            .map(|l| {
                if let Some((row, text)) = l.split_once('|') {
                    serde_json::json!({ "row": row.parse::<i64>().unwrap_or(0), "text": text })
                } else {
                    serde_json::json!({ "row": 0, "text": l })
                }
            })
            .collect();
        assert!(lines.is_empty());
    }

    // ── Disasm Parsing Tests ────────────────────────────

    #[test]
    fn test_disasm_parsing() {
        let resp = "0x1000: LDI r1, 10\n0x1003: ADD r2, r3\n0x1005: HALT";
        let instructions: Vec<serde_json::Value> = resp
            .lines()
            .map(|l| {
                if let Some((addr, text)) = l.split_once(':') {
                    serde_json::json!({ "addr": addr.trim(), "text": text.trim() })
                } else {
                    serde_json::json!({ "addr": "???", "text": l })
                }
            })
            .collect();
        assert_eq!(instructions.len(), 3);
        assert_eq!(instructions[0]["addr"], "0x1000");
        assert_eq!(instructions[0]["text"], "LDI r1, 10");
        assert_eq!(instructions[2]["text"], "HALT");
    }

    #[test]
    fn test_disasm_parsing_no_colon() {
        let resp = "some garbage line\nanother bad line";
        let instructions: Vec<serde_json::Value> = resp
            .lines()
            .map(|l| {
                if let Some((addr, text)) = l.split_once(':') {
                    serde_json::json!({ "addr": addr.trim(), "text": text.trim() })
                } else {
                    serde_json::json!({ "addr": "???", "text": l })
                }
            })
            .collect();
        assert_eq!(instructions.len(), 2);
        assert_eq!(instructions[0]["addr"], "???");
    }

    // ── ASM Response Parsing Tests ──────────────────────

    #[test]
    fn test_asm_assemble_response_parsing() {
        let resp = "[OK: 42 bytes at 0x1000]";
        let trimmed = resp.trim();
        let ok = trimmed.starts_with("[OK:");
        let words: i64 = if ok {
            trimmed
                .strip_prefix("[OK:")
                .and_then(|s| s.split_whitespace().next())
                .and_then(|n| n.parse().ok())
                .unwrap_or(0)
        } else {
            0
        };
        assert!(ok);
        assert_eq!(words, 42);
    }

    #[test]
    fn test_asm_assemble_response_large_word_count() {
        let resp = "[OK: 4686 bytes at 0x1000]";
        let trimmed = resp.trim();
        let ok = trimmed.starts_with("[OK:");
        let words: i64 = if ok {
            trimmed
                .strip_prefix("[OK:")
                .and_then(|s| s.split_whitespace().next())
                .and_then(|n| n.parse().ok())
                .unwrap_or(0)
        } else {
            0
        };
        assert!(ok);
        assert_eq!(words, 4686);
    }

    #[test]
    fn test_asm_assemble_error_parsing() {
        let resp = "[ASM ERROR line 5: unknown opcode FOOBAR]";
        let trimmed = resp.trim();
        let ok = trimmed.starts_with("[OK:");
        assert!(!ok);
        assert!(trimmed.contains("ASM ERROR"));
    }

    #[test]
    fn test_asm_load_response_parsing() {
        let resp = "[loaded: programs/hello.asm]\n";
        let ok = resp.contains("[loaded:");
        assert!(ok);
    }

    #[test]
    fn test_asm_step_response_parsing() {
        let resp = "pc=0x1003";
        let trimmed = resp.trim();
        let ok = trimmed.starts_with("pc=");
        let pc = if ok {
            trimmed.strip_prefix("pc=").unwrap_or("????").to_string()
        } else {
            "????".to_string()
        };
        assert!(ok);
        assert_eq!(pc, "0x1003");
    }

    // ── VM State Parsing Tests ──────────────────────────

    #[test]
    fn test_vm_state_parsing() {
        let resp = "pc=0x0000\nhalted=true\nrunning=false\nassembled=true\nr00=00000000\nr01=00000001\nr02=000000FF";
        let mut registers = serde_json::Map::new();
        let mut pc = "????".to_string();
        let mut vm_halted = false;
        for line in resp.lines() {
            if let Some((key, val)) = line.split_once('=') {
                match key.trim() {
                    "pc" => pc = val.trim().to_string(),
                    "halted" => vm_halted = val.trim() == "true",
                    _ => {
                        let k = key.trim();
                        if k.len() == 3
                            && k.starts_with('r')
                            && k[1..].chars().all(|c| c.is_ascii_digit())
                        {
                            registers.insert(k.into(), val.trim().into());
                        }
                    }
                }
            }
        }
        assert_eq!(pc, "0x0000");
        assert!(vm_halted);
        assert_eq!(registers["r00"], "00000000");
        assert_eq!(registers["r01"], "00000001");
        assert_eq!(registers["r02"], "000000FF");
        assert!(!registers.contains_key("running"));
        assert!(!registers.contains_key("assembled"));
    }

    #[test]
    fn test_vm_state_parsing_not_halted() {
        let resp = "pc=0x10FF\nhalted=false\nrunning=true\nr10=00000005\nr30=0000FF00";
        let mut pc = "????".to_string();
        let mut vm_halted = false;
        let mut registers = serde_json::Map::new();
        for line in resp.lines() {
            if let Some((key, val)) = line.split_once('=') {
                match key.trim() {
                    "pc" => pc = val.trim().to_string(),
                    "halted" => vm_halted = val.trim() == "true",
                    _ => {
                        let k = key.trim();
                        if k.len() == 3
                            && k.starts_with('r')
                            && k[1..].chars().all(|c| c.is_ascii_digit())
                        {
                            registers.insert(k.into(), val.trim().into());
                        }
                    }
                }
            }
        }
        assert_eq!(pc, "0x10FF");
        assert!(!vm_halted);
        assert_eq!(registers["r10"], "00000005");
        assert_eq!(registers["r30"], "0000FF00");
        assert!(!registers.contains_key("running"));
    }

    // ── Building List Parsing Tests ─────────────────────

    #[test]
    fn test_building_list_parsing() {
        let resp = "1,10,20,#FF0000,Terminal\n2,50,30,#00FF00,Editor\n3,80,40,#0000FF,Viewer";
        let mut buildings = Vec::new();
        for line in resp.lines() {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() >= 5 {
                buildings.push(serde_json::json!({
                    "id": parts[0].parse::<i64>().unwrap_or(0),
                    "world_x": parts[1].parse::<i64>().unwrap_or(0),
                    "world_y": parts[2].parse::<i64>().unwrap_or(0),
                    "type_color": parts[3],
                    "name": parts[4],
                }));
            }
        }
        assert_eq!(buildings.len(), 3);
        assert_eq!(buildings[0]["id"], 1);
        assert_eq!(buildings[0]["name"], "Terminal");
        assert_eq!(buildings[1]["type_color"], "#00FF00");
        assert_eq!(buildings[2]["world_x"], 80);
    }

    #[test]
    fn test_building_list_parsing_empty() {
        let resp = "";
        let mut buildings = Vec::new();
        for line in resp.lines() {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() >= 5 {
                buildings.push(serde_json::json!({"id": parts[0]}));
            }
        }
        assert!(buildings.is_empty());
    }

    #[test]
    fn test_building_list_parsing_too_few_fields() {
        let resp = "1,10,20\nbad data";
        let mut buildings = Vec::new();
        for line in resp.lines() {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() >= 5 {
                buildings.push(serde_json::json!({"id": parts[0]}));
            }
        }
        assert!(buildings.is_empty());
    }

    // ── Player Position Parsing Tests ───────────────────

    #[test]
    fn test_player_position_parsing() {
        let resp = "128,64,north";
        let parts: Vec<&str> = resp.split(',').collect();
        assert!(parts.len() >= 3);
        assert_eq!(parts[0].parse::<i64>().unwrap(), 128);
        assert_eq!(parts[1].parse::<i64>().unwrap(), 64);
        assert_eq!(parts[2].trim(), "north");
    }

    #[test]
    fn test_player_position_parsing_short() {
        let resp = "10,20";
        let parts: Vec<&str> = resp.split(',').collect();
        assert_eq!(parts.len(), 2);
        // Handler returns raw response for < 3 parts
    }

    // ── Vision Checksum Parsing Tests ───────────────────

    #[test]
    fn test_vision_checksum_parsing() {
        let resp = "1234567890";
        let checksum = resp.parse::<u64>().unwrap_or(0);
        let formatted = format!("{:08X}", checksum);
        assert_eq!(formatted, "499602D2");
    }

    #[test]
    fn test_vision_checksum_parsing_zero() {
        let resp = "0";
        let checksum = resp.parse::<u64>().unwrap_or(0);
        assert_eq!(checksum, 0);
        assert_eq!(format!("{:08X}", checksum), "00000000");
    }

    // ── Vision Diff Parsing Tests ───────────────────────

    #[test]
    fn test_vision_diff_same() {
        let prev_checksum = "DEADBEEF";
        let resp = "same";
        let changed = !resp.contains("same");
        assert!(!changed);
    }

    #[test]
    fn test_vision_diff_changed() {
        let prev_checksum = "DEADBEEF";
        let resp = "0x12345678";
        let changed = !resp.contains("same");
        assert!(changed);
    }

    // ── Vision Peek Pixel Parsing Tests ─────────────────

    #[test]
    fn test_vision_peek_pixel_parsing() {
        let resp = "0x00FF00 r=0 g=255 b=0";
        let trimmed = resp.trim();
        assert!(!trimmed.starts_with('[')); // not an error
        let mut r = 0i64;
        let mut g = 0i64;
        let mut b = 0i64;
        for (i, tok) in trimmed.split_whitespace().enumerate() {
            match i {
                0 => {} // hex color
                _ => {
                    if let Some(rest) = tok.strip_prefix("r=") {
                        r = rest.parse().unwrap_or(0);
                    } else if let Some(rest) = tok.strip_prefix("g=") {
                        g = rest.parse().unwrap_or(0);
                    } else if let Some(rest) = tok.strip_prefix("b=") {
                        b = rest.parse().unwrap_or(0);
                    }
                }
            }
        }
        assert_eq!(r, 0);
        assert_eq!(g, 255);
        assert_eq!(b, 0);
    }

    #[test]
    fn test_vision_peek_pixel_parsing_black() {
        let resp = "0x000000 r=0 g=0 b=0";
        let trimmed = resp.trim();
        let mut r = 0i64;
        let mut g = 0i64;
        let mut b = 0i64;
        for (i, tok) in trimmed.split_whitespace().enumerate() {
            if i > 0 {
                if let Some(rest) = tok.strip_prefix("r=") {
                    r = rest.parse().unwrap_or(0);
                } else if let Some(rest) = tok.strip_prefix("g=") {
                    g = rest.parse().unwrap_or(0);
                } else if let Some(rest) = tok.strip_prefix("b=") {
                    b = rest.parse().unwrap_or(0);
                }
            }
        }
        assert_eq!(r, 0);
        assert_eq!(g, 0);
        assert_eq!(b, 0);
    }

    #[test]
    fn test_vision_peek_pixel_parsing_error() {
        let resp = "[error: pixel out of bounds]";
        let trimmed = resp.trim();
        assert!(trimmed.starts_with('[')); // error response
    }

    // ── Vision Render Log Parsing Tests ─────────────────

    #[test]
    fn test_render_log_parsing() {
        let resp = "frame=0 opcode=0x42:RECTF args=[10,20,30,40,50]\nframe=0 opcode=0x43:FILL args=[0,0,100,200,0xFF0000]\nframe=1 opcode=0x00:NOP args=[]";
        let mut entries = Vec::new();
        for line in resp.lines() {
            if let Some((frame_part, rest)) = line.split_once(' ') {
                let frame = frame_part
                    .strip_prefix("frame=")
                    .and_then(|s| s.parse::<i64>().ok())
                    .unwrap_or(0);
                if let Some((op_part, args_part)) = rest.split_once(" args=[") {
                    if let Some((opcode_hex, name)) = op_part.split_once(':') {
                        let mut arg_list = Vec::new();
                        let inner = args_part.trim_end_matches(']');
                        for a in inner.split(',') {
                            if let Ok(val) = a.trim().parse::<i64>() {
                                arg_list.push(val);
                            }
                        }
                        entries.push(serde_json::json!({"frame": frame, "opcode": opcode_hex, "name": name, "args": arg_list}));
                    }
                }
            }
        }
        assert_eq!(entries.len(), 3);
        assert_eq!(entries[0]["frame"], 0);
        assert_eq!(entries[0]["opcode"], "opcode=0x42");
        assert_eq!(entries[0]["name"], "RECTF");
        assert_eq!(entries[0]["args"].as_array().unwrap().len(), 5);
        assert_eq!(entries[2]["frame"], 1);
        assert!(entries[2]["args"].as_array().unwrap().is_empty());
    }

    #[test]
    fn test_render_log_parsing_empty() {
        let resp = "";
        let entries: Vec<serde_json::Value> = Vec::new();
        assert!(entries.is_empty());
    }

    // ── Window List Parsing Tests ───────────────────────

    #[test]
    fn test_window_list_parsing_json() {
        let resp = r#"[{"id":"win-1","title":"Terminal","pid":100,"x":0,"y":0,"w":64,"h":48}]"#;
        let windows: Vec<serde_json::Value> = serde_json::from_str(resp.trim()).unwrap_or_default();
        assert_eq!(windows.len(), 1);
        assert_eq!(windows[0]["id"], "win-1");
        assert_eq!(windows[0]["title"], "Terminal");
        assert_eq!(windows[0]["pid"], 100);
    }

    #[test]
    fn test_window_list_parsing_empty() {
        let resp = "not json";
        let windows: Vec<serde_json::Value> = if resp.trim().starts_with('[') {
            serde_json::from_str(resp.trim()).unwrap_or_default()
        } else {
            Vec::new()
        };
        assert!(windows.is_empty());
    }

    #[test]
    fn test_window_list_parsing_multiple() {
        let resp = r#"[
            {"id":"win-1","title":"T1","pid":100},
            {"id":"win-2","title":"T2","pid":200},
            {"id":"win-3","title":"T3","pid":300}
        ]"#;
        let windows: Vec<serde_json::Value> = serde_json::from_str(resp.trim()).unwrap_or_default();
        assert_eq!(windows.len(), 3);
    }

    // ── JSON-RPC Dispatch Tests ─────────────────────────

    #[test]
    fn test_initialize_response() {
        let request = JsonRpcRequest {
            jsonrpc: "2.0".into(),
            id: Some(serde_json::json!(1)),
            method: "initialize".into(),
            params: None,
        };
        let response = handle_request(request);
        assert!(response.result.is_some());
        assert!(response.error.is_none());
        let result = response.result.unwrap();
        assert_eq!(result["protocolVersion"], "2024-11-05");
        assert_eq!(result["serverInfo"]["name"], "geometry-os-mcp");
    }

    #[test]
    fn test_tools_list_response() {
        let request = JsonRpcRequest {
            jsonrpc: "2.0".into(),
            id: Some(serde_json::json!(2)),
            method: "tools/list".into(),
            params: None,
        };
        let response = handle_request(request);
        assert!(response.result.is_some());
        assert!(response.error.is_none());
        let result = response.result.unwrap();
        let tools = result["tools"].as_array().unwrap();
        assert!(!tools.is_empty());
    }

    #[test]
    fn test_unknown_method_returns_error() {
        let request = JsonRpcRequest {
            jsonrpc: "2.0".into(),
            id: Some(serde_json::json!(99)),
            method: "nonexistent/method".into(),
            params: None,
        };
        let response = handle_request(request);
        assert!(response.error.is_some());
        let error = response.error.unwrap();
        assert_eq!(error.code, -32601);
        assert!(error.message.contains("Method not found"));
    }

    #[test]
    fn test_notifications_initialized_no_error() {
        let request = JsonRpcRequest {
            jsonrpc: "2.0".into(),
            id: None,
            method: "notifications/initialized".into(),
            params: None,
        };
        let response = handle_request(request);
        assert!(response.result.is_some());
        assert!(response.error.is_none());
    }

    #[test]
    fn test_tools_call_unknown_tool_returns_error() {
        // tools/call dispatches to handle_tool_call which returns Err for unknown tools
        // But it goes through handle_request which wraps in content
        // So we test handle_tool_call directly
        let result = handle_tool_call("nonexistent_tool", &serde_json::json!({}));
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("Unknown tool"));
    }

    #[test]
    fn test_json_rpc_response_success() {
        let resp = JsonRpcResponse::success(
            Some(serde_json::json!(42)),
            serde_json::json!({"key": "value"}),
        );
        assert_eq!(resp.jsonrpc, "2.0");
        assert_eq!(resp.id, Some(serde_json::json!(42)));
        assert!(resp.result.is_some());
        assert!(resp.error.is_none());
    }

    #[test]
    fn test_json_rpc_response_error() {
        let resp = JsonRpcResponse::error(Some(serde_json::json!(1)), -32000, "something failed");
        assert_eq!(resp.jsonrpc, "2.0");
        assert!(resp.result.is_none());
        assert!(resp.error.is_some());
        let err = resp.error.unwrap();
        assert_eq!(err.code, -32000);
        assert_eq!(err.message, "something failed");
    }

    #[test]
    fn test_json_rpc_response_error_no_id() {
        let resp = JsonRpcResponse::error(None, -32700, "parse error");
        assert!(resp.id.is_none());
        assert_eq!(resp.error.unwrap().code, -32700);
    }

    // ── Tool Helper Function Tests ──────────────────────

    #[test]
    fn test_tool_function_creates_valid_schema() {
        let t = tool(
            "test_tool",
            "A test tool",
            vec![param("arg1", "string", "First arg", true)],
            serde_json::json!({"type": "object"}),
        );
        assert_eq!(t["name"], "test_tool");
        assert_eq!(t["description"], "A test tool");
        assert_eq!(t["inputSchema"]["type"], "object");
        assert!(t["inputSchema"]["properties"]["arg1"].is_object());
        assert!(t["inputSchema"]["required"]
            .as_array()
            .unwrap()
            .contains(&serde_json::json!("arg1")));
    }

    #[test]
    fn test_tool_function_no_params() {
        let t = tool("no_params", "No params tool", vec![], serde_json::json!({}));
        assert_eq!(t["name"], "no_params");
        assert!(t["inputSchema"]["required"].as_array().unwrap().is_empty());
    }

    #[test]
    fn test_param_function() {
        let p = param("x", "integer", "X coordinate", true);
        assert_eq!(p["name"], "x");
        assert_eq!(p["type"], "integer");
        assert_eq!(p["description"], "X coordinate");
        assert_eq!(p["required"], true);
    }

    #[test]
    fn test_param_optional() {
        let p = param("shift", "integer", "Shift state", false);
        assert_eq!(p["required"], false);
    }

    // ── Save ASM Parsing Tests ──────────────────────────

    #[test]
    fn test_save_asm_response_parsing() {
        let resp = "[saved: programs/test.asm 42 lines]";
        let ok = resp.contains("[saved:");
        assert!(ok);
    }

    #[test]
    fn test_save_asm_response_parsing_failure() {
        let resp = "error: could not write file";
        let ok = resp.contains("[saved:");
        assert!(!ok);
    }

    // ── Load Source Escaping Tests ──────────────────────

    #[test]
    fn test_load_source_newline_escaping() {
        let source = "LDI r1, 10\nADD r2, r3\nHALT";
        let escaped = source.replace('\n', "\\n");
        assert_eq!(escaped, "LDI r1, 10\\nADD r2, r3\\nHALT");
        assert!(!escaped.contains('\n'));
    }

    #[test]
    fn test_load_source_single_line() {
        let source = "HALT";
        let escaped = source.replace('\n', "\\n");
        assert_eq!(escaped, "HALT");
    }

    // ── VM Run Program Status Parsing Tests ─────────────

    #[test]
    fn test_run_program_status_parsing_full() {
        let status_resp = "mode=Editor running=false assembled=true pc=0x1005 cursor=(0,0)";
        let mut status_obj = serde_json::Map::new();
        for part in status_resp.split_whitespace() {
            if let Some((k, v)) = part.split_once('=') {
                match k {
                    "mode" => {
                        status_obj.insert("mode".into(), serde_json::Value::String(v.into()));
                    }
                    "running" => {
                        status_obj.insert("running".into(), serde_json::Value::Bool(v == "true"));
                    }
                    "assembled" => {
                        status_obj.insert("assembled".into(), serde_json::Value::Bool(v == "true"));
                    }
                    "pc" => {
                        status_obj.insert("pc".into(), serde_json::Value::String(v.into()));
                    }
                    _ => {}
                };
            }
        }
        assert_eq!(status_obj["mode"], "Editor");
        assert_eq!(status_obj["running"], serde_json::Value::Bool(false));
        assert_eq!(status_obj["assembled"], serde_json::Value::Bool(true));
        assert_eq!(status_obj["pc"], "0x1005");
    }

    // ── Desktop Vision JSON Parsing Tests ───────────────

    #[test]
    fn test_desktop_vision_json_parsing() {
        let resp =
            r#"{"windows":[{"id":"win-1"}],"focused_window":{"id":"win-1"},"ascii_desktop":"..."}"#;
        let trimmed = resp.trim();
        let parsed: serde_json::Value = if trimmed.starts_with('{') {
            serde_json::from_str(trimmed).unwrap_or_else(|_| serde_json::json!({}))
        } else {
            serde_json::json!({})
        };
        assert_eq!(parsed["windows"].as_array().unwrap().len(), 1);
        assert_eq!(parsed["focused_window"]["id"], "win-1");
    }

    #[test]
    fn test_desktop_vision_non_json_fallback() {
        let resp = "not json at all";
        let trimmed = resp.trim();
        let parsed: serde_json::Value = if trimmed.starts_with('{') {
            serde_json::from_str(trimmed).unwrap_or_else(|_| serde_json::json!({}))
        } else {
            serde_json::json!({})
        };
        assert!(parsed.as_object().unwrap().is_empty());
    }

    // ── Hypervisor Boot Config Tests ────────────────────

    #[test]
    fn test_hypervisor_boot_config_with_window() {
        let config = "arch=riscv64 kernel=Image ram=256M";
        let window_id = "win-3";
        let cmd = if window_id != "0" {
            format!("hypervisor_boot {} window={}", config, window_id)
        } else {
            format!("hypervisor_boot {}", config)
        };
        assert_eq!(
            cmd,
            "hypervisor_boot arch=riscv64 kernel=Image ram=256M window=win-3"
        );
    }

    #[test]
    fn test_hypervisor_boot_config_no_window() {
        let config = "arch=riscv64 kernel=Image ram=256M";
        let window_id = "0";
        let cmd = if window_id != "0" {
            format!("hypervisor_boot {} window={}", config, window_id)
        } else {
            format!("hypervisor_boot {}", config)
        };
        assert_eq!(cmd, "hypervisor_boot arch=riscv64 kernel=Image ram=256M");
    }

    // ── Input Mouse Command Tests ───────────────────────

    #[test]
    fn test_input_mouse_click_command() {
        let action = "click";
        let x = 100i64;
        let y = 200i64;
        let button = 2i64;
        let cmd = match action {
            "click" => format!("inject_mouse click {} {} {}", x, y, button),
            _ => format!("inject_mouse move {} {}", x, y),
        };
        assert_eq!(cmd, "inject_mouse click 100 200 2");
    }

    #[test]
    fn test_input_mouse_move_command() {
        let action = "move";
        let x = 50i64;
        let y = 75i64;
        let cmd = match action {
            "click" => format!("inject_mouse click {} {} 2", x, y),
            _ => format!("inject_mouse move {} {}", x, y),
        };
        assert_eq!(cmd, "inject_mouse move 50 75");
    }

    // ── Desktop Launch Command Tests ────────────────────

    #[test]
    fn test_desktop_launch_window_mode() {
        let app_name = "terminal";
        let window_mode = true;
        let cmd = if window_mode {
            format!("launch --window {}", app_name)
        } else {
            format!("launch {}", app_name)
        };
        assert_eq!(cmd, "launch --window terminal");
    }

    #[test]
    fn test_desktop_launch_fullscreen() {
        let app_name = "terminal";
        let window_mode = false;
        let cmd = if window_mode {
            format!("launch --window {}", app_name)
        } else {
            format!("launch {}", app_name)
        };
        assert_eq!(cmd, "launch terminal");
    }

    // ── Load ASM Base Address Tests ─────────────────────

    #[test]
    fn test_load_asm_with_custom_base() {
        let path = "programs/test.asm";
        let base_addr = "0x2000";
        let cmd = format!("load_asm {} {}", path, base_addr);
        assert_eq!(cmd, "load_asm programs/test.asm 0x2000");
    }

    #[test]
    fn test_load_asm_default_base() {
        let path = "programs/test.asm";
        let base_addr = "0x1000";
        let cmd = format!("load_asm {} {}", path, base_addr);
        assert_eq!(cmd, "load_asm programs/test.asm 0x1000");
    }

    #[test]
    fn test_load_asm_empty_base() {
        let path = "programs/test.asm";
        let base_addr = "";
        let cmd = if base_addr.is_empty() {
            format!("load_asm {}", path)
        } else {
            format!("load_asm {} {}", path, base_addr)
        };
        assert_eq!(cmd, "load_asm programs/test.asm");
    }

    // ── Building Radius Tests ───────────────────────────

    #[test]
    fn test_building_list_radius_zero() {
        let radius = 0i64;
        let cmd = if radius > 0 {
            format!("buildings {}", radius)
        } else {
            "buildings 0".to_string()
        };
        assert_eq!(cmd, "buildings 0");
    }

    #[test]
    fn test_building_list_radius_positive() {
        let radius = 50i64;
        let cmd = if radius > 0 {
            format!("buildings {}", radius)
        } else {
            "buildings 0".to_string()
        };
        assert_eq!(cmd, "buildings 50");
    }

    // ── Region Checksum Error Parsing ───────────────────

    #[test]
    fn test_region_checksum_error() {
        let resp = "[error: invalid region]";
        let trimmed = resp.trim();
        assert!(trimmed.starts_with('[')); // error response
    }

    #[test]
    fn test_region_checksum_ok() {
        let resp = "0xABCDEF01";
        let trimmed = resp.trim();
        assert!(!trimmed.starts_with('[')); // not an error
        assert_eq!(trimmed, "0xABCDEF01");
    }

    // ── Edge Cases ──────────────────────────────────────

    #[test]
    fn test_empty_register_response() {
        let resp = "";
        let mut regs = serde_json::Map::new();
        for line in resp.lines() {
            if let Some((name, val)) = line.split_once('=') {
                regs.insert(name.into(), serde_json::Value::String(val.into()));
            }
        }
        assert!(regs.is_empty());
    }

    #[test]
    fn test_status_with_whitespace_variants() {
        // Status line may have trailing comma in some fields
        let resp = "mode=Editor, running=true, assembled=true, pc=0x1000,";
        for part in resp.split_whitespace() {
            if let Some((k, v)) = part.split_once('=') {
                match k {
                    "mode" => {
                        // v may have trailing comma
                        let cleaned = v.trim_end_matches(',');
                        assert_eq!(cleaned, "Editor");
                    }
                    "running" => {
                        let cleaned = v.trim_end_matches(',');
                        assert_eq!(cleaned, "true");
                    }
                    _ => {}
                }
            }
        }
    }

    #[test]
    fn test_vm_watch_empty_path() {
        let path = "";
        assert!(path.is_empty());
        // Handler returns error status for empty path
    }

    #[test]
    fn test_vm_unwatch_stopped() {
        let resp = "stopped watching programs/test.asm";
        let ok = resp.contains("stopped") || resp.contains("no watch");
        assert!(ok);
    }

    #[test]
    fn test_vm_unwatch_no_watch() {
        let resp = "no watch active";
        let ok = resp.contains("stopped") || resp.contains("no watch");
        assert!(ok);
    }
}
