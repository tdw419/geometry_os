// Geometry OS Workbench -- Phase 16B
//
// Interactive TUI that connects to the daemon's HTTP API and provides
// a live view of VM states, registers, programs, and metrics.
// Keyboard shortcuts to dispatch frames, load programs, step, inspect.
//
// Usage: cargo run --bin workbench [--daemon-url http://localhost:3000]
//
// Requires: ratatui, crossterm, ureq

use crossterm::{
    event::{self, Event, KeyCode, KeyEventKind},
    execute,
    terminal::{disable_raw_mode, enable_raw_mode, EnterAlternateScreen, LeaveAlternateScreen},
};
use ratatui::{prelude::*, widgets::*};
use std::io;
use std::time::{Duration, Instant};

// ureq 3.x: timeout is configured on the Agent, not per-request
fn make_agent() -> ureq::Agent {
    let config = ureq::Agent::config_builder()
        .timeout_global(Some(Duration::from_secs(5)))
        .build();
    config.into()
}

// -- Daemon API types (mirrors daemon.rs) --

#[derive(Debug, Clone, serde::Deserialize)]
struct StatusResponse {
    running: bool,
    vm_states: Vec<VmStatus>,
    programs_loaded: usize,
    uptime_secs: u64,
}

#[derive(Debug, Clone, serde::Deserialize)]
struct VmStatus {
    vm_id: u32,
    state: String,
    pc: u32,
    cycles: u32,
    halted: bool,
    entry_point: u32,
    frame_ptr: u32,
    frame_count: u32,
    regs: [u32; 16],
    base_addr: u32,
    bound_addr: u32,
    jump_log: Vec<FrameTransition>,
    frame_labels: std::collections::HashMap<String, usize>,
}

#[derive(Debug, Clone, serde::Deserialize)]
struct FrameTransition {
    vm_id: u32,
    from_frame: u32,
    to_frame: u32,
    pc_at_transition: u32,
    cause: String,
    dispatch_frame: u32,
}

#[derive(Debug, Clone, serde::Deserialize)]
struct DispatchResponse {
    success: bool,
    frame: u32,
    vm_results: Vec<VmResult>,
}

#[derive(Debug, Clone, serde::Deserialize)]
struct VmResult {
    vm_id: u32,
    halted: bool,
    cycles: u32,
    pc: u32,
}

#[derive(Debug, Clone, serde::Deserialize)]
struct ProgramInfo {
    id: String,
    name: String,
    address: u32,
    address_hex: String,
    pixel_count: usize,
    vm_id: u32,
    is_filmstrip: bool,
    frame_count: u32,
}

#[derive(Debug, Clone, serde::Deserialize)]
struct SubstrateRead {
    address: u32,
    count: u32,
    pixels: Vec<String>,
}

// -- View mode --

#[derive(Debug, Clone, Copy, PartialEq)]
enum ViewMode {
    VmList,
    Programs,
    Memory,
}

// -- Input mode for text entry --

#[derive(Debug, Clone, Copy, PartialEq)]
enum InputMode {
    Normal,
    LoadFile,
    MemoryAddr,
}

impl std::fmt::Display for InputMode {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            InputMode::Normal => write!(f, "NORMAL"),
            InputMode::LoadFile => write!(f, "LOAD"),
            InputMode::MemoryAddr => write!(f, "MEM"),
        }
    }
}

// -- App state --

struct App {
    daemon_url: String,
    agent: ureq::Agent,
    connected: bool,
    last_error: Option<String>,
    status: Option<StatusResponse>,
    programs: Vec<ProgramInfo>,
    selected_vm: usize,
    view_mode: ViewMode,
    input_mode: InputMode,
    input_buffer: String,
    auto_dispatch: bool,
    last_dispatch_frame: u32,
    dispatch_count: u32,
    last_poll: Instant,
    poll_interval: Duration,
    show_help: bool,
    frame_log: Vec<String>,
    // Memory viewer
    memory_addr: u32,
    memory_data: Vec<String>,
    // Programs list scroll
    program_scroll: usize,
}

impl App {
    fn new(daemon_url: String) -> Self {
        Self {
            daemon_url,
            agent: make_agent(),
            connected: false,
            last_error: None,
            status: None,
            programs: Vec::new(),
            selected_vm: 0,
            view_mode: ViewMode::VmList,
            input_mode: InputMode::Normal,
            input_buffer: String::new(),
            auto_dispatch: false,
            last_dispatch_frame: 0,
            dispatch_count: 0,
            last_poll: Instant::now() - Duration::from_secs(10),
            poll_interval: Duration::from_millis(500),
            show_help: false,
            frame_log: Vec::new(),
            memory_addr: 0,
            memory_data: Vec::new(),
            program_scroll: 0,
        }
    }

    fn api_url(&self, path: &str) -> String {
        format!("{}{}", self.daemon_url, path)
    }

