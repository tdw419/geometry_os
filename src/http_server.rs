// http_server.rs -- HTTP/REST API for Memory Palace remote access
// Phase 203: Remote access API with WebSocket support

use crate::export::{export_memory_palace, ExportedBuilding, ExportedPlayer};
use crate::vm::Vm;
use chrono::{DateTime, Utc};
use hyper::header::{AUTHORIZATION, CONTENT_TYPE};
use hyper::service::Service;
use hyper::{Body, Method, Request, Response, StatusCode};
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::future::Future;
use std::pin::Pin;
use std::sync::Arc;
use tokio::sync::{broadcast, RwLock};

/// Configuration for the HTTP server
#[derive(Debug, Clone)]
pub struct HttpConfig {
    /// Bind address
    pub addr: String,
    /// Port to listen on
    pub port: u16,
    /// Optional auth token for write operations
    pub auth_token: Option<String>,
    /// Enable WebSocket support
    pub enable_websocket: bool,
}

impl Default for HttpConfig {
    fn default() -> Self {
        Self {
            addr: "127.0.0.1".to_string(),
            port: 4242,
            auth_token: None,
            enable_websocket: true,
        }
    }
}

/// WebSocket update message
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum WsUpdate {
    /// Player position changed
    PlayerMoved { x: i32, y: i32, facing: u32 },
    /// Building added/modified
    BuildingChanged { id: u32, x: i32, y: i32 },
    /// Building removed
    BuildingRemoved { id: u32 },
    /// Memory palace import/export
    PalaceChanged { timestamp: String },
}

/// HTTP server state
#[derive(Clone)]
pub struct HttpServer {
    /// Shared VM state (read-only for now)
    vm: Arc<RwLock<Vm>>,
    /// Configuration
    config: HttpConfig,
    /// Timestamp of last update
    last_update: Arc<RwLock<DateTime<Utc>>>,
    /// Broadcast channel for WebSocket updates
    ws_broadcaster: Arc<broadcast::Sender<WsUpdate>>,
}

impl HttpServer {
    /// Create a new HTTP server from Arc<RwLock<Vm>>
    pub fn from_vm_arc(vm: Arc<RwLock<Vm>>, config: HttpConfig) -> Self {
        let (tx, _) = broadcast::channel(100);

        Self {
            vm,
            config,
            last_update: Arc::new(RwLock::new(Utc::now())),
            ws_broadcaster: Arc::new(tx),
        }
    }

    /// Get a broadcast sender for sending updates to WebSocket clients
    pub fn get_broadcaster(&self) -> broadcast::Sender<WsUpdate> {
        self.ws_broadcaster.as_ref().clone()
    }

    /// Start the HTTP server
    pub async fn start(self) -> Result<(), Box<dyn std::error::Error>> {
        let addr = format!("{}:{}", self.config.addr, self.config.port);
        let socket = tokio::net::TcpListener::bind(&addr).await?;

        println!("[http] HTTP/WebSocket server listening on http://{}", addr);

        loop {
            let (stream, remote_addr) = socket.accept().await?;
            let server = self.clone();

            tokio::spawn(async move {
                let http = hyper::server::conn::Http::new();

                if let Err(err) = http.serve_connection(stream, server).with_upgrades().await {
                    eprintln!("[http] Connection error from {}: {}", remote_addr, err);
                }
            });
        }
    }

    /// Check authentication for write operations
    fn check_auth(&self, req: &Request<Body>) -> bool {
        // Read-only operations don't require auth
        if req.method() == Method::GET {
            return true;
        }

        // Write operations require auth
        if let Some(token) = &self.config.auth_token {
            if let Some(auth_header) = req.headers().get(AUTHORIZATION) {
                if let Ok(auth_str) = auth_header.to_str() {
                    return auth_str == format!("Bearer {}", token);
                }
            }
        }

        false
    }

