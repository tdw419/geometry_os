//! Evolution Stream Server - Phase 21
//!
//! WebSocket server for real-time spatial circuit visualization.
//! Streams circuit states, fitness metrics, and generation updates
//! to PixiJS frontend.

use std::sync::Arc;
use tokio::sync::{broadcast, RwLock};
use serde::{Deserialize, Serialize};
use warp::{ws::Message, ws::WebSocket, Filter, Reply};
use futures_util::{StreamExt, SinkExt};

async fn client_connection(ws: WebSocket, mut circuit_rx: broadcast::Receiver<CircuitSnapshot>, mut generation_rx: broadcast::Receiver<GenerationUpdate>) {
    let (mut client_ws_sender, _client_ws_rcv) = ws.split();

    loop {
        tokio::select! {
            Ok(snapshot) = circuit_rx.recv() => {
                let msg = serde_json::to_string(&snapshot).unwrap();
                if let Err(e) = client_ws_sender.send(Message::text(msg)).await {
                    log::error!("Error sending circuit snapshot: {}", e);
                    break;
                }
            }
            Ok(update) = generation_rx.recv() => {
                let msg = serde_json::to_string(&update).unwrap();
                if let Err(e) = client_ws_sender.send(Message::text(msg)).await {
                    log::error!("Error sending generation update: {}", e);
                    break;
                }
            }
        }
    }
}


use crate::geoasm_materializer::CellState;

/// Circuit state for streaming
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CircuitSnapshot {
    /// Sandbox ID (0-255)
    pub sandbox_id: usize,
    /// Grid width
    pub width: usize,
    /// Grid height
    pub height: usize,
    /// Cell states (flattened 1D array)
    pub cells: Vec<CellData>,
    /// Generation number
    pub generation: usize,
    /// Fitness metrics
    pub fitness: Option<f32>,
}

/// Cell data for streaming
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CellData {
    /// X coordinate
    pub x: usize,
    /// Y coordinate
    pub y: usize,
    /// Cell type (opcode)
    pub cell_type: u32,
    /// Active token count (0-3)
    pub active: u32,
    /// Data buffer value
    pub data: f32,
    /// Register value (if applicable)
    pub reg: u32,
    /// Target coordinates (for instructions)
    pub target_x: i32,
    pub target_y: i32,
}

/// Generation update event
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GenerationUpdate {
    /// Generation number
    pub generation: usize,
    /// Number of variants evaluated
    pub variant_count: usize,
    /// Best fitness this generation
    pub best_fitness: f32,
    /// Best sandbox ID
    pub best_sandbox_id: usize,
    /// Generation duration (ms)
    pub duration_ms: u64,
    /// Pareto frontier size
    pub pareto_frontier_size: usize,
}

/// Stream server configuration
#[derive(Debug, Clone)]
pub struct StreamConfig {
    /// WebSocket host address
    pub host: String,
    /// WebSocket port
    pub port: u16,
}

impl Default for StreamConfig {
    fn default() -> Self {
        Self {
            host: "127.0.0.1".to_string(),
            port: 8765,
        }
    }
}

/// Evolution stream server
pub struct EvolutionStreamServer {
    config: StreamConfig,
    /// Broadcast channel for circuit snapshots
    circuit_tx: broadcast::Sender<CircuitSnapshot>,
    /// Broadcast channel for generation updates
    generation_tx: broadcast::Sender<GenerationUpdate>,
    /// Connected clients count
    client_count: Arc<RwLock<usize>>,
}

impl EvolutionStreamServer {
    /// Create new stream server
    pub fn new(config: StreamConfig) -> Self {
        let (circuit_tx, _) = broadcast::channel(256);
        let (generation_tx, _) = broadcast::channel(64);

        Self {
            config,
            circuit_tx,
            generation_tx,
            client_count: Arc::new(RwLock::new(0)),
        }
    }

    /// Broadcast circuit snapshot to all connected clients
    pub fn broadcast_circuit(
        &self,
        snapshot: CircuitSnapshot,
    ) -> Result<usize, broadcast::error::SendError<CircuitSnapshot>> {
        self.circuit_tx.send(snapshot)
    }

    /// Broadcast generation update to all connected clients
    pub fn broadcast_generation(
        &self,
        update: GenerationUpdate,
    ) -> Result<usize, broadcast::error::SendError<GenerationUpdate>> {
        self.generation_tx.send(update)
    }

    /// Get subscriber for circuit snapshots
    pub fn subscribe_circuits(&self) -> broadcast::Receiver<CircuitSnapshot> {
        self.circuit_tx.subscribe()
    }

    /// Get subscriber for generation updates
    pub fn subscribe_generations(&self) -> broadcast::Receiver<GenerationUpdate> {
        self.generation_tx.subscribe()
    }