    fn poll_status(&mut self) {
        if self.last_poll.elapsed() < self.poll_interval {
            return;
        }
        self.last_poll = Instant::now();

        match self.agent.get(&self.api_url("/api/v1/status"))
            
            .call()
        {
            Ok(resp) => match resp.into_body().read_json::<StatusResponse>() {
                Ok(status) => {
                    self.connected = true;
                    self.last_error = None;
                    self.status = Some(status);
                }
                Err(e) => {
                    self.connected = false;
                    self.last_error = Some(format!("Parse error: {}", e));
                }
            },
            Err(e) => {
                self.connected = false;
                self.last_error = Some(format!("Connection: {}", e));
            }
        }
    }

    fn fetch_programs(&mut self) {
        match self.agent.get(&self.api_url("/api/v1/programs"))
            
            .call()
        {
            Ok(resp) => {
                if let Ok(progs) = resp.into_body().read_json::<Vec<ProgramInfo>>() {
                    self.programs = progs;
                }
            }
            Err(_) => {}
        }
    }

    fn fetch_memory(&mut self, addr: u32, count: u32) {
        let url = self.api_url(&format!("/api/v1/substrate/{:#X}/{}", addr, count));
        match self.agent.get(&url).call() {
            Ok(resp) => {
                if let Ok(read) = resp.into_body().read_json::<SubstrateRead>() {
                    self.memory_addr = read.address;
                    self.memory_data = read.pixels;
                }
            }
            Err(e) => {
                self.frame_log
                    .push(format!("Memory read error: {}", e));
            }
        }
    }

    fn dispatch_frame(&mut self) {
        match self.agent.post(&self.api_url("/api/v1/dispatch")).content_type("application/json")
            .send(&[] as &[u8])
        {
            Ok(resp) => {
                if let Ok(dispatch) = resp.into_body().read_json::<DispatchResponse>() {
                    self.last_dispatch_frame = dispatch.frame;
                    self.dispatch_count += 1;
                    let mut halted = Vec::new();
                    for vm in &dispatch.vm_results {
                        if vm.halted {
                            halted.push(vm.vm_id);
                        }
                    }
                    if halted.is_empty() {
                        self.frame_log
                            .push(format!("Frame {} OK", dispatch.frame));
                    } else {
                        self.frame_log.push(format!(
                            "Frame {} -- halted: {:?}",
                            dispatch.frame, halted
                        ));
                    }
                    if self.frame_log.len() > 50 {
                        self.frame_log.drain(..self.frame_log.len() - 50);
                    }
                }
            }
            Err(e) => {
                self.frame_log
                    .push(format!("Dispatch error: {}", e));
            }
        }
        // Immediately re-poll status after dispatch
        self.last_poll = Instant::now() - Duration::from_secs(10);
    }

    fn load_gasm_file(&mut self, path: &str) {
        let source = match std::fs::read_to_string(path) {
            Ok(s) => s,
            Err(e) => {
                self.frame_log
                    .push(format!("File read error: {}", e));
                return;
            }
        };

        let body = serde_json::json!({
            "gasm": source,
            "name": path
        });

        match self.agent.post(&self.api_url("/api/v1/hot-load"))
            
            .content_type("application/json")
            .send_json(&body)
        {
            Ok(resp) => {
                if let Ok(val) = resp.into_body().read_json::<serde_json::Value>() {
                    let addr = val.get("address").and_then(|v| v.as_u64()).unwrap_or(0);
                    let vm_id = val.get("vm_id").and_then(|v| v.as_u64()).unwrap_or(0);
                    let pixels = val
                        .get("pixel_count")
                        .and_then(|v| v.as_u64())
                        .unwrap_or(0);
                    self.frame_log.push(format!(
                        "Loaded {} @ 0x{:08X} VM{} ({} px)",
                        path, addr, vm_id, pixels
                    ));
                }
            }
            Err(e) => {
                self.frame_log
                    .push(format!("Load error: {}", e));
            }
        }
        self.last_poll = Instant::now() - Duration::from_secs(10);
    }

    fn kill_vm(&mut self, vm_id: u32) {
        let url = self.api_url(&format!("/api/v1/vm/{}/kill", vm_id));
        match self.agent.post(&url).send(&[] as &[u8]) {
            Ok(resp) => {
                if let Ok(val) = resp.into_body().read_json::<serde_json::Value>() {
                    let msg = val
                        .get("message")
                        .and_then(|v| v.as_str())
                        .unwrap_or("done");
                    self.frame_log
                        .push(format!("Kill VM{}: {}", vm_id, msg));
                }
            }
            Err(e) => {
                self.frame_log
                    .push(format!("Kill error: {}", e));
            }
        }
        self.last_poll = Instant::now() - Duration::from_secs(10);
    }

    fn reset_vm(&mut self, vm_id: u32) {
        let url = self.api_url(&format!("/api/v1/vm/{}/reset", vm_id));
        match self.agent.post(&url).send(&[] as &[u8]) {
            Ok(resp) => {
                if let Ok(val) = resp.into_body().read_json::<serde_json::Value>() {
                    let msg = val
                        .get("message")
                        .and_then(|v| v.as_str())
                        .unwrap_or("done");
                    self.frame_log
                        .push(format!("Reset VM{}: {}", vm_id, msg));
                }
            }
            Err(e) => {
                self.frame_log
                    .push(format!("Reset error: {}", e));
            }
        }
        self.last_poll = Instant::now() - Duration::from_secs(10);
    }

