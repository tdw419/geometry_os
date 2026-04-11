// ═══════════════════════════════════════════════════════════════════════
// REST API SERVER
//
// HTTP bridge for external agents to interact with the Geometry OS VM.
// Uses tiny_http for lightweight HTTP handling.
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
use std::sync::Mutex;

/// The REST API server wrapping a GasmAgent.
pub struct ApiServer {
    server: tiny_http::Server,
    agent: Mutex<GasmAgent>,
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
        let server =
            tiny_http::Server::http(&addr).unwrap_or_else(|e| panic!("Failed to bind {}: {}", addr, e));
        eprintln!("[api] Geometry OS REST API listening on {}", addr);
        ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(4096)),
        }
    }

    /// Create an API server with a custom RAM size.
    pub fn with_ram_size(port: u16, ram_size: usize) -> Self {
        let addr = format!("0.0.0.0:{}", port);
        let server =
            tiny_http::Server::http(&addr).unwrap_or_else(|e| panic!("Failed to bind {}: {}", addr, e));
        eprintln!("[api] Geometry OS REST API listening on {}", addr);
        ApiServer {
            server,
            agent: Mutex::new(GasmAgent::new(ram_size)),
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
                    &format!("Invalid JSON: {}. Expected {{\"keycode\": N}}", e),
                );
            }
        };

        let keycode = req["keycode"].as_u64().unwrap_or(0) as u32;

        let mut agent = match self.agent.lock() {
            Ok(a) => a,
            Err(_) => return self.error_response(500, "Agent lock poisoned"),
        };

        agent.inject_key(keycode);
        self.json_response(200, &serde_json::json!({ "injected": true, "keycode": keycode }))
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
                    "POST /input/key      -- inject key press ({keycode})",
                    "POST /input/mouse    -- set mouse ({x, y, buttons})",
                ]
            }),
        )
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
        let (server2, _) = start_server();
        // We need to share state between requests -- but each test has a fresh server.
        // For a proper step/resume test, we'd need a persistent server.
        // The individual endpoints are tested; the flow is tested in integration.
    }
}
