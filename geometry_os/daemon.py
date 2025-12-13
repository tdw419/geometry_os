#!/usr/bin/env python3
"""
Geometric Trace OS - Unified Daemon
Combines the Weaver, Avatar Server, and Kernel into a single executable process
"""

import asyncio
import threading
import time
import uvicorn
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from geometry_os.nexus import Nexus as PersistentNexus
from geometry_os.cognition import LearningOracle
from geometry_os.kernel import Kernel as GeometricKernel
from geometry_os.weaver import BackgroundWeaver
from geometry_os.federation import FederationClient
import json
import logging
from datetime import datetime

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(),
        logging.FileHandler('geometry_os_daemon.log')
    ]
)
logger = logging.getLogger(__name__)

class GeometryOSDaemon:
    """
    Unified daemon that runs all G-OS components
    """

    def __init__(self, nexus_path="nexus.db", federation_server=None):
        logger.info("🌀 Initializing Geometric Trace OS Daemon")

        # Initialize components
        self.nexus = PersistentNexus(nexus_path)
        self.kernel = GeometricKernel(self.nexus)
        self.oracle = LearningOracle(self.nexus, self.kernel)
        self.weaver = BackgroundWeaver(self.nexus)
        self.federation = FederationClient(self.nexus, federation_server)

        # Web interface
        self.app = FastAPI()
        self._setup_routes()
        self.active_connections = []

        # Statistics
        self.start_time = datetime.now()
        self.metrics = {
            'intents_processed': 0,
            'skills_accumulated': 0,
            'federation_syncs': 0,
            'last_activity': self.start_time
        }

        logger.info(f"📊 Loaded {len(self.nexus.nodes)} nodes")
        logger.info(f"🧠 Loaded {len(self.oracle.skill_cache)} skills")
        logger.info("✅ Daemon initialization complete")

    def _setup_routes(self):
        """Configure FastAPI routes"""

        @self.app.get("/")
        async def root():
            return {
                "name": "Geometric Trace OS",
                "version": "1.0",
                "status": "operational",
                "uptime": str(datetime.now() - self.start_time)
            }

        @self.app.get("/health")
        async def health():
            return {
                "status": "healthy",
                "nodes": len(self.nexus.nodes),
                "skills": len(self.oracle.skill_cache),
                "metrics": self.metrics,
                "uptime": str(datetime.now() - self.start_time)
            }

        @self.app.get("/visualization")
        async def get_visualization():
            """Get current Nexus visualization data"""
            return self._generate_visualization_data()

        @self.app.websocket("/ws")
        async def websocket_endpoint(websocket: WebSocket):
            """WebSocket endpoint for real-time interaction"""
            await websocket.accept()
            self.active_connections.append(websocket)

            # Send initial state
            await websocket.send_json({
                "type": "state",
                "nodes": len(self.nexus.nodes),
                "skills": len(self.oracle.skill_cache),
                "visualization": self._generate_visualization_data()
            })

            try:
                while True:
                    data = await websocket.receive_text()
                    await self._handle_websocket_message(websocket, data)
            except WebSocketDisconnect:
                self.active_connections.remove(websocket)
                logger.info("🔴 Client disconnected")

    async def _handle_websocket_message(self, websocket, message):
        """Handle incoming WebSocket messages"""
        try:
            data = json.loads(message)
            intent = data.get("intent")

            if not intent:
                await websocket.send_json({"error": "No intent provided"})
                return

            logger.info(f"📝 Received intent: {intent}")

            # Execute intent
            start_time = time.time()
            result = self.oracle.execute(intent)
            execution_time = time.time() - start_time

            # Update metrics
            self.metrics['intents_processed'] += 1
            self.metrics['last_activity'] = datetime.now()

            # Broadcast result to all clients
            response = {
                "type": "result",
                "intent": intent,
                "result": result.output,
                "confidence": result.confidence,
                "execution_time": execution_time,
                "skills_used": len(result.skills_used) if hasattr(result, 'skills_used') else 0,
                "visualization": self._generate_visualization_data()
            }

            for conn in self.active_connections:
                await conn.send_json(response)

            logger.info(f"✅ Intent processed in {execution_time:.3f}s (confidence: {result.confidence:.1%})")

        except Exception as e:
            logger.error(f"❌ Error processing intent: {e}")
            await websocket.send_json({"error": str(e)})

    def _generate_visualization_data(self):
        """Generate data for 3D visualization"""
        # This would be enhanced with actual graph data in production
        return {
            "nodes": [
                {"id": f"node_{i}", "type": "code", "label": f"Code {i}"}
                for i in range(min(50, len(self.nexus.nodes)))
            ],
            "edges": [
                {"source": f"node_{i}", "target": f"node_{i+1}", "strength": 0.8}
                for i in range(min(49, len(self.nexus.nodes) - 1))
            ],
            "skills": [
                {"id": f"skill_{i}", "intent": f"Intent {i}", "confidence": 0.9}
                for i in range(len(self.oracle.skill_cache))
            ]
        }

    def start_background_tasks(self):
        """Start background processes"""
        logger.info("🔄 Starting background tasks")

        # Start Weaver in background thread
        weaver_thread = threading.Thread(target=self._run_weaver, daemon=True)
        weaver_thread.start()

        # Start Federation sync in background
        if self.federation.hive_url:
            federation_thread = threading.Thread(target=self._run_federation_sync, daemon=True)
            federation_thread.start()

    def _run_weaver(self):
        """Run the background weaver"""
        logger.info("🕸️  Weaver started - maintaining graph health")
        while True:
            try:
                self.weaver.continuous_weave()
                logger.info("🕸️  Weaver cycle completed")
            except Exception as e:
                logger.error(f"❌ Weaver error: {e}")
            time.sleep(60)  # Run every 60 seconds

    def _run_federation_sync(self):
        """Run federation synchronization"""
        logger.info("🌍 Federation client started")
        while True:
            try:
                # Sync every 5 minutes
                self.federation.sync_from_hive()
                self.metrics['federation_syncs'] += 1
                logger.info("🌍 Federation sync completed")
            except Exception as e:
                logger.error(f"❌ Federation error: {e}")
            time.sleep(300)  # Sync every 5 minutes

    def run(self, host="0.0.0.0", port=8000):
        """Start the daemon"""
        logger.info(f"🚀 Starting Geometry OS Daemon on {host}:{port}")

        # Start background tasks
        self.start_background_tasks()

        # Start web server
        config = uvicorn.Config(
            self.app,
            host=host,
            port=port,
            log_level="info"
        )
        server = uvicorn.Server(config)

        # Run server
        server.run()

def main():
    """Main entry point"""
    import argparse

    parser = argparse.ArgumentParser(description="Geometric Trace OS Daemon")
    parser.add_argument("--host", default="0.0.0.0", help="Host address")
    parser.add_argument("--port", type=int, default=8000, help="Port number")
    parser.add_argument("--nexus", default="nexus.db", help="Nexus database path")
    parser.add_argument("--federation", help="Federation server URL")

    args = parser.parse_args()

    # Create and run daemon
    daemon = GeometryOSDaemon(
        nexus_path=args.nexus,
        federation_server=args.federation
    )

    daemon.run(host=args.host, port=args.port)

if __name__ == "__main__":
    main()