    fn selected_vm_status(&self) -> Option<&VmStatus> {
        self.status
            .as_ref()
            .and_then(|s| s.vm_states.get(self.selected_vm))
    }

    fn start_input(&mut self, mode: InputMode) {
        self.input_mode = mode;
        self.input_buffer.clear();
    }

    fn submit_input(&mut self) {
        let input = self.input_buffer.clone();
        match self.input_mode {
            InputMode::LoadFile => {
                if !input.is_empty() {
                    self.frame_log
                        .push(format!("Loading {}...", input));
                    self.load_gasm_file(&input);
                }
            }
            InputMode::MemoryAddr => {
                let addr = if input.starts_with("0x") || input.starts_with("0X") {
                    u32::from_str_radix(input.trim_start_matches("0x").trim_start_matches("0X"), 16)
                        .unwrap_or(0)
                } else {
                    input.parse::<u32>().unwrap_or(0)
                };
                self.memory_addr = addr;
                self.fetch_memory(addr, 64);
                self.view_mode = ViewMode::Memory;
            }
            InputMode::Normal => {}
        }
        self.input_mode = InputMode::Normal;
        self.input_buffer.clear();
    }

    fn cancel_input(&mut self) {
        self.input_mode = InputMode::Normal;
        self.input_buffer.clear();
    }

    fn auto_fetch_memory(&mut self) {
        // If we're on the memory view and have a selected VM with a region,
        // fetch memory around the VM's base address
        if self.view_mode == ViewMode::Memory {
            let addr = if self.memory_addr != 0 {
                self.memory_addr
            } else if let Some(vm) = self.selected_vm_status() {
                if vm.base_addr != vm.bound_addr {
                    vm.base_addr
                } else {
                    return;
                }
            } else {
                return;
            };
            self.fetch_memory(addr, 64);
        }
    }
}

// -- UI rendering --

fn render(app: &mut App, frame: &mut Frame) {
    let size = frame.area();

    // Main layout: top bar | body | bottom bar
    let chunks = Layout::default()
        .direction(Direction::Vertical)
        .constraints([
            Constraint::Length(3), // top bar
            Constraint::Min(10),   // body
            Constraint::Length(3), // bottom bar
        ])
        .split(size);

    render_top_bar(app, frame, chunks[0]);

    if app.show_help {
        render_help(app, frame, chunks[1]);
    } else {
        render_body(app, frame, chunks[1]);
    }

    render_bottom_bar(app, frame, chunks[2]);
}

fn render_top_bar(app: &App, frame: &mut Frame, area: Rect) {
    let conn_status = if app.connected {
        Span::styled(
            " ● CONNECTED ",
            Style::default()
                .fg(Color::Green)
                .add_modifier(Modifier::BOLD),
        )
    } else {
        Span::styled(
            " ● DISCONNECTED ",
            Style::default()
                .fg(Color::Red)
                .add_modifier(Modifier::BOLD),
        )
    };

    let uptime = app.status.as_ref().map(|s| s.uptime_secs).unwrap_or(0);
    let uptime_str = if uptime >= 3600 {
        format!("{:.0}h{:.0}m", uptime / 3600, (uptime % 3600) / 60)
    } else if uptime >= 60 {
        format!("{:.0}m{:.0}s", uptime / 60, uptime % 60)
    } else {
        format!("{}s", uptime)
    };

    let programs = app
        .status
        .as_ref()
        .map(|s| s.programs_loaded)
        .unwrap_or(0);

    let view_name = match app.view_mode {
        ViewMode::VmList => "VMs",
        ViewMode::Programs => "PROGRAMS",
        ViewMode::Memory => "MEMORY",
    };

    let title = Line::from(vec![
        Span::styled(
            " GEOMETRY OS WORKBENCH ",
            Style::default()
                .fg(Color::Cyan)
                .add_modifier(Modifier::BOLD),
        ),
        conn_status,
        Span::raw(format!(
            "  View:{} Uptime:{} Progs:{} Dispatches:{} Frame:{}",
            view_name,
            uptime_str,
            programs,
            app.dispatch_count,
            app.last_dispatch_frame
        )),
    ]);

    let paragraph = Paragraph::new(title)
        .style(Style::default().fg(Color::White))
        .block(
            Block::default()
                .borders(Borders::ALL)
                .border_style(Style::default().fg(Color::DarkGray)),
        );

    frame.render_widget(paragraph, area);
}

fn render_body(app: &mut App, frame: &mut Frame, area: Rect) {
    match app.view_mode {
        ViewMode::VmList => render_vm_body(app, frame, area),
        ViewMode::Programs => render_programs_body(app, frame, area),
        ViewMode::Memory => render_memory_body(app, frame, area),
    }
}