    /// Handle GET /buildings
    async fn handle_get_buildings(
        &self,
    ) -> Result<Response<Body>, Box<dyn std::error::Error + Send + Sync>> {
        let vm = self.vm.read().await;
        let buildings = export_memory_palace(&vm, false)?;

        let response = serde_json::to_string(&buildings)?;

        Ok(Response::builder()
            .status(StatusCode::OK)
            .header(CONTENT_TYPE, "application/json")
            .body(Body::from(response))
            .unwrap())
    }

    /// Handle GET /buildings/{id}
    async fn handle_get_building(
        &self,
        id: u32,
    ) -> Result<Response<Body>, Box<dyn std::error::Error + Send + Sync>> {
        let vm = self.vm.read().await;
        let export_data = export_memory_palace(&vm, false)?;

        let building = export_data.buildings.iter().find(|b| b.id == id);

        match building {
            Some(b) => {
                let response = serde_json::to_string(b)?;

                Ok(Response::builder()
                    .status(StatusCode::OK)
                    .header(CONTENT_TYPE, "application/json")
                    .body(Body::from(response))
                    .unwrap())
            },
            None => Ok(Response::builder()
                .status(StatusCode::NOT_FOUND)
                .body(Body::from(format!("Building {} not found", id)))
                .unwrap()),
        }
    }

    /// Handle GET /player
    async fn handle_get_player(
        &self,
    ) -> Result<Response<Body>, Box<dyn std::error::Error + Send + Sync>> {
        let vm = self.vm.read().await;
        let export_data = export_memory_palace(&vm, false)?;

        let response = serde_json::to_string(&export_data.player)?;

        Ok(Response::builder()
            .status(StatusCode::OK)
            .header(CONTENT_TYPE, "application/json")
            .body(Body::from(response))
            .unwrap())
    }

    /// Handle POST /api/memory_palace/import
    async fn handle_import_palace(
        &self,
        req: Request<Body>,
    ) -> Result<Response<Body>, Box<dyn std::error::Error + Send + Sync>> {
        // Check authentication
        if !self.check_auth(&req) {
            return Ok(Response::builder()
                .status(StatusCode::UNAUTHORIZED)
                .body(Body::from("Authentication required"))
                .unwrap());
        }

        // Read request body
        let body = hyper::body::to_bytes(req.into_body())
            .await
            .map_err(|e| Box::<dyn std::error::Error + Send + Sync>::from(e.to_string()))?;
        let json = String::from_utf8(body.to_vec()).map_err(|_| {
            Box::<dyn std::error::Error + Send + Sync>::from("Invalid UTF-8 in request body")
        })?;

        // Parse JSON
        let import_data: serde_json::Value = serde_json::from_str(&json).map_err(|e| {
            Box::<dyn std::error::Error + Send + Sync>::from(format!("Invalid JSON: {}", e))
        })?;

        // Extract buildings from JSON
        let buildings = import_data["buildings"].as_array().ok_or_else(|| {
            Box::<dyn std::error::Error + Send + Sync>::from("Missing 'buildings' array")
        })?;

        let mut vm = self.vm.write().await;

        // Import buildings via the Vec (unlimited capacity)
        let mut imported_count = 0;
        for building_data in buildings {
            if let Ok(building) = serde_json::from_value::<ExportedBuilding>(building_data.clone())
            {
                // Add building through the VM Vec API (handles RAM sync)
                vm.add_building(building.x, building.y, building.type_color, &building.name);

                // Import metadata
                if !building.metadata.is_empty() {
                    vm.building_metadata
                        .insert(building.id, building.metadata.clone());
                }

                imported_count += 1;
            }
        }

        // Update timestamp
        *self.last_update.write().await = Utc::now();

        // Broadcast update to WebSocket clients
        let _ = self.ws_broadcaster.send(WsUpdate::PalaceChanged {
            timestamp: Utc::now().to_rfc3339(),
        });

        Ok(Response::builder()
            .status(StatusCode::OK)
            .header(CONTENT_TYPE, "application/json")
            .body(Body::from(format!(
                r#"{{"status":"success","message":"Memory palace imported successfully","buildings_imported":{}}}"#,
                imported_count
            )))
            .unwrap())
    }

