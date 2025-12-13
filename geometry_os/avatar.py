
import json
import asyncio
import os
import sys
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.responses import HTMLResponse
from fastapi.middleware.cors import CORSMiddleware

# Add project root to path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../')))

from geometry_os.nexus import Nexus
from geometry_os.kernel import Kernel
from geometry_os.oracle import RealOracle
from geometry_os.visualizer import NexusVisualizer

# --- CONFIG ---
DB_PATH = "geometry_os/demos/persistent_demo.db"

# --- INTIALIZE OS ---
print("🌀  Booting Avatar Server...")
nexus = Nexus(DB_PATH) 
kernel = Kernel(nexus)
# Note: For production, handle RealOracle import error gracefully,
# but here we assume Phase 3 completed successfully.
try:
    oracle = RealOracle(nexus, kernel)
    print("🧠  Real Brain Online")
except:
    from geometry_os.oracle import Oracle
    oracle = Oracle(nexus, kernel)
    print("💻  Simulated Brain Online")

visualizer = NexusVisualizer(nexus)

# --- SERVER ---
app = FastAPI(title="Geometry OS Avatar")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

HTML_CLIENT = """
<!DOCTYPE html>
<html>
<head>
    <title>Geometry OS Avatar</title>
    <script src="https://cdn.plot.ly/plotly-2.27.0.min.js"></script>
    <style>
        body { margin: 0; background: #050505; color: #0f0; font-family: monospace; overflow: hidden; }
        #container { display: flex; height: 100vh; }
        #nexus { flex: 2; height: 100%; border-right: 1px solid #333; }
        #console { flex: 1; display: flex; flex-direction: column; padding: 10px; background: #0a0a0a; }
        #log { flex: 1; overflow-y: auto; white-space: pre-wrap; color: #bbb; }
        #input-box { display: flex; margin-top: 10px; border-top: 1px solid #333; padding-top: 10px; }
        input { flex: 1; background: #111; border: 1px solid #333; color: white; padding: 10px; font-family: monospace; }
        button { background: #00ff00; color: black; border: none; padding: 10px 20px; cursor: pointer; font-weight: bold; }
        .system { color: #0ff; }
        .user { color: #ff0; }
        .error { color: #f00; }
        h1 { margin: 0 0 10px 0; font-size: 18px; color: #00ff00; text-transform: uppercase; letter-spacing: 2px; }
    </style>
</head>
<body>
    <div id="container">
        <div id="nexus"></div>
        <div id="console">
            <h1>Geometric Trace OS // v0.1</h1>
            <div id="log"></div>
            <div id="input-box">
                <input type="text" id="cmd" placeholder="Enter Intent..." autofocus>
                <button onclick="sendIntent()">EXECUTE</button>
            </div>
        </div>
    </div>
    <script>
        const ws = new WebSocket("ws://localhost:8000/ws");
        const logDiv = document.getElementById("log");
        const nexusDiv = document.getElementById("nexus");

        function log(msg, cls="system") {
            const div = document.createElement("div");
            div.textContent = `> ${msg}`;
            div.className = cls;
            logDiv.appendChild(div);
            logDiv.scrollTop = logDiv.scrollHeight;
        }

        ws.onopen = () => log("Connected to Kernel Interface...");
        ws.onmessage = (event) => {
            const data = JSON.parse(event.data);
            if (data.type === "log") {
                log(data.msg);
            } else if (data.type === "graph") {
                const fig = JSON.parse(data.json);
                Plotly.react(nexusDiv, fig.data, fig.layout);
            } else if (data.type === "result") {
                log(`TRACE COMPLETE [Confidence: ${data.confidence}]`, "system");
                log(`Outcome: ${data.outcome}`, "system");
            }
        };

        function sendIntent() {
            const input = document.getElementById("cmd");
            const intent = input.value;
            if (!intent) return;
            log(intent, "user");
            ws.send(JSON.stringify({action: "execute", intent: intent}));
            input.value = "";
        }

        document.getElementById("cmd").addEventListener("keypress", (e) => {
            if (e.key === "Enter") sendIntent();
        });
    </script>
</body>
</html>
"""

@app.get("/")
async def get():
    return HTMLResponse(HTML_CLIENT)

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    
    # Send initial graph state
    graph_json = visualizer.generate_3d_state()
    await websocket.send_json({"type": "graph", "json": graph_json})
    await websocket.send_json({"type": "log", "msg": "Avatar Online. Nexus Visualized."})

    try:
        while True:
            data = await websocket.receive_json()
            if data.get("action") == "execute":
                intent = data.get("intent")
                await websocket.send_json({"type": "log", "msg": f"Processing Intent: '{intent}'..."})
                
                # Execute Intent
                trace = await oracle.execute_intent(intent)
                
                if trace:
                    # Send result
                    await websocket.send_json({
                        "type": "result", 
                        "outcome": str(trace.outcome)[:100] + "...",
                        "confidence": trace.confidence
                    })
                    
                    # Update Graph Visualization (New nodes added)
                    new_graph = visualizer.generate_3d_state()
                    await websocket.send_json({"type": "graph", "json": new_graph})
                else:
                     await websocket.send_json({"type": "log", "msg": "Execution Failed."})
                     
    except WebSocketDisconnect:
        print("Client disconnected")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