fn render_vm_body(app: &mut App, frame: &mut Frame, area: Rect) {
    // Split body: left (VM list) | right (detail)
    let body = Layout::default()
        .direction(Direction::Horizontal)
        .constraints([Constraint::Percentage(55), Constraint::Percentage(45)])
        .split(area);

    render_vm_list(app, frame, body[0]);
    render_vm_detail(app, frame, body[1]);
}

fn render_programs_body(app: &mut App, frame: &mut Frame, area: Rect) {
    // Split: left (programs list) | right (dispatch log)
    let body = Layout::default()
        .direction(Direction::Horizontal)
        .constraints([Constraint::Percentage(60), Constraint::Percentage(40)])
        .split(area);

    render_programs_list(app, frame, body[0]);
    render_logs(app, frame, body[1]);
}

fn render_memory_body(app: &mut App, frame: &mut Frame, area: Rect) {
    // Split: left (hex dump) | right (VM summary + log)
    let body = Layout::default()
        .direction(Direction::Horizontal)
        .constraints([Constraint::Percentage(65), Constraint::Percentage(35)])
        .split(area);

    render_memory_hex(app, frame, body[0]);

    // Right side: mini VM detail + dispatch log
    let right = Layout::default()
        .direction(Direction::Vertical)
        .constraints([Constraint::Percentage(40), Constraint::Percentage(60)])
        .split(body[1]);

    render_registers_compact(app, frame, right[0]);
    render_logs(app, frame, right[1]);
}

fn render_vm_list(app: &App, frame: &mut Frame, area: Rect) {
    let vm_count = app
        .status
        .as_ref()
        .map(|s| s.vm_states.len())
        .unwrap_or(8);

    let header = Row::new(vec![
        Cell::from("ID").style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("State")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("PC")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("Cycles")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("Frame")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("Addr Range")
            .style(Style::default().add_modifier(Modifier::BOLD)),
    ])
    .style(Style::default().fg(Color::Yellow));

    let mut rows: Vec<Row> = Vec::new();

    for i in 0..vm_count {
        let vm = app.status.as_ref().and_then(|s| s.vm_states.get(i));
        let is_selected = i == app.selected_vm;

        let (state_str, state_color) = if let Some(vm) = vm {
            match vm.state.as_str() {
                "running" => ("RUN", Color::Green),
                "halted" => ("HLT", Color::Red),
                "waiting" => ("WAIT", Color::Yellow),
                "yielded" => ("YLD", Color::Magenta),
                "fault" => ("FAULT", Color::Red),
                _ => ("IDLE", Color::DarkGray),
            }
        } else {
            ("IDLE", Color::DarkGray)
        };

        let row = if let Some(vm) = vm {
            let frame_info = if vm.frame_count > 0 {
                format!("{}/{}", vm.frame_ptr, vm.frame_count)
            } else {
                "-".to_string()
            };
            let addr_range = if vm.base_addr != vm.bound_addr {
                format!("{:#X}..{:#X}", vm.base_addr, vm.bound_addr)
            } else {
                "-".to_string()
            };
            Row::new(vec![
                Cell::from(format!("{}", vm.vm_id)),
                Cell::from(state_str.to_string()).style(Style::default().fg(state_color)),
                Cell::from(format!("{:#010X}", vm.pc)),
                Cell::from(format!("{}", vm.cycles)),
                Cell::from(frame_info),
                Cell::from(addr_range),
            ])
        } else {
            Row::new(vec![
                Cell::from(format!("{}", i)),
                Cell::from("IDLE").style(Style::default().fg(Color::DarkGray)),
                Cell::from("        -"),
                Cell::from("-"),
                Cell::from("-"),
                Cell::from("-"),
            ])
        };

        let row_style = if is_selected {
            Style::default()
                .bg(Color::DarkGray)
                .add_modifier(Modifier::BOLD)
        } else {
            Style::default()
        };

        rows.push(row.style(row_style));
    }

    let table = Table::new(
        rows,
        &[
            Constraint::Length(3),
            Constraint::Length(6),
            Constraint::Length(14),
            Constraint::Length(10),
            Constraint::Length(8),
            Constraint::Length(20),
        ],
    )
    .header(header)
    .block(
        Block::default()
            .borders(Borders::ALL)
            .title(" VM States (1-8 select, x kill, R reset) ")
            .border_style(Style::default().fg(Color::Cyan)),
    )
    .row_highlight_style(Style::default().add_modifier(Modifier::REVERSED));

    frame.render_widget(table, area);
}

fn render_vm_detail(app: &App, frame: &mut Frame, area: Rect) {
    // Split detail into top (registers) and bottom (jump log + frame log)
    let detail_chunks = Layout::default()
        .direction(Direction::Vertical)
        .constraints([
            Constraint::Percentage(45), // registers
            Constraint::Percentage(55), // jump log + frame log
        ])
        .split(area);

    render_registers(app, frame, detail_chunks[0]);
    render_logs(app, frame, detail_chunks[1]);
}