    /// Handle GET /health
    async fn handle_health(
        &self,
    ) -> Result<Response<Body>, Box<dyn std::error::Error + Send + Sync>> {
        let last_update = *self.last_update.read().await;

        let response = serde_json::json!({
            "status": "healthy",
            "timestamp": last_update.to_rfc3339(),
            "version": "1.0.0",
            "websocket_enabled": self.config.enable_websocket
        });

        Ok(Response::builder()
            .status(StatusCode::OK)
            .header(CONTENT_TYPE, "application/json")
            .body(Body::from(serde_json::to_string(&response).unwrap()))
            .unwrap())
    }
}

impl Service<Request<Body>> for HttpServer {
    type Response = Response<Body>;
    type Error = Box<dyn std::error::Error + Send + Sync>;
    type Future = Pin<Box<dyn Future<Output = Result<Self::Response, Self::Error>> + Send>>;

    fn poll_ready(
        &mut self,
        _cx: &mut std::task::Context<'_>,
    ) -> std::task::Poll<Result<(), Self::Error>> {
        std::task::Poll::Ready(Ok(()))
    }

    fn call(&mut self, req: Request<Body>) -> Self::Future {
        let server = self.clone();

        Box::pin(async move {
            let method = req.method().clone();
            let uri = req.uri().clone();
            let path = uri.path();

            match (method, path) {
                // Health check
                (Method::GET, "/health") => server.handle_health().await.map_err(|e| e.into()),

                // Building endpoints
                (Method::GET, "/buildings") => {
                    server.handle_get_buildings().await.map_err(|e| e.into())
                },
                (Method::GET, buildings_path) if buildings_path.starts_with("/buildings/") => {
                    let id_str = buildings_path.strip_prefix("/buildings/").unwrap();
                    match id_str.parse::<u32>() {
                        Ok(id) => server.handle_get_building(id).await.map_err(|e| e.into()),
                        Err(_) => Ok(Response::builder()
                            .status(StatusCode::BAD_REQUEST)
                            .body(Body::from("Invalid building ID"))
                            .unwrap()),
                    }
                },

                // Player endpoint
                (Method::GET, "/player") => server.handle_get_player().await.map_err(|e| e.into()),

                // Import endpoint
                (Method::POST, "/api/memory_palace/import") => {
                    server.handle_import_palace(req).await.map_err(|e| e.into())
                },

                // 404 for other routes
                _ => Ok(Response::builder()
                    .status(StatusCode::NOT_FOUND)
                    .body(Body::from("Not Found"))
                    .unwrap()),
            }
        })
    }
}

/// HTTP server configuration from command line args
pub struct ServerConfig {
    pub enabled: bool,
    pub addr: String,
    pub port: u16,
    pub auth_token: Option<String>,
    pub enable_websocket: bool,
}

impl Default for ServerConfig {
    fn default() -> Self {
        Self {
            enabled: false,
            addr: "127.0.0.1".to_string(),
            port: 4242,
            auth_token: None,
            enable_websocket: true,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ws_update_serialization() {
        let update = WsUpdate::PlayerMoved {
            x: 100,
            y: 200,
            facing: 1,
        };
        let json = serde_json::to_string(&update).unwrap();
        assert!(json.contains("PlayerMoved"));
    }

    #[test]
    fn test_http_config_default() {
        let config = HttpConfig::default();
        assert_eq!(config.addr, "127.0.0.1");
        assert_eq!(config.port, 4242);
        assert!(config.enable_websocket);
    }

    #[test]
    fn test_server_config_default() {
        let config = ServerConfig::default();
        assert!(!config.enabled);
        assert_eq!(config.addr, "127.0.0.1");
        assert_eq!(config.port, 4242);
        assert!(config.enable_websocket);
    }
}
