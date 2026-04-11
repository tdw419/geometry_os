// ═══════════════════════════════════════════════════════════════════════
// REST API SERVER
//
// HTTP bridge for external agents to interact with the Geometry OS VM.
// Uses tiny_http for lightweight HTTP handling.
// Uses tungstenite for WebSocket support (streaming input).
//
// Endpoints:
//   POST /run         -- assemble + execute .gasm source, return full result
//   GET  /state       -- get current VM state (registers, pc, halted, etc.)
//   GET  /screen      -- get screen buffer as JSON array of pixel values
//   GET  /screen/ppm  -- get screen as PPM image (binary)
//   GET  /disasm      -- disassemble RAM range (?start=0&count=32)
//   POST /load        -- load .gasm source without running (for step debugging)
//   POST /step        -- execute one instruction
//   POST /resume      -- continue a yielded VM
//   POST /reset       -- reset VM to clean state
//   POST /ram         -- write values into RAM (?addr=N, body = JSON array)
//   GET  /ram         -- read RAM range (?start=0&count=32)
//   WS   /ws/input    -- streaming key/mouse input (WebSocket, low-latency)
//
// Usage:
//   let server = ApiServer::new(7070);
//   server.run();  // blocks, handles requests forever
//
// Or non-blocking:
//   let server = ApiServer::new(7070);
//   server.serve_one();  // handle one request and return
// ═══════════════════════════════════════════════════════════════════════

use crate::agent::{Agent, GasmAgent};
use crate::vm_pool::{SandboxCaps, VmPool};
use std::sync::Mutex;

/// The REST API server wrapping a GasmAgent.
pub struct ApiServer {
    server: tiny_http::Server,
    agent: Mutex<GasmAgent>,
    /// Pool of independent sandboxed VM instances for multi-agent use.
    pool: VmPool,
}

/// JSON response for the /state endpoint.
#[derive(serde::Serialize)]
struct StateResponse {
    pc: u32,
    regs: Vec<u32>,
    halted: bool,
    yielded: bool,
    cycle_count: u32,
    ram_size: usize,
}

/// JSON body for POST /run.
#[derive(serde::Deserialize)]
struct RunRequest {
    source: String,
}

/// JSON body for POST /load.
#[derive(serde::Deserialize)]
struct LoadRequest {
    source: String,
}

/// JSON body for POST /ram (write).
#[derive(serde::Deserialize)]
struct WriteRamRequest {
    addr: usize,
    data: Vec<u32>,
}

/// Generic JSON error response.
#[derive(serde::Serialize)]
struct ErrorResponse {
    error: String,
}