fn render_registers(app: &App, frame: &mut Frame, area: Rect) {
    let vm = app.selected_vm_status();

    let lines = if let Some(vm) = vm {
        let mut lines = Vec::new();

        // Header line
        lines.push(Line::from(vec![
            Span::styled(
                format!(" VM {} ", vm.vm_id),
                Style::default()
                    .fg(Color::Cyan)
                    .add_modifier(Modifier::BOLD),
            ),
            Span::styled(
                format!("[{}] ", vm.state),
                Style::default().fg(match vm.state.as_str() {
                    "running" => Color::Green,
                    "halted" => Color::Red,
                    "waiting" => Color::Yellow,
                    _ => Color::White,
                }),
            ),
            Span::raw(format!(
                "Entry: {:#X}  PC: {:#X}  Cycles: {}",
                vm.entry_point, vm.pc, vm.cycles
            )),
        ]));

        if vm.frame_count > 0 {
            lines.push(Line::from(format!(
                " Film strip: frame {}/{}  Labels: {}",
                vm.frame_ptr,
                vm.frame_count,
                vm.frame_labels.len()
            )));
        }

        lines.push(Line::from(""));

        // Registers in 2 columns (r0-r7, r8-r15)
        for row in 0..8 {
            let r_lo = vm.regs[row];
            let r_hi = vm.regs[row + 8];
            lines.push(Line::from(format!(
                "  r{:02} = {:#010X} ({:>10})  |  r{:02} = {:#10X} ({:>10})",
                row, r_lo, r_lo, row + 8, r_hi, r_hi,
            )));
        }

        lines.push(Line::from(""));
        lines.push(Line::from(format!(
            "  Region: {:#X}..{:#X}  Halted: {}",
            vm.base_addr, vm.bound_addr, vm.halted
        )));

        // Show recent frame labels
        if !vm.frame_labels.is_empty() {
            let labels: Vec<String> = vm
                .frame_labels
                .iter()
                .map(|(k, v)| format!("{}:{}", k, v))
                .take(8)
                .collect();
            lines.push(Line::from(format!("  Labels: {}", labels.join(", "))));
        }

        lines
    } else {
        vec![
            Line::from(" No VM selected"),
            Line::from(" Press 1-8 to select a VM"),
        ]
    };

    let paragraph = Paragraph::new(lines).block(
        Block::default()
            .borders(Borders::ALL)
            .title(format!(" VM {} Detail ", app.selected_vm))
            .border_style(Style::default().fg(Color::Cyan)),
    );

    frame.render_widget(paragraph, area);
}

fn render_registers_compact(app: &App, frame: &mut Frame, area: Rect) {
    let vm = app.selected_vm_status();

    let lines = if let Some(vm) = vm {
        let mut lines = Vec::new();
        lines.push(Line::from(format!(
            " VM{} [{}] PC:{:#X} Cyc:{}",
            vm.vm_id, vm.state, vm.pc, vm.cycles
        )));
        // Show first 8 registers only
        for row in 0..4 {
            let r1 = vm.regs[row * 2];
            let r2 = vm.regs[row * 2 + 1];
            lines.push(Line::from(format!(
                "  r{:02}={:#08X} r{:02}={:#08X}",
                row * 2, r1, row * 2 + 1, r2
            )));
        }
        lines
    } else {
        vec![Line::from(" No VM selected")]
    };

    let paragraph = Paragraph::new(lines).block(
        Block::default()
            .borders(Borders::ALL)
            .title(" VM Summary ")
            .border_style(Style::default().fg(Color::DarkGray)),
    );
    frame.render_widget(paragraph, area);
}

fn render_programs_list(app: &App, frame: &mut Frame, area: Rect) {
    let header = Row::new(vec![
        Cell::from("ID")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("Name")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("Address")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("VM")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("Pixels")
            .style(Style::default().add_modifier(Modifier::BOLD)),
        Cell::from("Type")
            .style(Style::default().add_modifier(Modifier::BOLD)),
    ])
    .style(Style::default().fg(Color::Yellow));

    let rows: Vec<Row> = app
        .programs
        .iter()
        .skip(app.program_scroll)
        .take(20)
        .map(|p| {
            let ptype = if p.is_filmstrip {
                format!("film({})", p.frame_count)
            } else {
                "program".to_string()
            };
            Row::new(vec![
                Cell::from(p.id.clone()),
                Cell::from(p.name.clone()),
                Cell::from(p.address_hex.clone()),
                Cell::from(format!("{}", p.vm_id)),
                Cell::from(format!("{}", p.pixel_count)),
                Cell::from(ptype),
            ])
        })
        .collect();

    let total = app.programs.len();
    let table = Table::new(
        rows,
        &[
            Constraint::Length(12),
            Constraint::Length(20),
            Constraint::Length(14),
            Constraint::Length(4),
            Constraint::Length(8),
            Constraint::Length(12),
        ],
    )
    .header(header)
    .block(
        Block::default()
            .borders(Borders::ALL)
            .title(format!(
                " Programs ({}) [pgup/pgdn scroll] ",
                total
            ))
            .border_style(Style::default().fg(Color::Cyan)),
    );

    frame.render_widget(table, area);
}