    /// Convert CellState slice to CellData vector
    pub fn cells_to_snapshot(
        &self,
        sandbox_id: usize,
        circuit: &[CellState],
        generation: usize,
    ) -> CircuitSnapshot {
        let width = (circuit.len() as f32).sqrt() as usize;
        let height = circuit.len() / width;

        let cells: Vec<CellData> = circuit
            .iter()
            .enumerate()
            .map(|(idx, cell)| {
                let x = idx % width;
                let y = idx / width;

                CellData {
                    x,
                    y,
                    cell_type: cell.opcode_or_type,
                    active: cell.is_active,
                    data: cell.data_buffer as f32,
                    reg: 0,
                    target_x: cell.rel_x(),
                    target_y: cell.rel_y(),
                }
            })
            .collect();

        CircuitSnapshot {
            sandbox_id,
            width,
            height,
            cells,
            generation,
            fitness: None,
        }
    }

    /// Start WebSocket server (simplified for initial testing)
    pub async fn run(&self) -> Result<(), Box<dyn std::error::Error>> {
        use warp::path;

        // Simple health check route
        let health_route = warp::path("health").map(|| {
            warp::reply::json(&serde_json::json!({
                "status": "ok",
                "message": "Evolution Stream Server running",
            }))
        });

        // Serve static HTML file at the root path
        let html_route = warp::path::end().and(warp::fs::file(
            "systems/infinite_map_rs/web/evolution_visualizer.html",
        ));
        
        let circuit_tx = self.circuit_tx.clone();
        let generation_tx = self.generation_tx.clone();
        
        let ws_route = warp::path("ws")
            .and(warp::ws())
            .and(warp::any().map(move || circuit_tx.subscribe()))
            .and(warp::any().map(move || generation_tx.subscribe()))
            .map(|ws: warp::ws::Ws, circuit_rx, generation_rx| {
                ws.on_upgrade(move |socket| client_connection(socket, circuit_rx, generation_rx))
            });

        // Combine routes
        
        // Memory Palace routes
        let palace_list_route = warp::path!("api" / "palace").map(|| {
            let mut circuits = Vec::new();
            if let Ok(entries) = std::fs::read_dir("evolution_palace") {
                for entry in entries.flatten() {
                    let path = entry.path();
                    if path.extension().unwrap_or_default() == "json" {
                        if let Ok(content) = std::fs::read_to_string(&path) {
                            if let Ok(mut json) = serde_json::from_str::<serde_json::Value>(&content) {
                                // Inject the png filename for convenience
                                if let Some(filename) = path.file_stem() {
                                    let png_name = filename.to_string_lossy().to_string().replace(".meta", "") + ".png";
                                    json["png_url"] = serde_json::Value::String(format!("/palace/{}", png_name));
                                }
                                circuits.push(json);
                            }
                        }
                    }
                }
            }
            warp::reply::json(&circuits)
        });

        let palace_assets_route = warp::path("palace").and(warp::fs::dir("evolution_palace"));

        let routes = health_route.or(html_route).or(ws_route).or(palace_list_route).or(palace_assets_route);

        // Start server
        let addr = format!("{}:{}", self.config.host, self.config.port);
        log::info!("🚀 Evolution Stream Server listening on http://{}", addr);

        warp::serve(routes)
            .run(addr.parse::<std::net::SocketAddr>()?)
            .await;

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::geoasm_materializer::{TYPE_LDI, TYPE_WALL};

    #[test]
    fn test_circuit_snapshot_creation() {
        let server = EvolutionStreamServer::new(StreamConfig::default());

        let circuit = vec![
            CellState::new(TYPE_LDI, 0, 0),
            CellState::wall(),
            CellState::data(42),
        ];

        let snapshot = server.cells_to_snapshot(0, &circuit, 1);

        assert_eq!(snapshot.sandbox_id, 0);
        assert_eq!(snapshot.generation, 1);
        assert_eq!(snapshot.cells.len(), 3);
        assert_eq!(snapshot.cells[0].cell_type, TYPE_LDI);
        assert_eq!(snapshot.cells[1].cell_type, TYPE_WALL);
    }

    #[test]
    fn test_broadcast_and_subscribe() {
        let server = EvolutionStreamServer::new(StreamConfig::default());
        let mut rx = server.subscribe_circuits();

        let snapshot = CircuitSnapshot {
            sandbox_id: 42,
            width: 2,
            height: 2,
            cells: vec![],
            generation: 1,
            fitness: Some(0.85),
        };

        // Broadcast
        assert!(server.broadcast_circuit(snapshot.clone()).is_ok());

        // Receive
        let received = rx.try_recv().unwrap();
        assert_eq!(received.sandbox_id, 42);
        assert_eq!(received.fitness, Some(0.85));
    }

    #[test]
    fn test_generation_update_serialization() {
        let update = GenerationUpdate {
            generation: 5,
            variant_count: 256,
            best_fitness: 8124.94,
            best_sandbox_id: 162,
            duration_ms: 654,
            pareto_frontier_size: 2,
        };

        let json = serde_json::to_string(&update).unwrap();
        let deserialized: GenerationUpdate = serde_json::from_str(&json).unwrap();

        assert_eq!(deserialized.generation, 5);
        assert_eq!(deserialized.best_fitness, 8124.94);
    }
}