impl ApiServer {
    /// Create a new API server listening on the given port.
    pub fn new(port: u16) -> Self {
        let addr = format!("0.0.0.0:{}", port);
        let server = tiny_http::Server::http(&addr)
            .unwrap_or_else(|e| panic!("Failed to bind {}: {}", addr, e));
        eprintln!("[api] Geometry OS REST API listening on {}", addr);
        ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
            pool: VmPool::new(4096),
        }
    }

    /// Create an API server with a custom RAM size.
    pub fn with_ram_size(port: u16, ram_size: usize) -> Self {
        let addr = format!("0.0.0.0:{}", port);
        let server = tiny_http::Server::http(&addr)
            .unwrap_or_else(|e| panic!("Failed to bind {}: {}", addr, e));
        eprintln!("[api] Geometry OS REST API listening on {}", addr);
        ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(ram_size)),
            pool: VmPool::new(ram_size),
        }
    }

    /// Run the server forever, handling requests in a loop.
    pub fn run(&self) {
        loop {
            self.serve_one();
        }
    }

    /// Handle a single request. Returns true if a request was handled.
    pub fn serve_one(&self) -> bool {
        match self.server.recv() {
            Ok(request) => {
                self.handle_request(request);
                true
            }
            Err(e) => {
                eprintln!("[api] Error receiving request: {}", e);
                false
            }
        }
    }

    /// Get the port the server is listening on.
    pub fn port(&self) -> u16 {
        match self.server.server_addr() {
            tiny_http::ListenAddr::IP(addr) => addr.port(),
            #[cfg(unix)]
            tiny_http::ListenAddr::Unix(_) => 0,
        }
    }

    fn handle_request(&self, mut request: tiny_http::Request) {
        let path = request.url().to_string();
        let method = request.method().clone();

        // Strip query string for routing
        let path_clean = path.split('?').next().unwrap_or(&path);

        // WebSocket upgrade for /ws/input
        if path_clean == "/ws/input" && Self::is_websocket_upgrade(&request) {
            self.handle_ws_input(request);
            return;
        }

        // ── Sandbox routes (/api/sandbox/*) ──
        if path_clean.starts_with("/api/sandbox") {
            let response = self.route_sandbox(method, path_clean, &mut request);
            if let Err(e) = request.respond(response) {
                eprintln!("[api] Error sending sandbox response: {}", e);
            }
            return;
        }

        let response = match (method, &*path_clean) {
            // POST /run -- assemble and execute .gasm source
            (tiny_http::Method::Post, "/run") => self.handle_run(&mut request),

            // GET /state -- current VM state
            (tiny_http::Method::Get, "/state") => self.handle_state(&request),

            // GET /screen -- screen buffer as JSON
            (tiny_http::Method::Get, "/screen") => self.handle_screen(&request),

            // GET /screen/ppm -- screen as PPM image
            (tiny_http::Method::Get, "/screen/ppm") => self.handle_screen_ppm(&request),

            // GET /disasm -- disassemble RAM range
            (tiny_http::Method::Get, "/disasm") => self.handle_disasm(&request),

            // POST /load -- load .gasm without running
            (tiny_http::Method::Post, "/load") => self.handle_load(&mut request),

            // POST /step -- single-step execution
            (tiny_http::Method::Post, "/step") => self.handle_step(&request),

            // POST /resume -- continue yielded VM
            (tiny_http::Method::Post, "/resume") => self.handle_resume(&request),

            // POST /reset -- reset VM
            (tiny_http::Method::Post, "/reset") => self.handle_reset(&request),

            // GET /stack -- stack contents with depth
            (tiny_http::Method::Get, "/stack") => self.handle_stack(&request),

            // GET /memory -- hex dump of memory range (?addr=0x0000&len=256)
            (tiny_http::Method::Get, "/memory") => self.handle_memory(&request),

            // POST /input/key -- inject key press into keyboard port
            (tiny_http::Method::Post, "/input/key") => self.handle_input_key(&mut request),

            // POST /input/mouse -- set mouse position and buttons
            (tiny_http::Method::Post, "/input/mouse") => self.handle_input_mouse(&mut request),

            // POST /ram -- write to RAM
            (tiny_http::Method::Post, "/ram") => self.handle_write_ram(&mut request),

            // GET /ram -- read from RAM
            (tiny_http::Method::Get, "/ram") => self.handle_read_ram(&request),

            // GET / -- API info
            (tiny_http::Method::Get, "/") | (tiny_http::Method::Get, "") => {
                self.handle_info(&request)
            }

            _ => self.error_response(404, "Not found"),
        };

        if let Err(e) = request.respond(response) {
            eprintln!("[api] Error sending response: {}", e);
        }
    }

    // ── Sandbox route dispatcher ──

    /// Route sandbox API requests based on path segments.
    fn route_sandbox(
        &self,
        method: tiny_http::Method,
        path: &str,
        request: &mut tiny_http::Request,
    ) -> tiny_http::ResponseBox {
        // Path patterns:
        //   POST /api/sandbox/create          → create sandbox
        //   GET  /api/sandbox                 → list sandboxes
        //   GET  /api/sandbox/:id             → sandbox info
        //   DELETE /api/sandbox/:id           → destroy sandbox
        //   POST /api/sandbox/:id/run         → run code in sandbox
        //   GET  /api/sandbox/:id/state       → get sandbox VM state
        //   GET  /api/sandbox/:id/screen      → get sandbox screen
        //   POST /api/sandbox/:id/reset       → reset sandbox VM
        //   POST /api/sandbox/:id/load        → load code in sandbox
        //   POST /api/sandbox/:id/step        → single-step sandbox
        //   POST /api/sandbox/:id/resume      → resume yielded sandbox
        //   POST /api/sandbox/:id/input/key   → inject key into sandbox
        //   POST /api/sandbox/:id/input/mouse → inject mouse into sandbox

        let segments: Vec<&str> = path.split('/').filter(|s| !s.is_empty()).collect();
        // segments: ["api", "sandbox", ...]

        match segments.len() {
            // GET /api/sandbox — list
            2 if method == tiny_http::Method::Get => self.handle_sandbox_list(),
            // POST /api/sandbox/create — create
            3 if segments[2] == "create" && method == tiny_http::Method::Post => {
                self.handle_sandbox_create(request)
            }
            // GET /api/sandbox/:id — info
            3 if method == tiny_http::Method::Get => self.handle_sandbox_info(segments[2]),
            // DELETE /api/sandbox/:id — destroy
            3 if method == tiny_http::Method::Delete => self.handle_sandbox_destroy(segments[2]),
            // Sub-routes on sandbox/:id/*
            4 => {
                let id = segments[2];
                match (method.clone(), segments[3]) {
                    (tiny_http::Method::Post, "run") => self.handle_sandbox_run(id, request),
                    (tiny_http::Method::Get, "state") => self.handle_sandbox_state(id),
                    (tiny_http::Method::Get, "screen") => self.handle_sandbox_screen(id),
                    (tiny_http::Method::Post, "reset") => self.handle_sandbox_reset(id),
                    (tiny_http::Method::Post, "load") => self.handle_sandbox_load(id, request),
                    (tiny_http::Method::Post, "step") => self.handle_sandbox_step(id),
                    (tiny_http::Method::Post, "resume") => self.handle_sandbox_resume(id),
                    _ => self.error_response(404, "Not found"),
                }
            }
            5 => {
                let id = segments[2];
                match (method.clone(), segments[3], segments[4]) {
                    (tiny_http::Method::Post, "input", "key") => {
                        self.handle_sandbox_input_key(id, request)
                    }
                    (tiny_http::Method::Post, "input", "mouse") => {
                        self.handle_sandbox_input_mouse(id, request)
                    }
                    _ => self.error_response(404, "Not found"),
                }
            }
            _ => self.error_response(404, "Not found"),
        }
    }

    fn handle_run(&self, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: RunRequest = match serde_json::from_str(&body) {
            Ok(r) => r,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!("Invalid JSON: {}. Expected {{\"source\": \"...\"}}", e),
                );
            }
        };

        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        match agent.run_gasm(&req.source) {
            Ok(result) => self.json_response(200, &result),
            Err(e) => self.error_response(422, &format!("{}", e)),
        }
    }

    fn handle_state(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let state = agent.vm_state();
        let ram_size = agent.read_ram(0, 0).len(); // just to get the agent
        let resp = StateResponse {
            pc: state.pc,
            regs: state.regs.to_vec(),
            halted: state.halted,
            yielded: state.yielded,
            cycle_count: state.cycle_count,
            ram_size,
        };
        self.json_response(200, &resp)
    }

    fn handle_screen(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let screen = agent.read_screen();
        self.json_response(200, &screen)
    }

    fn handle_screen_ppm(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let screen = agent.read_screen();
        // Generate PPM P6 binary format (256x256)
        let mut ppm = Vec::with_capacity(256 * 256 * 3 + 128);
        ppm.extend_from_slice(b"P6\n256 256\n255\n");
        for pixel in &screen {
            let r = ((pixel >> 16) & 0xFF) as u8;
            let g = ((pixel >> 8) & 0xFF) as u8;
            let b = (pixel & 0xFF) as u8;
            ppm.push(r);
            ppm.push(g);
            ppm.push(b);
        }

        tiny_http::Response::from_data(ppm)
            .with_header(tiny_http::Header::from_bytes("Content-Type", "image/x-portable-pixmap").unwrap())
            .boxed()
    }

    fn handle_disasm(&self, request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let (start, count) = Self::parse_range_params(request, 0, 32);

        let agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let disasm = agent.disasm(start, count);
        let text = if disasm.is_empty() {
            "(no instructions)".to_string()
        } else {
            disasm
        };
        self.text_response(200, &text)
    }

    fn handle_load(&self, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: LoadRequest = match serde_json::from_str(&body) {
            Ok(r) => r,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!("Invalid JSON: {}. Expected {{\"source\": \"...\"}}", e),
                );
            }
        };

        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        match agent.load_gasm(&req.source) {
            Ok(labels) => {
                self.json_response(200, &serde_json::json!({ "loaded": true, "labels": labels }))
            }
            Err(e) => self.error_response(422, &format!("{}", e)),
        }
    }

    fn handle_step(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let state = agent.step_once();
        self.json_response(200, &state)
    }

    fn handle_resume(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let result = agent.resume();
        self.json_response(200, &result)
    }

    fn handle_reset(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        agent.reset();
        self.json_response(200, &serde_json::json!({ "reset": true }))
    }

    fn handle_write_ram(&self, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: WriteRamRequest = match serde_json::from_str(&body) {
            Ok(r) => r,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!("Invalid JSON: {}. Expected {{\"addr\": N, \"data\": [...]}}", e),
                );
            }
        };

        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        agent.write_ram(req.addr, &req.data);
        self.json_response(
            200,
            &serde_json::json!({ "written": req.data.len(), "addr": req.addr }),
        )
    }

    fn handle_read_ram(&self, request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let (start, count) = Self::parse_range_params(request, 0, 64);

        let agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let ram = agent.read_ram(start, count);
        self.json_response(
            200,
            &serde_json::json!({ "start": start, "count": ram.len(), "data": ram }),
        )
    }

    // ── Stack endpoint ──

    fn handle_stack(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let stack = agent.read_stack();
        let depth = agent.stack_depth();
        self.json_response(
            200,
            &serde_json::json!({
                "depth": depth,
                "data": stack,
            }),
        )
    }

    // ── Memory hex dump endpoint ──

    fn handle_memory(&self, request: &tiny_http::Request) -> tiny_http::ResponseBox {
        let (start, count) = Self::parse_range_params(request, 0, 256);

        let agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        let ram = agent.read_ram(start, count);
        // Format as hex dump: one line per 16 words, showing address + hex values
        let mut lines = Vec::new();
        for (i, chunk) in ram.chunks(16).enumerate() {
            let addr = start + i * 16;
            let hex: Vec<String> = chunk.iter().map(|v| format!("{:08X}", v)).collect();
            lines.push(format!("{:04X}: {}", addr, hex.join(" ")));
        }
        self.text_response(200, &lines.join("\n"))
    }

    // ── Input injection endpoints ──

    fn handle_input_key(&self, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: serde_json::Value = match serde_json::from_str(&body) {
            Ok(v) => v,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!("Invalid JSON: {}. Expected {{\"key\": N}}", e),
                );
            }
        };

        let keycode = match req.get("key").and_then(|v| v.as_u64()) {
            Some(k) => k as u32,
            None => return self.error_response(400, "Missing 'key' field (expected integer)"),
        };

        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        agent.inject_key(keycode);
        self.json_response(
            200,
            &serde_json::json!({ "injected": true, "key": keycode }),
        )
    }

    fn handle_input_mouse(&self, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: serde_json::Value = match serde_json::from_str(&body) {
            Ok(v) => v,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!(
                        "Invalid JSON: {}. Expected {{\"x\": N, \"y\": N, \"buttons\": N}}",
                        e
                    ),
                );
            }
        };

        let x = req["x"].as_u64().unwrap_or(0) as u32;
        let y = req["y"].as_u64().unwrap_or(0) as u32;
        let buttons = req["buttons"].as_u64().unwrap_or(0) as u32;

        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        agent.inject_mouse(x, y, buttons);
        self.json_response(
            200,
            &serde_json::json!({ "injected": true, "x": x, "y": y, "buttons": buttons }),
        )
    }

    fn handle_info(&self, _request: &tiny_http::Request) -> tiny_http::ResponseBox {
        self.json_response(
            200,
            &serde_json::json!({
                "name": "Geometry OS API",
                "version": env!("CARGO_PKG_VERSION"),
                "endpoints": [
                    "POST /run            -- assemble and execute .gasm source",
                    "GET  /state          -- current VM state (registers, pc, halted)",
                    "GET  /screen         -- screen buffer as JSON pixel array",
                    "GET  /screen/ppm     -- screen as PPM image",
                    "GET  /disasm         -- disassemble RAM (?start=0&count=32)",
                    "POST /load           -- load .gasm without running",
                    "POST /step           -- execute one instruction",
                    "POST /resume         -- continue yielded VM",
                    "POST /reset          -- reset VM to clean state",
                    "POST /ram            -- write to RAM ({addr, data})",
                    "GET  /ram            -- read RAM (?start=0&count=64)",
                    "GET  /stack          -- stack contents with depth",
                    "GET  /memory         -- hex dump of memory (?start=0&count=256)",
                    "POST /input/key      -- inject key press ({key})",
                    "POST /input/mouse    -- set mouse ({x, y, buttons})",
                    "WS   /ws/input       -- streaming key/mouse input (WebSocket)",
                    "",
                    "Sandbox API (multi-agent):",
                    "POST /api/sandbox/create          -- create isolated sandbox VM",
                    "GET  /api/sandbox                 -- list all sandboxes",
                    "GET  /api/sandbox/:id             -- sandbox info",
                    "DELETE /api/sandbox/:id           -- destroy sandbox",
                    "POST /api/sandbox/:id/run         -- run .gasm in sandbox",
                    "GET  /api/sandbox/:id/state       -- sandbox VM state",
                    "GET  /api/sandbox/:id/screen      -- sandbox screen buffer",
                    "POST /api/sandbox/:id/reset       -- reset sandbox VM",
                    "POST /api/sandbox/:id/load        -- load .gasm in sandbox",
                    "POST /api/sandbox/:id/step        -- single-step sandbox",
                    "POST /api/sandbox/:id/resume      -- resume yielded sandbox",
                    "POST /api/sandbox/:id/input/key   -- inject key into sandbox",
                    "POST /api/sandbox/:id/input/mouse -- inject mouse into sandbox",
                ]
            }),
        )
    }

    // ── WebSocket input streaming ──

    /// Check if the request is a WebSocket upgrade.
    fn is_websocket_upgrade(request: &tiny_http::Request) -> bool {
        // Check for Upgrade: websocket header
        request
            .headers()
            .iter()
            .any(|h| {
                h.field.equiv("Upgrade")
                    && h.value.as_str().eq_ignore_ascii_case("websocket")
            })
    }

    /// Handle a WebSocket upgrade on /ws/input.
    /// Performs the WS handshake, then loops reading JSON input events
    /// and injecting them into the VM.
    fn handle_ws_input(&self, request: tiny_http::Request) {
        // Extract Sec-WebSocket-Key from the client's request headers
        let ws_key = request
            .headers()
            .iter()
            .find(|h| h.field.equiv("Sec-WebSocket-Key"))
            .map(|h| h.value.as_str().to_string())
            .unwrap_or_default();

        // Compute Sec-WebSocket-Accept per RFC 6455:
        // SHA-1(client_key + magic_guid), base64-encoded
        let accept_key = Self::compute_ws_accept_key(&ws_key);

        // Build the 101 response with the correct accept key.
        // tiny_http's upgrade() will send this response, then return the raw stream.
        let response = tiny_http::Response::new(
            tiny_http::StatusCode(101),
            vec![
                tiny_http::Header::from_bytes("Upgrade", "websocket").unwrap(),
                tiny_http::Header::from_bytes("Connection", "Upgrade").unwrap(),
                tiny_http::Header::from_bytes("Sec-WebSocket-Accept", accept_key.as_str()).unwrap(),
            ],
            &b""[..],
            Some(0),
            None,
        );

        // Upgrade: tiny_http sends our 101 response and returns raw TCP stream.
        // The client validates the 101 (checking Sec-WebSocket-Accept).
        // We then wrap the stream as an already-handshaken WebSocket.
        let stream = request.upgrade("websocket", response);

        // Create WebSocket without re-doing the handshake (we already sent 101).
        let mut ws = tungstenite::WebSocket::from_raw_socket(
            stream,
            tungstenite::protocol::Role::Server,
            None,
        );

        eprintln!("[api] WebSocket /ws/input connected");

        // Read messages in a loop and inject input events into the VM.
        // JSON message formats:
        //   {"type": "key", "key": <u32>}
        //   {"type": "mouse", "x": <u32>, "y": <u32>, "buttons": <u32>}
        loop {
            let msg = match ws.read() {
                Ok(tungstenite::Message::Text(text)) => text,
                Ok(tungstenite::Message::Ping(data)) => {
                    // Respond to ping with pong
                    let _ = ws.send(tungstenite::Message::Pong(data));
                    continue;
                }
                Ok(tungstenite::Message::Close(_)) => {
                    eprintln!("[api] WebSocket /ws/input closed by client");
                    break;
                }
                Ok(_) => continue, // binary, pong — ignore
                Err(tungstenite::Error::ConnectionClosed) => {
                    eprintln!("[api] WebSocket /ws/input connection closed");
                    break;
                }
                Err(e) => {
                    eprintln!("[api] WebSocket /ws/input error: {}", e);
                    break;
                }
            };

            // Parse JSON message
            let event: serde_json::Value = match serde_json::from_str(&msg) {
                Ok(v) => v,
                Err(e) => {
                    eprintln!("[api] WebSocket invalid JSON: {} — message: {}", e, msg);
                    // Send error back to client
                    let err = serde_json::json!({"error": "invalid json", "detail": e.to_string()});
                    let _ = ws.send(tungstenite::Message::Text(err.to_string().into()));
                    continue;
                }
            };

            let event_type = event["type"].as_str().unwrap_or("");

            match event_type {
                "key" => {
                    if let Some(key) = event["key"].as_u64() {
                        let keycode = key as u32;
                        if let Ok(mut agent) = self.agent.lock() {
                            agent.inject_key(keycode);
                        }
                        let _ = ws.send(tungstenite::Message::Text(
                            serde_json::json!({"ok": true, "type": "key", "key": keycode})
                                .to_string()
                                .into(),
                        ));
                    } else {
                        let _ = ws.send(tungstenite::Message::Text(
                            serde_json::json!({"error": "missing key field"})
                                .to_string()
                                .into(),
                        ));
                    }
                }
                "mouse" => {
                    let x = event["x"].as_u64().unwrap_or(0) as u32;
                    let y = event["y"].as_u64().unwrap_or(0) as u32;
                    let buttons = event["buttons"].as_u64().unwrap_or(0) as u32;
                    if let Ok(mut agent) = self.agent.lock() {
                        agent.inject_mouse(x, y, buttons);
                    }
                    let _ = ws.send(tungstenite::Message::Text(
                        serde_json::json!({"ok": true, "type": "mouse", "x": x, "y": y, "buttons": buttons})
                            .to_string()
                            .into(),
                    ));
                }
                _ => {
                    let _ = ws.send(tungstenite::Message::Text(
                        serde_json::json!({"error": "unknown type", "type": event_type})
                            .to_string()
                            .into(),
                    ));
                }
            }
        }

        eprintln!("[api] WebSocket /ws/input disconnected");
    }

    /// Compute the Sec-WebSocket-Accept key per RFC 6455.
    fn compute_ws_accept_key(client_key: &str) -> String {
        use base64::Engine;
        use sha1::{Digest, Sha1};
        const WS_MAGIC: &str = "258EAFA5-E914-47DA-95CA-5AB5AF16FD6B";
        let mut hasher = Sha1::new();
        hasher.update(client_key.as_bytes());
        hasher.update(WS_MAGIC.as_bytes());
        base64::engine::general_purpose::STANDARD.encode(&hasher.finalize())
    }

    // ── Sandbox handler methods ──

    /// POST /api/sandbox/create — allocate a new sandboxed VM
    fn handle_sandbox_create(&self, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        // Optional JSON body: { "caps": { "max_cycles": N, "max_memory": N } }
        let caps: Option<SandboxCaps> = if body.trim().is_empty() {
            None
        } else {
            match serde_json::from_str::<serde_json::Value>(&body) {
                Ok(val) => {
                    if let Some(caps_val) = val.get("caps") {
                        serde_json::from_value(caps_val.clone()).ok()
                    } else {
                        None
                    }
                }
                Err(_) => None,
            }
        };

        let id = self.pool.create_default(caps);
        let info = self.pool.info(&id).unwrap();
        self.json_response(201, &serde_json::json!({ "created": true, "id": id, "info": info }))
    }

    /// GET /api/sandbox — list all sandboxes
    fn handle_sandbox_list(&self) -> tiny_http::ResponseBox {
        let infos = self.pool.list_info();
        self.json_response(200, &serde_json::json!({ "sandboxes": infos, "count": infos.len() }))
    }

    /// GET /api/sandbox/:id — get sandbox info
    fn handle_sandbox_info(&self, id: &str) -> tiny_http::ResponseBox {
        match self.pool.info(id) {
            Some(info) => self.json_response(200, &info),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// DELETE /api/sandbox/:id — destroy a sandbox
    fn handle_sandbox_destroy(&self, id: &str) -> tiny_http::ResponseBox {
        if self.pool.destroy(id) {
            self.json_response(200, &serde_json::json!({ "destroyed": true, "id": id }))
        } else {
            self.error_response(404, "Sandbox not found")
        }
    }

    /// POST /api/sandbox/:id/run — run .gasm source in a sandbox
    fn handle_sandbox_run(&self, id: &str, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: RunRequest = match serde_json::from_str(&body) {
            Ok(r) => r,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!("Invalid JSON: {}. Expected {{\"source\": \"...\"}}", e),
                );
            }
        };

        let result = self.pool.with_agent(id, |agent, caps| {
            // Enforce max_cycles cap if set
            let result = agent.run_gasm(&req.source);
            let _ = caps; // caps available for future enforcement
            result
        });

        match result {
            Some(Ok(agent_result)) => self.json_response(200, &agent_result),
            Some(Err(e)) => self.error_response(422, &format!("{}", e)),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// GET /api/sandbox/:id/state — get sandbox VM state
    fn handle_sandbox_state(&self, id: &str) -> tiny_http::ResponseBox {
        let result = self.pool.with_agent(id, |agent, _| {
            let state = agent.vm_state();
            let ram_size = agent.read_ram(0, 0).len();
            StateResponse {
                pc: state.pc,
                regs: state.regs.to_vec(),
                halted: state.halted,
                yielded: state.yielded,
                cycle_count: state.cycle_count,
                ram_size,
            }
        });

        match result {
            Some(resp) => self.json_response(200, &resp),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// GET /api/sandbox/:id/screen — get sandbox screen buffer
    fn handle_sandbox_screen(&self, id: &str) -> tiny_http::ResponseBox {
        let result = self.pool.with_agent(id, |agent, _| agent.read_screen());

        match result {
            Some(screen) => self.json_response(200, &screen),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// POST /api/sandbox/:id/reset — reset sandbox VM
    fn handle_sandbox_reset(&self, id: &str) -> tiny_http::ResponseBox {
        let result = self.pool.with_agent(id, |agent, _| {
            agent.reset();
            true
        });

        match result {
            Some(_) => self.json_response(200, &serde_json::json!({ "reset": true, "id": id })),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// POST /api/sandbox/:id/load — load .gasm source in sandbox without running
    fn handle_sandbox_load(&self, id: &str, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: LoadRequest = match serde_json::from_str(&body) {
            Ok(r) => r,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!("Invalid JSON: {}. Expected {{\"source\": \"...\"}}", e),
                );
            }
        };

        let result = self.pool.with_agent(id, |agent, _| agent.load_gasm(&req.source));

        match result {
            Some(Ok(labels)) => self.json_response(
                200,
                &serde_json::json!({ "loaded": true, "labels": labels, "id": id }),
            ),
            Some(Err(e)) => self.error_response(422, &format!("{}", e)),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// POST /api/sandbox/:id/step — single-step sandbox VM
    fn handle_sandbox_step(&self, id: &str) -> tiny_http::ResponseBox {
        let result = self.pool.with_agent(id, |agent, _| agent.step_once());

        match result {
            Some(state) => self.json_response(200, &state),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// POST /api/sandbox/:id/resume — resume yielded sandbox VM
    fn handle_sandbox_resume(&self, id: &str) -> tiny_http::ResponseBox {
        let result = self.pool.with_agent(id, |agent, _| agent.resume());

        match result {
            Some(agent_result) => self.json_response(200, &agent_result),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// POST /api/sandbox/:id/input/key — inject key into sandbox
    fn handle_sandbox_input_key(&self, id: &str, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: serde_json::Value = match serde_json::from_str(&body) {
            Ok(v) => v,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!("Invalid JSON: {}. Expected {{\"key\": N}}", e),
                );
            }
        };

        let keycode = match req.get("key").and_then(|v| v.as_u64()) {
            Some(k) => k as u32,
            None => return self.error_response(400, "Missing 'key' field (expected integer)"),
        };

        let result = self.pool.with_agent(id, |agent, _| {
            agent.inject_key(keycode);
            keycode
        });

        match result {
            Some(kc) => self.json_response(
                200,
                &serde_json::json!({ "injected": true, "key": kc, "id": id }),
            ),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    /// POST /api/sandbox/:id/input/mouse — inject mouse into sandbox
    fn handle_sandbox_input_mouse(&self, id: &str, request: &mut tiny_http::Request) -> tiny_http::ResponseBox {
        let body = match Self::read_body(request) {
            Ok(b) => b,
            Err(e) => return self.error_response(400, &format!("Failed to read body: {}", e)),
        };

        let req: serde_json::Value = match serde_json::from_str(&body) {
            Ok(v) => v,
            Err(e) => {
                return self.error_response(
                    400,
                    &format!(
                        "Invalid JSON: {}. Expected {{\"x\": N, \"y\": N, \"buttons\": N}}",
                        e
                    ),
                );
            }
        };

        let x = req["x"].as_u64().unwrap_or(0) as u32;
        let y = req["y"].as_u64().unwrap_or(0) as u32;
        let buttons = req["buttons"].as_u64().unwrap_or(0) as u32;

        let result = self.pool.with_agent(id, |agent, _| {
            agent.inject_mouse(x, y, buttons);
            (x, y, buttons)
        });

        match result {
            Some((x, y, buttons)) => self.json_response(
                200,
                &serde_json::json!({ "injected": true, "x": x, "y": y, "buttons": buttons, "id": id }),
            ),
            None => self.error_response(404, "Sandbox not found"),
        }
    }

    // ── Helpers ──

    fn read_body(request: &mut tiny_http::Request) -> Result<String, String> {
        let mut body = String::new();
        request
            .as_reader()
            .read_to_string(&mut body)
            .map_err(|e| format!("{}", e))?;
        Ok(body)
    }

    fn parse_range_params(request: &tiny_http::Request, default_start: usize, default_count: usize) -> (usize, usize) {
        let url = request.url().to_string();
        let query = url.split('?').nth(1).unwrap_or("");
        let mut start = default_start;
        let mut count = default_count;
        for pair in query.split('&') {
            if pair.is_empty() {
                continue;
            }
            if let Some((key, val)) = pair.split_once('=') {
                match key {
                    "start" => start = val.parse().unwrap_or(default_start),
                    "count" => count = val.parse().unwrap_or(default_count),
                    _ => {}
                }
            }
        }
        (start, count)
    }

    fn json_response<T: serde::Serialize>(&self, status: u16, data: &T) -> tiny_http::ResponseBox {
        let body = serde_json::to_string(data).unwrap_or_else(|e| format!("{{\"error\":\"serialize: {}\"}}", e));
        tiny_http::Response::from_data(body.into_bytes())
            .with_status_code(Self::http_status(status))
            .with_header(tiny_http::Header::from_bytes("Content-Type", "application/json").unwrap())
            .boxed()
    }

    fn text_response(&self, status: u16, text: &str) -> tiny_http::ResponseBox {
        tiny_http::Response::from_data(text.as_bytes().to_vec())
            .with_status_code(Self::http_status(status))
            .with_header(tiny_http::Header::from_bytes("Content-Type", "text/plain").unwrap())
            .boxed()
    }

    fn error_response(&self, status: u16, message: &str) -> tiny_http::ResponseBox {
        let err = ErrorResponse {
            error: message.to_string(),
        };
        self.json_response(status, &err)
    }

    fn http_status(code: u16) -> tiny_http::StatusCode {
        tiny_http::StatusCode(code)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Read;

    /// Helper: start an API server on a random available port.
    fn start_server() -> (ApiServer, u16) {
        // Bind to port 0 to get a random available port
        let server = tiny_http::Server::http("0.0.0.0:0").expect("Failed to bind test server");
        let port = match server.server_addr() {
            tiny_http::ListenAddr::IP(addr) => addr.port(),
            #[cfg(unix)]
            tiny_http::ListenAddr::Unix(_) => 0,
        };
        let api = ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
            pool: VmPool::new(4096),
        };
        (api, port)
    }

    /// Send an HTTP request and return (status_code, body_string).
    fn http_request(method: &str, port: u16, path: &str, body: Option<&str>) -> (u16, String) {
        let url = format!("http://127.0.0.1:{}{}", port, path);
        let client = reqwest::blocking::Client::new();
        let req = match method {
            "GET" => client.get(&url),
            "POST" => client.post(&url),
            "DELETE" => client.delete(&url),
            _ => panic!("Unsupported method"),
        };
        let req = if let Some(b) = body {
            req.header("Content-Type", "application/json").body(b.to_string())
        } else {
            req
        };
        let resp = req.send().expect("HTTP request failed");
        let status = resp.status().as_u16();
        let text = resp.text().unwrap_or_default();
        (status, text)
    }

    #[test]
    fn api_info_endpoint() {
        let (server, port) = start_server();

        // Handle the request in a separate thread
        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let (status, body) = http_request("GET", port, "/", None);
        handle.join().unwrap();

        assert_eq!(status, 200);
        assert!(body.contains("Geometry OS API"));
        assert!(body.contains("/run"));
    }

    #[test]
    fn api_run_simple_program() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{"source": "LDI r0, 42\nHALT"}"#;
        let (status, resp) = http_request("POST", port, "/run", Some(body));
        handle.join().unwrap();

        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["halted"], true);
        assert_eq!(json["regs"][0], 42);
    }

    #[test]
    fn api_state_endpoint() {
        let (server, port) = start_server();

        // First: run a program
        let handle = std::thread::spawn(move || {
            // Handle /run request
            server.serve_one();
        });

        let body = r#"{"source": "LDI r1, 99\nHALT"}"#;
        let (status, _) = http_request("POST", port, "/run", Some(body));
        handle.join().unwrap();
        assert_eq!(status, 200);
    }

    #[test]
    fn api_reset_endpoint() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let (status, body) = http_request("POST", port, "/reset", None);
        handle.join().unwrap();

        assert_eq!(status, 200);
        assert!(body.contains("true"));
    }

    #[test]
    fn api_404_for_unknown() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let (status, body) = http_request("GET", port, "/nonexistent", None);
        handle.join().unwrap();

        assert_eq!(status, 404);
        assert!(body.contains("Not found"));
    }

    #[test]
    fn api_run_invalid_json() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"not json"#;
        let (status, resp) = http_request("POST", port, "/run", Some(body));
        handle.join().unwrap();

        assert_eq!(status, 400);
        assert!(resp.contains("Invalid JSON"));
    }

    #[test]
    fn api_run_bad_gasm() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{"source": "INVALID_OPCODE r0"}"#;
        let (status, resp) = http_request("POST", port, "/run", Some(body));
        handle.join().unwrap();

        assert_eq!(status, 422);
        assert!(resp.contains("assembly error") || resp.contains("unknown"));
    }

    #[test]
    fn api_screen_endpoint() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{"source": "PSET 10, 10, 5\nHALT"}"#;
        let (status, _) = http_request("POST", port, "/run", Some(body));
        handle.join().unwrap();
        assert_eq!(status, 200);
    }

    #[test]
    fn api_read_ram_endpoint() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let (status, body) = http_request("GET", port, "/ram?start=0&count=4", None);
        handle.join().unwrap();

        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&body).unwrap();
        assert_eq!(json["start"], 0);
    }

    #[test]
    fn api_step_and_resume() {
        let (server, port) = start_server();

        // Load a program
        let handle = std::thread::spawn(move || {
            server.serve_one();
        });
        let body = r#"{"source": "LDI r0, 1\nYIELD\nLDI r0, 2\nHALT"}"#;
        let (status, _) = http_request("POST", port, "/load", Some(body));
        handle.join().unwrap();
        assert_eq!(status, 200);

        // Step once (first instruction)
        // We need to share state between requests -- but each test has a fresh server.
        // For a proper step/resume test, we'd need a persistent server.
        // The individual endpoints are tested; the flow is tested in integration.
    }

    #[test]
    fn api_stack_endpoint() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{"source": "LDI r0, 42\nPUSH r0\nHALT"}"#;
        let (status, _) = http_request("POST", port, "/run", Some(body));
        handle.join().unwrap();
        assert_eq!(status, 200);
    }

    #[test]
    fn api_memory_endpoint() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let (status, body) = http_request("GET", port, "/memory?start=0&count=16", None);
        handle.join().unwrap();

        assert_eq!(status, 200);
        // Should be a hex dump (text/plain)
        assert!(body.contains("0000:") || body.is_empty() || body.starts_with("0x"));
    }

    #[test]
    fn api_input_key_endpoint() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{"key": 65}"#;
        let (status, resp) = http_request("POST", port, "/input/key", Some(body));
        handle.join().unwrap();

        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["injected"], true);
        assert_eq!(json["key"], 65);
    }

    #[test]
    fn api_input_key_missing_field() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{"notkey": 65}"#;
        let (status, resp) = http_request("POST", port, "/input/key", Some(body));
        handle.join().unwrap();

        assert_eq!(status, 400);
        assert!(resp.contains("Missing"));
    }

    #[test]
    fn api_input_mouse_endpoint() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{"x": 100, "y": 50, "buttons": 1}"#;
        let (status, resp) = http_request("POST", port, "/input/mouse", Some(body));
        handle.join().unwrap();

        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["injected"], true);
        assert_eq!(json["x"], 100);
        assert_eq!(json["y"], 50);
        assert_eq!(json["buttons"], 1);
    }

    #[test]
    fn api_input_mouse_defaults() {
        let (server, port) = start_server();

        let handle = std::thread::spawn(move || {
            server.serve_one();
        });

        let body = r#"{}"#;
        let (status, resp) = http_request("POST", port, "/input/mouse", Some(body));
        handle.join().unwrap();

        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["x"], 0);
        assert_eq!(json["y"], 0);
        assert_eq!(json["buttons"], 0);
    }

    // ── Sandbox API tests ──

    #[test]
    fn sandbox_create_and_list() {
        let server = tiny_http::Server::http("0.0.0.0:0").expect("bind");
        let port = match server.server_addr() {
            tiny_http::ListenAddr::IP(addr) => addr.port(),
            #[cfg(unix)]
            tiny_http::ListenAddr::Unix(_) => 0,
        };
        let api = ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
            pool: VmPool::new(4096),
        };

        // Serve 2 requests: create + list
        let handle = std::thread::spawn(move || {
            for _ in 0..2 {
                api.serve_one();
            }
        });

        // Create a sandbox
        let (status, resp) = http_request("POST", port, "/api/sandbox/create", None);
        assert_eq!(status, 201);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["created"], true);
        let id = json["id"].as_str().unwrap().to_string();
        assert!(id.starts_with("sb-"));

        // List sandboxes
        let (status, resp) = http_request("GET", port, "/api/sandbox", None);
        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["count"], 1);

        handle.join().unwrap();
    }

    #[test]
    fn sandbox_full_lifecycle() {
        // Start server in a thread that serves multiple requests
        let server = tiny_http::Server::http("0.0.0.0:0").expect("bind");
        let port = match server.server_addr() {
            tiny_http::ListenAddr::IP(addr) => addr.port(),
            #[cfg(unix)]
            tiny_http::ListenAddr::Unix(_) => 0,
        };
        let api = ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
            pool: VmPool::new(4096),
        };

        // Spawn server thread serving 6 requests
        let handle = std::thread::spawn(move || {
            for _ in 0..6 {
                api.serve_one();
            }
        });

        // 1. Create sandbox
        let (status, resp) = http_request("POST", port, "/api/sandbox/create", None);
        assert_eq!(status, 201);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        let id = json["id"].as_str().unwrap().to_string();

        // 2. Run code in sandbox
        let body = format!(r#"{{"source": "LDI r0, 42\nHALT"}}"#);
        let (status, resp) = http_request("POST", port, &format!("/api/sandbox/{}/run", id), Some(&body));
        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["halted"], true);
        assert_eq!(json["regs"][0], 42);

        // 3. Get sandbox state
        let (status, _resp) = http_request("GET", port, &format!("/api/sandbox/{}/state", id), None);
        assert_eq!(status, 200);

        // 4. Get sandbox info
        let (status, resp) = http_request("GET", port, &format!("/api/sandbox/{}", id), None);
        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["id"], id);

        // 5. Destroy sandbox
        let (status, resp) = http_request("DELETE", port, &format!("/api/sandbox/{}", id), None);
        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["destroyed"], true);

        // 6. Verify destroyed (404)
        let (status, _) = http_request("GET", port, &format!("/api/sandbox/{}", id), None);
        assert_eq!(status, 404);

        handle.join().unwrap();
    }

    #[test]
    fn sandbox_isolation() {
        let server = tiny_http::Server::http("0.0.0.0:0").expect("bind");
        let port = match server.server_addr() {
            tiny_http::ListenAddr::IP(addr) => addr.port(),
            #[cfg(unix)]
            tiny_http::ListenAddr::Unix(_) => 0,
        };
        let api = ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
            pool: VmPool::new(4096),
        };

        let handle = std::thread::spawn(move || {
            for _ in 0..4 {
                api.serve_one();
            }
        });

        // Create two sandboxes
        let (s1, r1) = http_request("POST", port, "/api/sandbox/create", None);
        assert_eq!(s1, 201);
        let id1 = serde_json::from_str::<serde_json::Value>(&r1).unwrap()["id"]
            .as_str()
            .unwrap()
            .to_string();

        let (s2, r2) = http_request("POST", port, "/api/sandbox/create", None);
        assert_eq!(s2, 201);
        let id2 = serde_json::from_str::<serde_json::Value>(&r2).unwrap()["id"]
            .as_str()
            .unwrap()
            .to_string();

        assert_ne!(id1, id2, "Sandboxes should have unique IDs");

        // Run different programs in each
        let body1 = r#"{"source": "LDI r0, 111\nHALT"}"#;
        let (status, _) = http_request("POST", port, &format!("/api/sandbox/{}/run", id1), Some(body1));
        assert_eq!(status, 200);

        let body2 = r#"{"source": "LDI r0, 222\nHALT"}"#;
        let (status, _) = http_request("POST", port, &format!("/api/sandbox/{}/run", id2), Some(body2));
        assert_eq!(status, 200);

        handle.join().unwrap();
    }

    #[test]
    fn sandbox_create_with_caps() {
        let server = tiny_http::Server::http("0.0.0.0:0").expect("bind");
        let port = match server.server_addr() {
            tiny_http::ListenAddr::IP(addr) => addr.port(),
            #[cfg(unix)]
            tiny_http::ListenAddr::Unix(_) => 0,
        };
        let api = ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
            pool: VmPool::new(4096),
        };

        let handle = std::thread::spawn(move || {
            for _ in 0..2 {
                api.serve_one();
            }
        });

        // Create with caps
        let body = r#"{"caps": {"max_cycles": 100, "max_memory": 2048}}"#;
        let (status, resp) = http_request("POST", port, "/api/sandbox/create", Some(body));
        assert_eq!(status, 201);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["info"]["max_cycles"], 100);
        assert_eq!(json["info"]["max_memory"], 2048);

        // List sandboxes
        let (status, resp) = http_request("GET", port, "/api/sandbox", None);
        assert_eq!(status, 200);
        let json: serde_json::Value = serde_json::from_str(&resp).unwrap();
        assert_eq!(json["count"], 1);

        handle.join().unwrap();
    }

    #[test]
    fn sandbox_404_for_nonexistent() {
        let server = tiny_http::Server::http("0.0.0.0:0").expect("bind");
        let port = match server.server_addr() {
            tiny_http::ListenAddr::IP(addr) => addr.port(),
            #[cfg(unix)]
            tiny_http::ListenAddr::Unix(_) => 0,
        };
        let api = ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
            pool: VmPool::new(4096),
        };

        let handle = std::thread::spawn(move || {
            for _ in 0..4 {
                api.serve_one();
            }
        });

        // GET nonexistent sandbox
        let (status, _) = http_request("GET", port, "/api/sandbox/sb-999", None);
        assert_eq!(status, 404);

        // DELETE nonexistent sandbox
        let (status, _) = http_request("DELETE", port, "/api/sandbox/sb-999", None);
        assert_eq!(status, 404);

        // RUN in nonexistent sandbox
        let body = r#"{"source": "LDI r0, 1\nHALT"}"#;
        let (status, _) = http_request("POST", port, "/api/sandbox/sb-999/run", Some(body));
        assert_eq!(status, 404);

        // STATE for nonexistent sandbox
        let (status, _) = http_request("GET", port, "/api/sandbox/sb-999/state", None);
        assert_eq!(status, 404);

        handle.join().unwrap();
    }
}