fn render_memory_hex(app: &App, frame: &mut Frame, area: Rect) {
    let mut lines = Vec::new();

    lines.push(Line::from(format!(
        " Address: {:#010X}  (m to jump, +/- page)",
        app.memory_addr
    )));
    lines.push(Line::from(""));

    // Render hex dump: 8 pixels per row
    let mut offset = 0u32;
    for chunk in app.memory_data.chunks(8) {
        let addr = app.memory_addr + offset;
        let mut hex_parts = Vec::new();
        let mut ascii_parts = Vec::new();
        for val_str in chunk {
            // Parse the hex value
            let val = u32::from_str_radix(
                val_str.trim_start_matches("0x"),
                16,
            )
            .unwrap_or(0);

            hex_parts.push(format!("{:08X}", val));

            // Extract ASCII from each byte of the u32 (little-endian)
            let bytes = val.to_le_bytes();
            for &b in &bytes {
                let ch = if b >= 0x20 && b < 0x7F {
                    b as char
                } else {
                    '.'
                };
                ascii_parts.push(ch);
            }
        }

        let hex_line = hex_parts.join(" ");
        let ascii_line: String = ascii_parts.into_iter().collect();
        lines.push(Line::from(format!(
            "  {:08X}: {}  |{}|",
            addr, hex_line, ascii_line
        )));
        offset += chunk.len() as u32;
    }

    if app.memory_data.is_empty() {
        lines.push(Line::from(""));
        lines.push(Line::from("  No memory data loaded."));
        lines.push(Line::from("  Press m to enter address."));
    }

    let paragraph = Paragraph::new(lines).block(
        Block::default()
            .borders(Borders::ALL)
            .title(" Memory Viewer (64 words) ")
            .border_style(Style::default().fg(Color::Cyan)),
    );

    frame.render_widget(paragraph, area);
}

fn render_logs(app: &App, frame: &mut Frame, area: Rect) {
    // Split into jump log (top) and dispatch log (bottom)
    let log_chunks = Layout::default()
        .direction(Direction::Vertical)
        .constraints([
            Constraint::Percentage(50),
            Constraint::Percentage(50),
        ])
        .split(area);

    // Jump log for selected VM
    let vm = app.selected_vm_status();
    let jump_lines: Vec<Line> = if let Some(vm) = vm {
        if vm.jump_log.is_empty() {
            vec![Line::from(" No frame transitions recorded")]
        } else {
            vm.jump_log
                .iter()
                .rev()
                .take(10)
                .map(|t| {
                    let cause_icon = match t.cause.as_str() {
                        "auto_advance" => "loop",
                        "frame_opcode" => "->",
                        _ => "?",
                    };
                    Line::from(format!(
                        " F{} {} F{}@PC:{:#X} (tick {})",
                        t.from_frame, cause_icon, t.to_frame, t.pc_at_transition, t.dispatch_frame
                    ))
                })
                .collect()
        }
    } else {
        vec![Line::from(" -")]
    };

    let jump_widget = Paragraph::new(jump_lines).block(
        Block::default()
            .borders(Borders::ALL)
            .title(" Frame Transitions ")
            .border_style(Style::default().fg(Color::DarkGray)),
    );

    frame.render_widget(jump_widget, log_chunks[0]);

    // Dispatch log
    let log_lines: Vec<Line> = if app.frame_log.is_empty() {
        vec![Line::from(" No dispatches yet")]
    } else {
        app.frame_log
            .iter()
            .rev()
            .take(10)
            .map(|msg| Line::from(format!(" {}", msg)))
            .collect()
    };

    let log_widget = Paragraph::new(log_lines).block(
        Block::default()
            .borders(Borders::ALL)
            .title(" Dispatch Log ")
            .border_style(Style::default().fg(Color::DarkGray)),
    );

    frame.render_widget(log_widget, log_chunks[1]);
}

fn render_help(app: &App, frame: &mut Frame, area: Rect) {
    let help_text = vec![
        Line::from(""),
        Line::from(Span::styled(
            "  GEOMETRY OS WORKBENCH -- KEYBOARD REFERENCE",
            Style::default()
                .fg(Color::Cyan)
                .add_modifier(Modifier::BOLD),
        )),
        Line::from(""),
        Line::from(Span::styled(
            "  Navigation",
            Style::default()
                .fg(Color::Yellow)
                .add_modifier(Modifier::BOLD),
        )),
        Line::from("  Tab        Cycle view: VMs / Programs / Memory"),
        Line::from("  1-8        Select VM to inspect"),
        Line::from("  ?          Toggle this help"),
        Line::from("  q / Esc    Quit"),
        Line::from(""),
        Line::from(Span::styled(
            "  Dispatch",
            Style::default()
                .fg(Color::Yellow)
                .add_modifier(Modifier::BOLD),
        )),
        Line::from("  d          Dispatch one frame (step)"),
        Line::from("  D          Toggle auto-dispatch (continuous)"),
        Line::from(""),
        Line::from(Span::styled(
            "  VM Control",
            Style::default()
                .fg(Color::Yellow)
                .add_modifier(Modifier::BOLD),
        )),
        Line::from("  x          Kill (deactivate) selected VM"),
        Line::from("  R          Reset selected VM to entry point"),
        Line::from(""),
        Line::from(Span::styled(
            "  Programs",
            Style::default()
                .fg(Color::Yellow)
                .add_modifier(Modifier::BOLD),
        )),
        Line::from("  l          Load .gasm file (type path)"),
        Line::from("  p          Refresh program list"),
        Line::from("  PgUp/PgDn  Scroll program list"),
        Line::from(""),
        Line::from(Span::styled(
            "  Memory",
            Style::default()
                .fg(Color::Yellow)
                .add_modifier(Modifier::BOLD),
        )),
        Line::from("  m          Jump to memory address (type addr)"),
        Line::from("  +/-        Page memory view forward/backward"),
        Line::from("  r          Refresh status"),
        Line::from(""),
        Line::from(Span::styled(
            "  CONNECTING",
            Style::default().fg(Color::Yellow),
        )),
        Line::from(format!("  Daemon URL: {}", app.daemon_url)),
        Line::from("  Start daemon: cargo run --bin daemon"),
    ];

    let paragraph = Paragraph::new(help_text).block(
        Block::default()
            .borders(Borders::ALL)
            .title(" Help (? to close) ")
            .border_style(Style::default().fg(Color::Yellow)),
    );

    frame.render_widget(paragraph, area);
}

fn render_bottom_bar(app: &App, frame: &mut Frame, area: Rect) {
    let auto_str = if app.auto_dispatch {
        Span::styled(
            " AUTO-DISPATCH ON ",
            Style::default()
                .fg(Color::Black)
                .bg(Color::Green)
                .add_modifier(Modifier::BOLD),
        )
    } else {
        Span::raw(" auto:off ")
    };

    // Input mode indicator
    let mode_str = if app.input_mode != InputMode::Normal {
        Span::styled(
            format!(" [{}] {}_ ", app.input_mode, app.input_buffer),
            Style::default()
                .fg(Color::Black)
                .bg(Color::Yellow)
                .add_modifier(Modifier::BOLD),
        )
    } else {
        Span::raw("")
    };

    let error_span = if let Some(ref e) = app.last_error {
        Span::styled(format!(" ERR: {} ", e), Style::default().fg(Color::Red))
    } else {
        Span::raw("")
    };

    let help_line = Line::from(vec![
        auto_str,
        mode_str,
        Span::raw("  "),
        error_span,
        Span::raw("  "),
        Span::styled("Tab", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("view  "),
        Span::styled("d", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("step  "),
        Span::styled("D", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("auto  "),
        Span::styled("l", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("load  "),
        Span::styled("m", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("mem  "),
        Span::styled("x", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("kill  "),
        Span::styled("?", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("help  "),
        Span::styled("q", Style::default().add_modifier(Modifier::BOLD)),
        Span::raw("quit"),
    ]);

    let paragraph = Paragraph::new(help_line)
        .style(Style::default().fg(Color::White))
        .block(
            Block::default()
                .borders(Borders::ALL)
                .border_style(Style::default().fg(Color::DarkGray)),
        );

    frame.render_widget(paragraph, area);
}

// -- Main loop --

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Parse daemon URL from args
    let args: Vec<String> = std::env::args().collect();
    let daemon_url = if let Some(pos) = args.iter().position(|a| a == "--daemon-url") {
        args.get(pos + 1)
            .cloned()
            .unwrap_or_else(|| "http://localhost:3000".into())
    } else if let Some(pos) = args.iter().position(|a| a == "--port") {
        let port = args
            .get(pos + 1)
            .cloned()
            .unwrap_or_else(|| "3000".into());
        format!("http://localhost:{}", port)
    } else {
        "http://localhost:3000".into()
    };

    // Setup terminal
    enable_raw_mode()?;
    let mut stdout = io::stdout();
    execute!(stdout, EnterAlternateScreen)?;
    let backend = CrosstermBackend::new(stdout);
    let mut terminal = Terminal::new(backend)?;

    let mut app = App::new(daemon_url);

    // Initial poll
    app.poll_status();
    app.fetch_programs();

    let tick_rate = Duration::from_millis(100);
    let mut last_auto_dispatch = Instant::now();
    let mut last_memory_fetch = Instant::now();

    loop {
        // Poll daemon status
        app.poll_status();

        // Auto-dispatch if enabled
        if app.auto_dispatch && app.connected
            && last_auto_dispatch.elapsed() > Duration::from_millis(200)
        {
            app.dispatch_frame();
            last_auto_dispatch = Instant::now();
        }

        // Refresh memory view periodically
        if app.view_mode == ViewMode::Memory
            && last_memory_fetch.elapsed() > Duration::from_secs(2)
        {
            app.auto_fetch_memory();
            last_memory_fetch = Instant::now();
        }

        // Render
        terminal.draw(|f| render(&mut app, f))?;

        // Handle input
        if event::poll(tick_rate)? {
            if let Event::Key(key) = event::read()? {
                if key.kind != KeyEventKind::Press {
                    continue;
                }

                // If in input mode, handle text entry first
                if app.input_mode != InputMode::Normal {
                    match key.code {
                        KeyCode::Enter => {
                            app.submit_input();
                        }
                        KeyCode::Esc => {
                            app.cancel_input();
                        }
                        KeyCode::Backspace => {
                            app.input_buffer.pop();
                        }
                        KeyCode::Char(c) => {
                            app.input_buffer.push(c);
                        }
                        _ => {}
                    }
                    continue;
                }

                // Normal mode keybindings
                match key.code {
                    KeyCode::Char('q') | KeyCode::Esc => {
                        break;
                    }
                    KeyCode::Char('d') => {
                        if app.connected {
                            app.dispatch_frame();
                        }
                    }
                    KeyCode::Char('D') => {
                        app.auto_dispatch = !app.auto_dispatch;
                        if app.auto_dispatch {
                            last_auto_dispatch = Instant::now();
                        }
                    }
                    KeyCode::Char('1') => app.selected_vm = 0,
                    KeyCode::Char('2') => app.selected_vm = 1,
                    KeyCode::Char('3') => app.selected_vm = 2,
                    KeyCode::Char('4') => app.selected_vm = 3,
                    KeyCode::Char('5') => app.selected_vm = 4,
                    KeyCode::Char('6') => app.selected_vm = 5,
                    KeyCode::Char('7') => app.selected_vm = 6,
                    KeyCode::Char('8') => app.selected_vm = 7,
                    KeyCode::Char('l') => {
                        app.start_input(InputMode::LoadFile);
                    }
                    KeyCode::Char('p') => {
                        app.fetch_programs();
                        if !app.programs.is_empty() {
                            let summary: Vec<String> = app
                                .programs
                                .iter()
                                .take(5)
                                .map(|p| {
                                    format!(
                                        "{} @ {:#X} (VM{})",
                                        p.name, p.address, p.vm_id
                                    )
                                })
                                .collect();
                            for s in summary {
                                app.frame_log.push(s);
                            }
                        } else {
                            app.frame_log
                                .push("No programs loaded".into());
                        }
                    }
                    KeyCode::Char('r') => {
                        app.last_poll =
                            Instant::now() - Duration::from_secs(10);
                        app.poll_status();
                    }
                    KeyCode::Char('x') => {
                        if app.connected {
                            app.kill_vm(app.selected_vm as u32);
                        }
                    }
                    KeyCode::Char('R') => {
                        if app.connected {
                            app.reset_vm(app.selected_vm as u32);
                        }
                    }
                    KeyCode::Char('m') => {
                        app.start_input(InputMode::MemoryAddr);
                    }
                    KeyCode::Char('?') => {
                        app.show_help = !app.show_help;
                    }
                    KeyCode::Tab => {
                        app.view_mode = match app.view_mode {
                            ViewMode::VmList => ViewMode::Programs,
                            ViewMode::Programs => ViewMode::Memory,
                            ViewMode::Memory => ViewMode::VmList,
                        };
                        // Fetch data for the new view
                        match app.view_mode {
                            ViewMode::Programs => {
                                app.fetch_programs();
                            }
                            ViewMode::Memory => {
                                // Auto-load memory from selected VM region
                                if let Some(vm) = app.selected_vm_status() {
                                    if vm.base_addr != vm.bound_addr {
                                        app.memory_addr = vm.base_addr;
                                    }
                                }
                                app.fetch_memory(app.memory_addr, 64);
                                last_memory_fetch = Instant::now();
                            }
                            _ => {}
                        }
                    }
                    KeyCode::Char('+') | KeyCode::PageDown => {
                        if app.view_mode == ViewMode::Memory {
                            app.memory_addr = app.memory_addr.saturating_add(64);
                            app.fetch_memory(app.memory_addr, 64);
                        } else if app.view_mode == ViewMode::Programs {
                            app.program_scroll =
                                (app.program_scroll + 20).min(
                                    app.programs.len().saturating_sub(1),
                                );
                        }
                    }
                    KeyCode::Char('-') | KeyCode::PageUp => {
                        if app.view_mode == ViewMode::Memory {
                            app.memory_addr =
                                app.memory_addr.saturating_sub(64);
                            app.fetch_memory(app.memory_addr, 64);
                        } else if app.view_mode == ViewMode::Programs {
                            app.program_scroll =
                                app.program_scroll.saturating_sub(20);
                        }
                    }
                    _ => {}
                }
            }
        }
    }

    // Restore terminal
    disable_raw_mode()?;
    execute!(terminal.backend_mut(), LeaveAlternateScreen)?;
    terminal.show_cursor()?;

    Ok(())
}
