"""Monitoring dashboard for AI PM system."""
from fastapi import FastAPI, WebSocket, Header, HTTPException, UploadFile
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse, JSONResponse, FileResponse
from pathlib import Path
from pydantic import BaseModel
from typing import Optional, List, Dict
import asyncio
import sys
from os import path
import json
import base64
import io
import re
from datetime import datetime

# Constants for file handling
MAX_FILE_SIZE = 10 * 1024 * 1024  # 10MB max file size
ALLOWED_FILENAME_PATTERN = re.compile(r'^[\w,\s-]+(\.[A-Za-z0-9]{1,10}){1,3}$')

# Import GSDParser from parent package
try:
    from ai_project_management.gsd_parser import GSDParser
except ImportError:
    # Fallback - try direct import
    try:
        from gsd_parser import GSDParser
    except ImportError:
        GSDParser = None

# Import spatial analyzer
try:
    from ai_project_management.spatial.analyzer import RTSSpatialAnalyzer, analyze_rts_file
except ImportError:
    RTSSpatialAnalyzer = None
    analyze_rts_file = None

class ConnectionManager:
    """Manages WebSocket connections for real-time updates."""

    def __init__(self):
        self.active_connections: List[WebSocket] = []
        self.client_data: Dict[WebSocket, Dict] = {}

    async def connect(self, websocket: WebSocket, client_id: str) -> None:
        """Connect a new client."""
        await websocket.accept()
        self.active_connections.append(websocket)
        self.client_data[websocket] = {
            "client_id": client_id,
            "connected_at": asyncio.get_event_loop().time()
        }

    def disconnect(self, websocket: WebSocket) -> Optional[Dict]:
        """Disconnect a client and return their data."""
        if websocket in self.active_connections:
            self.active_connections.remove(websocket)
        data = self.client_data.pop(websocket, None)
        return data

    async def broadcast(self, message: Dict, exclude: Optional[WebSocket] = None) -> None:
        """Broadcast a message to all connected clients."""
        disconnected = []
        for connection in self.active_connections:
            if connection != exclude:
                try:
                    await connection.send_json(message)
                except Exception:
                    disconnected.append(connection)

        # Clean up disconnected clients
        for conn in disconnected:
            self.disconnect(conn)

    async def send_personal(self, message: Dict, websocket: WebSocket) -> bool:
        """Send a message to a specific client."""
        try:
            await websocket.send_json(message)
            return True
        except Exception:
            return False

    def get_client_count(self) -> int:
        """Get the number of connected clients."""
        return len(self.active_connections)

    def get_client_info(self, websocket: WebSocket) -> Optional[Dict]:
        """Get info about a specific client."""
        return self.client_data.get(websocket)


# Global connection manager
manager = ConnectionManager()


app = FastAPI(title="AI PM Dashboard")

# Find the .planning directory relative to this file
# __file__ is in ai_project_management/src/ai_project_management/dashboard/
# .planning is in ai_project_management/.planning
def find_planning_path() -> Path:
    """Find the .planning directory by searching upward from the package."""
    # Start from the dashboard module location
    current = Path(__file__).resolve()

    # Search up the tree for .planning directory
    for _ in range(6):  # Go up at most 6 levels
        current = current.parent
        planning_path = current / ".planning"
        if planning_path.exists():
            return planning_path

    # Fallback to cwd/.planning
    return Path.cwd() / ".planning"

DEFAULT_PLANNING_PATH = find_planning_path()


def get_planning_path(x_planning_path: Optional[str] = None) -> Path:
    """Get planning path from header or default."""
    if x_planning_path:
        return Path(x_planning_path)
    return DEFAULT_PLANNING_PATH


def sanitize_filename(filename: str) -> str:
    """
    Sanitize a filename to prevent path traversal attacks.

    Removes any directory components, removes special characters that could
    be used for path traversal, and validates the filename format.

    Args:
        filename: The filename to sanitize

    Returns:
        A sanitized filename safe for use in file operations

    Raises:
        HTTPException: If the filename contains suspicious patterns
    """
    if not filename:
        raise HTTPException(status_code=400, detail="Filename cannot be empty")

    # Remove any null bytes
    filename = filename.replace('\x00', '')

    # Check for suspicious patterns BEFORE stripping
    if '..' in filename or filename.startswith('/') or filename.startswith('\\'):
        raise HTTPException(status_code=400, detail="Invalid filename format")

    # Remove any directory paths (prevent ../ attacks)
    filename = Path(filename).name

    # Validate filename pattern
    if not ALLOWED_FILENAME_PATTERN.match(filename):
        raise HTTPException(status_code=400, detail="Filename contains invalid characters")

    return filename

# State
state = {
    "active_tasks": [],
    "completed_tasks": [],
    "neuromodulation": {"dopamine": 0.5, "urgency": 0.3, "acetylcholine": 0.2},
}


@app.get("/api/status")
async def get_status():
    """Get current system status."""
    return {
        "active_tasks": len(state["active_tasks"]),
        "completed_tasks": len(state["completed_tasks"]),
        "neuromodulation": state["neuromodulation"],
    }


@app.get("/api/tasks")
async def get_tasks():
    """Get all tasks."""
    return {
        "active": state["active_tasks"],
        "completed": state["completed_tasks"],
    }


@app.get("/api/pm/projects")
async def get_projects(x_planning_path: Optional[str] = Header(None)):
    """Get all projects from .planning directory."""
    if GSDParser is None:
        raise HTTPException(status_code=503, detail="GSDParser not available")
    
    # If a specific path was requested but doesn't exist, return empty list
    if x_planning_path and not Path(x_planning_path).exists():
        return {"projects": []}
        
    planning_path = get_planning_path(x_planning_path)
    if not planning_path.exists():
        # Return demo project
        return {"projects": [get_demo_project("default")]}
    try:
        parser = GSDParser(planning_path)
        project_data = parser.get_full_project_data()
        projects = [{
            "id": "default",
            "is_demo": False,
            "name": project_data["name"],
            "description": project_data.get("vision", ""),
            "position": {"x": 0, "y": 0},
            "phases": []
        }]
        for phase in project_data.get("phases", []):
            projects[0]["phases"].append({
                "id": phase["id"],
                "name": phase["name"],
                "status": phase["status"],
                "directory": phase["directory"],
                "task_count": len(phase.get("tasks", []))
            })
        return {"projects": projects}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/project/{project_id}")
async def get_project(project_id: str, x_planning_path: Optional[str] = Header(None)):
    """Get detailed project information."""
    if GSDParser is None:
        raise HTTPException(status_code=503, detail="GSDParser not available")
    planning_path = get_planning_path(x_planning_path)
    if not planning_path.exists():
        # Return demo data
        return get_demo_project(project_id)
    try:
        parser = GSDParser(planning_path)
        project_data = parser.get_full_project_data()
        phase_width = 100 // max(len(project_data.get("phases", [])), 1)
        phases = []
        for i, phase in enumerate(project_data.get("phases", [])):
            phases.append({
                "id": phase["id"],
                "name": phase["name"],
                "status": phase["status"],
                "directory": phase["directory"],
                "position": {"x": i * phase_width, "y": 0, "width": phase_width, "height": 100},
                "tasks": [{
                    "id": task["id"],
                    "name": task["title"],
                    "description": task["description"],
                    "status": task.get("status", "pending"),
                    "priority": task.get("priority", "medium"),
                    "subtasks": task.get("subtasks", []),
                    "progress": task.get("progress", 0),
                    "dependencies": task.get("dependencies", []),
                    "position": {"x": i * phase_width + 5, "y": 5 + (len(phases) * 10)}
                } for task in phase.get("tasks", [])]
            })
        return {
            "id": project_id,
            "is_demo": False,
            "name": project_data["name"],
            "description": project_data.get("vision", ""),
            "position": {"x": 0, "y": 0},
            "phases": phases
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/phases")
async def get_phases(x_planning_path: Optional[str] = Header(None)):
    """Get all phases."""
    if GSDParser is None:
        raise HTTPException(status_code=503, detail="GSDParser not available")
    planning_path = get_planning_path(x_planning_path)
    if not planning_path.exists():
        # Return demo phases
        demo = get_demo_project("default")
        return {"phases": [{"id": p["id"], "name": p["name"], "status": p["status"], "directory": p["directory"]} for p in demo["phases"]]}
    try:
        parser = GSDParser(planning_path)
        phases = parser.parse_phases()
        return {"phases": phases}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/tasks")
async def get_pm_tasks(x_planning_path: Optional[str] = Header(None)):
    """Get all tasks across all phases."""
    if GSDParser is None:
        raise HTTPException(status_code=503, detail="GSDParser not available")
    planning_path = get_planning_path(x_planning_path)
    if not planning_path.exists():
        # Return demo tasks
        demo = get_demo_project("default")
        all_tasks = []
        for phase in demo["phases"]:
            for task in phase.get("tasks", []):
                task["phase_id"] = phase["id"]
                task["phase_name"] = phase["name"]
                all_tasks.append(task)
        return {"tasks": all_tasks}
    try:
        parser = GSDParser(planning_path)
        phases = parser.parse_phases()
        all_tasks = []
        for phase in phases:
            tasks = parser.parse_tasks(phase["directory"])
            for task in tasks:
                task["phase_id"] = phase["id"]
                task["phase_name"] = phase["name"]
            all_tasks.extend(tasks)
        return {"tasks": all_tasks}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/pm/init")
async def init_project(x_planning_path: Optional[str] = Header(None)):
    """Initialize a new project with default structure."""
    planning_path = get_planning_path(x_planning_path)
    
    if planning_path.exists():
        return {"status": "already_exists", "message": "Project already initialized"}
        
    try:
        # Create directory structure
        planning_path.mkdir(parents=True, exist_ok=True)
        (planning_path / "phases").mkdir(exist_ok=True)
        
        # Create PROJECT.md
        project_content = """# New Project

## Vision
To build something amazing.

## Requirements
- REQ-001: Initial setup
"""
        (planning_path / "PROJECT.md").write_text(project_content)
        
        # Create ROADMAP.md
        roadmap_content = """# Project Roadmap

## Phase 1: Inception
Status: in-progress
Initial planning and setup.

## Phase 2: Execution
Status: pending
Core development.

## Phase 3: Launch
Status: pending
Deployment and release.
"""
        (planning_path / "ROADMAP.md").write_text(roadmap_content)
        
        return {"status": "success", "message": "Project initialized successfully"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# Pydantic models for write operations
class TaskCreate(BaseModel):
    id: str
    title: str
    description: str = ""
    status: str = "pending"
    priority: str = "medium"
    subtasks: List[Dict] = []
    dependencies: List[str] = []

class TaskUpdate(BaseModel):
    title: Optional[str] = None
    description: Optional[str] = None
    status: Optional[str] = None
    priority: Optional[str] = None
    subtasks: Optional[List[Dict]] = None
    dependencies: Optional[List[str]] = None


@app.post("/api/pm/phase/{phase_id}/task")
async def create_task(phase_id: str, task: TaskCreate, x_planning_path: Optional[str] = Header(None)):
    """Create a new task in a phase."""
    if GSDParser is None:
        raise HTTPException(status_code=503, detail="GSDParser not available")
    planning_path = get_planning_path(x_planning_path)
    try:
        parser = GSDParser(planning_path)
        phases = parser.parse_phases()
        phase = next((p for p in phases if p['id'] == phase_id), None)

        if not phase:
            raise HTTPException(status_code=404, detail="Phase not found")

        parser.write_task(phase['directory'], task.model_dump())

        # Broadcast to all connected clients
        await manager.broadcast({
            "type": "entity_created",
            "entity_type": "task",
            "entity_id": task.id,
            "phase_id": phase_id
        })

        return {"id": task.id, "status": "created"}
    except FileNotFoundError:
        raise HTTPException(status_code=404, detail="Planning directory not found")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.put("/api/pm/task/{task_id}")
async def update_task(task_id: str, task: TaskUpdate, x_planning_path: Optional[str] = Header(None)):
    """Update an existing task."""
    if GSDParser is None:
        raise HTTPException(status_code=503, detail="GSDParser not available")
    planning_path = get_planning_path(x_planning_path)
    try:
        parser = GSDParser(planning_path)

        # Find task
        phases = parser.parse_phases()
        for phase in phases:
            tasks = parser.parse_tasks(phase['directory'])
            existing = next((t for t in tasks if t['id'] == task_id), None)
            if existing:
                # Merge updates
                updated = existing.copy()
                for field, value in task.model_dump(exclude_unset=True).items():
                    if value is not None:
                        updated[field] = value

                parser.write_task(phase['directory'], updated)

                # Broadcast to all connected clients
                await manager.broadcast({
                    "type": "entity_updated",
                    "entity_type": "task",
                    "entity_id": task_id,
                    "updates": task.model_dump(exclude_unset=True)
                })

                return {"id": task_id, "status": "updated"}

        raise HTTPException(status_code=404, detail="Task not found")
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.delete("/api/pm/task/{task_id}")
async def delete_task(task_id: str, x_planning_path: Optional[str] = Header(None)):
    """Delete a task."""
    if GSDParser is None:
        raise HTTPException(status_code=503, detail="GSDParser not available")
    planning_path = get_planning_path(x_planning_path)
    try:
        parser = GSDParser(planning_path)
        phases = parser.parse_phases()

        for phase in phases:
            if parser.delete_task(phase['directory'], task_id):
                # Broadcast to all connected clients
                await manager.broadcast({
                    "type": "entity_deleted",
                    "entity_type": "task",
                    "entity_id": task_id
                })

                return {"id": task_id, "status": "deleted"}

        raise HTTPException(status_code=404, detail="Task not found")
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    """WebSocket for real-time updates with connection management."""
    import uuid
    client_id = str(uuid.uuid4())[:8]

    await manager.connect(websocket, client_id)

    # Notify others of new client
    await manager.broadcast({
        "type": "client_joined",
        "client_id": client_id,
        "user_count": manager.get_client_count()
    }, exclude=websocket)

    # Send welcome message with current user list
    await manager.send_personal({
        "type": "welcome",
        "client_id": client_id,
        "user_count": manager.get_client_count()
    }, websocket)

    try:
        while True:
            # Receive messages from client
            data = await websocket.receive_json()

            # Handle different message types
            msg_type = data.get("type")

            if msg_type == "cursor_moved":
                # Broadcast cursor position to other clients
                await manager.broadcast({
                    "type": "cursor_moved",
                    "client_id": client_id,
                    "x": data.get("x"),
                    "y": data.get("y")
                }, exclude=websocket)

            elif msg_type == "ping":
                # Respond to ping with pong
                await manager.send_personal({
                    "type": "pong",
                    "timestamp": data.get("timestamp")
                }, websocket)

    except Exception as e:
        print(f"WebSocket error: {e}")
    finally:
        # Notify others of client leaving
        manager.disconnect(websocket)
        await manager.broadcast({
            "type": "client_left",
            "client_id": client_id,
            "user_count": manager.get_client_count()
        })


@app.get("/ai-pm", response_class=HTMLResponse)
async def ai_pm_dashboard():
    """Serve AI PM Spatial Map dashboard."""
    ai_pm_path = Path(__file__).parent / "static" / "ai_pm" / "ai_pm.html"
    if ai_pm_path.exists():
        return ai_pm_path.read_text()
    return "<h1>AI PM Dashboard not found</h1>", 404


# Mount static files for AI PM
app.mount("/static/ai_pm", StaticFiles(directory=str(Path(__file__).parent / "static" / "ai_pm")), name="ai_pm_static")


# ============================================================================
# RTS Export/Import Endpoints - For AI Visual Debugging
# ============================================================================

# Create exports directory
RTS_EXPORTS_DIR = Path(__file__).parent.parent.parent.parent / ".ai-pm-artifacts" / "rts_exports"
RTS_EXPORTS_DIR.mkdir(parents=True, exist_ok=True)


class RTSExportRequest(BaseModel):
    """Request model for RTS export."""
    format: str  # 'brts' or 'pixelrts'
    state: Dict
    filename: Optional[str] = None
    resolution: Optional[int] = 1024


class PixelRTSRequest(BaseModel):
    """Request model for PixelRTS export."""
    imageData: str  # Base64 PNG data
    state: Dict
    resolution: int = 1024
    filename: Optional[str] = None


class TiledRTSRequest(BaseModel):
    """Request model for tiled RTS export."""
    tiles: List[Dict]
    tileSize: int = 512
    overlap: int = 64
    format: str = 'pixelrts'
    baseFilename: Optional[str] = None


@app.post("/api/pm/export/rts")
async def export_rts(request: RTSExportRequest):
    """Export map state to bRTS (Binary Recursive Transposition Schema) format.

    The bRTS format includes:
    - JSON metadata with map state
    - Tensor data for phase territories and task positions
    - Entity relationships and dependencies
    """
    try:
        # Sanitize filename if provided
        if request.filename:
            filename = sanitize_filename(request.filename)
        else:
            filename = f"ai_pm_map_{datetime.now().strftime('%Y%m%d_%H%M%S')}.brts.json"
        export_path = RTS_EXPORTS_DIR / filename

        # Create bRTS-compatible structure
        brts_data = {
            "metadata": {
                "version": "1.0",
                "format": "bRTS",
                "timestamp": datetime.now().isoformat(),
                "exportId": request.state.get("metadata", {}).get("exportId"),
                "description": "AI PM Spatial Map - Binary Recursive Transposition Schema"
            },
            "root": {
                "metadata": {
                    "type": "directory",
                    "name": "ai_pm_map"
                },
                "children": {
                    "state.json": {
                        "metadata": {"type": "file", "name": "state.json"},
                        "content": base64.b64encode(json.dumps(request.state).encode()).decode()
                    },
                    "project.json": {
                        "metadata": {"type": "file", "name": "project.json"},
                        "content": base64.b64encode(json.dumps(request.state.get("project", {})).encode()).decode()
                    },
                    "entities.json": {
                        "metadata": {"type": "file", "name": "entities.json"},
                        "content": base64.b64encode(json.dumps(request.state.get("entities", {})).encode()).decode()
                    },
                    "metadata.json": {
                        "metadata": {"type": "file", "name": "metadata.json"},
                        "content": base64.b64encode(json.dumps(request.state.get("metadata", {})).encode()).decode()
                    },
                    "ai_debug.json": {
                        "metadata": {"type": "file", "name": "ai_debug.json"},
                        "content": base64.b64encode(json.dumps(generate_ai_debug_metadata(request.state), indent=2).encode()).decode()
                    }
                }
            }
        }

        # Write to file
        export_path.write_text(json.dumps(brts_data, indent=2))

        return {
            "status": "success",
            "format": "bRTS",
            "exportId": request.state.get("metadata", {}).get("exportId"),
            "filename": filename,
            "path": str(export_path),
            "size": export_path.stat().st_size,
            "url": f"/api/pm/export/download/{filename}"
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/pm/export/pixelrts")
async def export_pixelrts(request: PixelRTSRequest):
    """Export map state to PixelRTS format for AI vision inspection.

    The PixelRTS format includes:
    - PNG image of the current map view
    - JSON metadata with AI-friendly descriptions
    - Entity positions and relationships encoded in image
    """
    try:
        # Sanitize filename if provided
        if request.filename:
            filename = sanitize_filename(request.filename)
        else:
            filename = f"ai_pm_map_{datetime.now().strftime('%Y%m%d_%H%M%S')}.rts.png"
        export_path = RTS_EXPORTS_DIR / filename

        # Decode base64 image data
        image_data = base64.b64decode(request.imageData.split(',')[1])

        # Write PNG
        export_path.write_bytes(image_data)

        # Write companion metadata file
        metadata_filename = filename.replace('.png', '.meta.json')
        metadata_path = RTS_EXPORTS_DIR / metadata_filename

        metadata = {
            "version": "1.0",
            "format": "PixelRTS",
            "timestamp": datetime.now().isoformat(),
            "imageFile": filename,
            "resolution": request.resolution,
            "state": request.state,
            "aiInstructions": {
                "description": "AI PM Spatial Map rendered as pixel tensor substrate",
                "howToRead": [
                    "Each colored region is a project phase",
                    "Small squares are tasks within phases",
                    "Colors indicate status: green=complete, orange=in-progress, gray=pending",
                    "Border thickness indicates priority level",
                    "Progress bars show phase completion"
                ],
                "debuggingHints": [
                    "Look for stuck tasks (gray for long periods)",
                    "Check for phases with many incomplete tasks",
                    "Verify dependencies are properly linked",
                    "Identify bottlenecks in the workflow"
                ]
            }
        }

        metadata_path.write_text(json.dumps(metadata, indent=2))

        return {
            "status": "success",
            "format": "PixelRTS",
            "filename": filename,
            "metadataFilename": metadata_filename,
            "path": str(export_path),
            "size": export_path.stat().st_size,
            "previewUrl": f"/api/pm/export/download/{filename}",
            "metadataUrl": f"/api/pm/export/download/{metadata_filename}"
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/pm/export/tiledrts")
async def export_tiledrts(request: TiledRTSRequest):
    """Export map as tiled RTS for infinite scroll.

    Each phase becomes a separate tile that can be loaded on demand.
    """
    try:
        # Sanitize base filename if provided
        if request.baseFilename:
            base_filename = sanitize_filename(request.baseFilename)
        else:
            base_filename = f"ai_pm_tiles_{datetime.now().strftime('%Y%m%d_%H%M%S')}"

        tiles_created = []

        for i, tile in enumerate(request.tiles):
            tile_filename = f"{base_filename}_tile_{i:03d}.json"
            tile_path = RTS_EXPORTS_DIR / tile_filename

            tile_data = {
                "metadata": {
                    "type": "phase_tile",
                    "tileIndex": i,
                    "phaseId": tile.get("phaseId"),
                    "phaseName": tile.get("phaseName"),
                    "tileSize": request.tileSize,
                    "overlap": request.overlap,
                    "timestamp": datetime.now().isoformat()
                },
                "position": tile.get("position"),
                "tasks": tile.get("tasks", []),
                "entityCount": len(tile.get("tasks", []))
            }

            tile_path.write_text(json.dumps(tile_data, indent=2))
            tiles_created.append({
                "tileIndex": i,
                "filename": tile_filename,
                "path": str(tile_path)
            })

        # Write tile index
        index_filename = f"{base_filename}_index.json"
        index_path = RTS_EXPORTS_DIR / index_filename

        index_data = {
            "metadata": {
                "version": "1.0",
                "format": "TiledRTS",
                "timestamp": datetime.now().isoformat(),
                "tileCount": len(tiles_created),
                "tileSize": request.tileSize,
                "overlap": request.overlap
            },
            "tiles": tiles_created
        }

        index_path.write_text(json.dumps(index_data, indent=2))

        return {
            "status": "success",
            "format": "TiledRTS",
            "baseFilename": base_filename,
            "tileCount": len(tiles_created),
            "tiles": tiles_created,
            "indexFile": index_filename
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/export/download/{filename}")
async def download_export(filename: str):
    """Download an exported RTS file."""
    # Sanitize filename to prevent path traversal
    safe_filename = sanitize_filename(filename)
    file_path = RTS_EXPORTS_DIR / safe_filename

    if not file_path.exists():
        raise HTTPException(status_code=404, detail="Export file not found")

    return FileResponse(
        path=str(file_path),
        filename=safe_filename,
        media_type="application/octet-stream"
    )


@app.get("/api/pm/export/list")
async def list_exports():
    """List all available RTS exports."""
    exports = []

    for file_path in RTS_EXPORTS_DIR.iterdir():
        if file_path.is_file():
            stat = file_path.stat()
            exports.append({
                "filename": file_path.name,
                "size": stat.st_size,
                "created": datetime.fromtimestamp(stat.st_ctime).isoformat(),
                "modified": datetime.fromtimestamp(stat.st_mtime).isoformat(),
                "format": detect_rts_format(file_path.name)
            })

    # Sort by modified time, newest first
    exports.sort(key=lambda x: x["modified"], reverse=True)

    return {"exports": exports}


@app.delete("/api/pm/export/{filename}")
async def delete_export(filename: str):
    """Delete an exported RTS file."""
    # Sanitize filename to prevent path traversal
    safe_filename = sanitize_filename(filename)
    file_path = RTS_EXPORTS_DIR / safe_filename

    if not file_path.exists():
        raise HTTPException(status_code=404, detail="Export file not found")

    file_path.unlink()

    return {"status": "deleted", "filename": safe_filename}


@app.post("/api/pm/import/rts")
async def import_rts(file: UploadFile):
    """Import map state from an RTS file."""
    try:
        # Validate file size
        content = await file.read()

        if len(content) > MAX_FILE_SIZE:
            raise HTTPException(
                status_code=413,
                detail=f"File too large. Maximum size is {MAX_FILE_SIZE // (1024 * 1024)}MB"
            )

        if len(content) == 0:
            raise HTTPException(status_code=400, detail="Empty file uploaded")

        # Try to parse as JSON first
        try:
            data = json.loads(content)
            # Handle bRTS format
            if "root" in data:
                # Extract state from bRTS
                state_json = base64.b64decode(data["root"]["children"]["state.json"]["content"]).decode()
                return {
                    "status": "success",
                    "format": "bRTS",
                    "state": json.loads(state_json)
                }
            elif "state" in data:
                # Direct format with state
                return {
                    "status": "success",
                    "format": "JSON",
                    "state": data["state"]
                }
            else:
                # Direct JSON format
                return {
                    "status": "success",
                    "format": "JSON",
                    "state": data
                }
        except json.JSONDecodeError:
            # Not JSON - might be binary format
            return {
                "status": "error",
                "message": "Unsupported RTS format (not JSON/bRTS)"
            }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


# ============================================================================
# RTS Spatial Analysis Endpoints - For AI Spatial Visualization
# ============================================================================

class RTSAnalysisRequest(BaseModel):
    """Request model for RTS spatial analysis."""
    imagePath: Optional[str] = None  # Path to existing .rts.png file
    imageData: Optional[str] = None  # Base64 image data
    resolution: int = 1024
    analysisType: str = "full"  # 'full', 'entropy', 'corruption', 'regions'


@app.post("/api/pm/spatial/analyze")
async def analyze_rts_spatial(request: RTSAnalysisRequest):
    """Perform spatial analysis on an RTS texture map.

    This endpoint analyzes .rts.png files to identify:
    - Entropy hotspots (complex code regions)
    - Corruption detection (all-zero/all-one regions)
    - Spatial locality patterns
    - Task regions (small colored squares)
    - Phase territories (large colored areas)
    """
    if RTSSpatialAnalyzer is None:
        raise HTTPException(
            status_code=503,
            detail="RTSSpatialAnalyzer not available. Install scipy for full functionality."
        )

    try:
        import numpy as np
        from PIL import Image
        import io

        # Get image data
        if request.imageData:
            # Decode base64 image
            image_bytes = base64.b64decode(request.imageData.split(',')[1])
            img = Image.open(io.BytesIO(image_bytes))
            img_array = np.array(img)
        elif request.imagePath:
            # Load from file path
            img_path = Path(request.imagePath)
            if not img_path.exists():
                raise HTTPException(status_code=404, detail="Image file not found")
            img = Image.open(img_path)
            img_array = np.array(img)
        else:
            raise HTTPException(status_code=400, detail="Either imagePath or imageData required")

        # Perform analysis
        analyzer = RTSSpatialAnalyzer(img_array)
        result = analyzer.analyze()

        # Filter based on analysis type
        if request.analysisType == "entropy":
            return {
                "status": "success",
                "analysisType": "entropy",
                "metadata": result["metadata"],
                "entropy": result["entropy"],
                "hotspots": result["hotspots"]
            }
        elif request.analysisType == "corruption":
            return {
                "status": "success",
                "analysisType": "corruption",
                "metadata": result["metadata"],
                "corruption": result["corruption"]
            }
        elif request.analysisType == "regions":
            return {
                "status": "success",
                "analysisType": "regions",
                "metadata": result["metadata"],
                "regions": result["regions"],
                "phase_territories": result["phase_territories"]
            }
        else:  # full analysis
            return {
                "status": "success",
                "analysisType": "full",
                "result": result
            }

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/spatial/analyze/{filename}")
async def analyze_exported_rts(filename: str):
    """Analyze an already exported RTS file."""
    if RTSSpatialAnalyzer is None:
        raise HTTPException(
            status_code=503,
            detail="RTSSpatialAnalyzer not available"
        )

    # Sanitize filename to prevent path traversal
    safe_filename = sanitize_filename(filename)
    file_path = RTS_EXPORTS_DIR / safe_filename

    if not file_path.exists():
        raise HTTPException(status_code=404, detail="Export file not found")

    try:
        result = analyze_rts_file(str(file_path))
        return {
            "status": "success",
            "filename": safe_filename,
            "result": result
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/pm/spatial/export/{filename}")
async def export_analysis(filename: str, request: RTSAnalysisRequest):
    """Export spatial analysis results to JSON file."""
    if RTSSpatialAnalyzer is None:
        raise HTTPException(
            status_code=503,
            detail="RTSSpatialAnalyzer not available"
        )

    try:
        import numpy as np
        from PIL import Image
        import io

        # Sanitize filename to prevent path traversal
        safe_filename = sanitize_filename(filename)
        if request.imageData:
            image_bytes = base64.b64decode(request.imageData.split(',')[1])
            img = Image.open(io.BytesIO(image_bytes))
            img_array = np.array(img)
        elif request.imagePath:
            img_array = np.array(Image.open(request.imagePath))
        else:
            raise HTTPException(status_code=400, detail="Either imagePath or imageData required")

        # Perform analysis and export
        export_path = RTS_EXPORTS_DIR / safe_filename
        analyzer = RTSSpatialAnalyzer(img_array)
        analyzer.export_json(str(export_path))

        return {
            "status": "success",
            "filename": safe_filename,
            "path": str(export_path),
            "url": f"/api/pm/export/download/{safe_filename}"
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/spatial/hotspots")
async def get_entropy_hotspots(limit: int = 10):
    """Get entropy hotspots from recent RTS exports."""
    if RTSSpatialAnalyzer is None:
        raise HTTPException(
            status_code=503,
            detail="RTSSpatialAnalyzer not available"
        )

    all_hotspots = []

    # Analyze recent .rts.png exports
    for file_path in RTS_EXPORTS_DIR.glob("*.rts.png"):
        try:
            result = analyze_rts_file(str(file_path))
            hotspots = result.get("hotspots", [])

            for hotspot in hotspots[:limit]:
                hotspot["source_file"] = file_path.name
                all_hotspots.append(hotspot)
        except Exception:
            continue

    # Sort by score and return top results
    all_hotspots.sort(key=lambda x: x.get("score", 0), reverse=True)

    return {
        "status": "success",
        "hotspots": all_hotspots[:limit],
        "total_analyzed": len(list(RTS_EXPORTS_DIR.glob("*.rts.png")))
    }


@app.get("/api/pm/spatial/entropy/{filename}")
async def get_entropy_texture(filename: str):
    """Get entropy texture as PNG for an RTS file."""
    if RTSSpatialAnalyzer is None:
        raise HTTPException(
            status_code=503,
            detail="RTSSpatialAnalyzer not available"
        )

    # Sanitize filename to prevent path traversal
    safe_filename = sanitize_filename(filename)
    file_path = RTS_EXPORTS_DIR / safe_filename

    if not file_path.exists():
        raise HTTPException(status_code=404, detail="RTS file not found")

    try:
        import numpy as np
        from PIL import Image
        import io

        # Load and analyze
        analyzer = RTSSpatialAnalyzer.from_rts_file(str(file_path))
        texture_data = analyzer.get_entropy_texture_data()

        if texture_data is None:
            raise HTTPException(
                status_code=500,
                detail="Failed to generate entropy texture"
            )

        # Convert to PNG
        img = Image.fromarray(texture_data, mode='RGBA')
        img_io = io.BytesIO()
        img.save(img_io, format='PNG')
        img_io.seek(0)

        return FileResponse(
            path=str(file_path),
            media_type='image/png',
            headers={"Content-Disposition": f"attachment; filename=entropy_{safe_filename}"}
        )

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/spatial/hotspots/{filename}")
async def get_rts_hotspots(filename: str):
    """Get hotspot regions for a specific RTS file."""
    if RTSSpatialAnalyzer is None:
        raise HTTPException(
            status_code=503,
            detail="RTSSpatialAnalyzer not available"
        )

    # Sanitize filename to prevent path traversal
    safe_filename = sanitize_filename(filename)
    file_path = RTS_EXPORTS_DIR / safe_filename

    if not file_path.exists():
        raise HTTPException(status_code=404, detail="RTS file not found")

    try:
        # Load and analyze
        analyzer = RTSSpatialAnalyzer.from_rts_file(str(file_path))
        hotspots = analyzer.get_hotspot_regions()

        return {
            "status": "success",
            "filename": safe_filename,
            "hotspots": hotspots,
            "count": len(hotspots)
        }

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/pm/spatial/regions")
async def get_detected_regions(min_size: int = 50, limit: int = 50):
    """Get detected task/phase regions from recent RTS exports."""
    if RTSSpatialAnalyzer is None:
        raise HTTPException(
            status_code=503,
            detail="RTSSpatialAnalyzer not available"
        )

    all_regions = []

    # Analyze recent .rts.png exports
    for file_path in RTS_EXPORTS_DIR.glob("*.rts.png"):
        try:
            result = analyze_rts_file(str(file_path))
            regions = result.get("regions", [])

            # Filter by minimum size
            filtered = [r for r in regions if r.get("size", 0) >= min_size]

            for region in filtered[:limit]:
                region["source_file"] = file_path.name
                all_regions.append(region)
        except Exception:
            continue

    # Sort by size
    all_regions.sort(key=lambda x: x.get("size", 0), reverse=True)

    return {
        "status": "success",
        "regions": all_regions[:limit],
        "total_analyzed": len(list(RTS_EXPORTS_DIR.glob("*.rts.png")))
    }


@app.get("/api/pm/spatial/context")
async def get_spatial_context(query: str = ""):
    """Get spatial context using the SPATIAL prompt for LLM integration.

    This endpoint provides spatial reasoning context about the current codebase
    position and neighborhood, enabling AI agents to understand the spatial
    topology of the codebase.
    """
    try:
        # Try to import the prompts module
        try:
            from ai_project_management.llm_autocomplete.prompts import get_prompt_for_context
            context = get_prompt_for_context("spatial", query)
        except ImportError:
            # Fallback to basic spatial context
            context = """SPATIAL context provides information about the codebase's spatial structure.

Current spatial state:
- No specific RTS image loaded
- Coordinate system: Hilbert curve (256x256 grid cells)
- Entropy analysis: Available when .rts.png is loaded
- Hotspot detection: Available for complexity analysis

To enable full spatial reasoning:
1. Load a .rts.png file using the spatial view
2. Navigate to the area of interest
3. Query this endpoint for neighborhood information
"""

        return JSONResponse({
            'status': 'success',
            'context': context,
            'query': query,
            'timestamp': datetime.now().isoformat()
        })
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to get spatial context: {e}")


# ============================================================================
# Neural City API Endpoints - For Neural Model Visualization
# ============================================================================

# Import neural parser
try:
    from ai_project_management.spatial.neural_parser import parse_neural_rts, NeuralModelParser
except ImportError:
    parse_neural_rts = None
    NeuralModelParser = None


@app.get("/api/pm/neural/analyze/{filename}")
async def analyze_neural_model(filename: str):
    """Analyze a neural model RTS file and return structured data."""
    # Sanitize filename
    safe_filename = sanitize_filename(filename)

    rts_path = Path.cwd() / safe_filename
    if not rts_path.exists():
        raise HTTPException(status_code=404, detail="RTS file not found")

    if parse_neural_rts is None:
        raise HTTPException(
            status_code=503,
            detail="Neural parser not available"
        )

    try:
        result = parse_neural_rts(str(rts_path))
        return JSONResponse(result)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Analysis failed: {e}")


@app.get("/api/pm/neural/districts/{filename}")
async def get_neural_districts(filename: str):
    """Get neural city districts for visualization with spatial bounds."""
    # Sanitize filename
    safe_filename = sanitize_filename(filename)

    rts_path = Path.cwd() / safe_filename
    if not rts_path.exists():
        raise HTTPException(status_code=404, detail="RTS file not found")

    if NeuralModelParser is None:
        raise HTTPException(
            status_code=503,
            detail="Neural parser not available"
        )

    try:
        parser = NeuralModelParser(str(rts_path))
        result = parser.parse()

        # Return districts with spatial bounds
        districts = []
        for name, district in parser.districts.items():
            if district.layers:
                districts.append({
                    'name': district.name,
                    'description': district.description,
                    'color': district.color,
                    'layer_count': len(district.layers),
                    'byte_start': district.byte_start,
                    'byte_end': district.byte_end,
                    'total_size': district.total_size
                })

        return JSONResponse({'districts': districts})
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to load districts: {e}")


@app.get("/api/pm/neural/layers/{filename}")
async def get_neural_layers(filename: str, layer_type: Optional[str] = None):
    """Get layers, optionally filtered by type."""
    # Sanitize filename
    safe_filename = sanitize_filename(filename)

    rts_path = Path.cwd() / safe_filename
    if not rts_path.exists():
        raise HTTPException(status_code=404, detail="RTS file not found")

    if NeuralModelParser is None:
        raise HTTPException(
            status_code=503,
            detail="Neural parser not available"
        )

    try:
        parser = NeuralModelParser(str(rts_path))
        result = parser.parse()

        layers = result['layers']
        if layer_type:
            layers = [l for l in layers if l['type'] == layer_type]

        return JSONResponse({'layers': layers, 'count': len(layers)})
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to load layers: {e}")


@app.get("/api/pm/neural/layer/{filename}/{layer_name:path}")
async def get_layer_detail(filename: str, layer_name: str):
    """Get detailed information about a specific layer."""
    # Sanitize filename
    safe_filename = sanitize_filename(filename)

    rts_path = Path.cwd() / safe_filename
    if not rts_path.exists():
        raise HTTPException(status_code=404, detail="RTS file not found")

    if NeuralModelParser is None:
        raise HTTPException(
            status_code=503,
            detail="Neural parser not available"
        )

    try:
        parser = NeuralModelParser(str(rts_path))
        result = parser.parse()

        # Find the layer by name
        layer = next((l for l in result['layers'] if l['name'] == layer_name), None)

        if not layer:
            raise HTTPException(status_code=404, detail=f"Layer '{layer_name}' not found")

        # Find which district this layer belongs to
        district_name = None
        district_info = None
        for dist_key, dist_data in result['districts'].items():
            # Check if layer byte range is within district
            if (dist_data['byte_start'] <= layer['start'] and
                layer['end'] <= dist_data['byte_end']):
                district_name = dist_data['name']
                district_info = dist_data
                break

        return JSONResponse({
            'layer': layer,
            'district': district_name,
            'district_info': district_info,
            'model_name': result['model_name'],
            'position_in_model': layer['start'] / result['total_size'] if result['total_size'] > 0 else 0
        })
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to load layer detail: {e}")


def generate_ai_debug_metadata(state: Dict) -> Dict:
    """Generate AI-friendly metadata for debugging the map."""
    metadata = {
        "description": "AI PM Spatial Map - AI Debugging Metadata",
        "visualEncoding": {
            "phaseTerritories": "Colored rectangular regions",
            "taskTiles": "Small colored squares within phases",
            "statusColors": {
                "pending": "Gray (0x6b7280)",
                "in-progress": "Orange (0xf59e0b)",
                "complete": "Green (0x10b981)",
                "blocked": "Red (0xef4444)",
                "deferred": "Purple (0x8b5cf6)"
            },
            "priorityBorders": {
                "low": "Thin gray border",
                "medium": "Thin orange border",
                "high": "Thick red border",
                "critical": "Thick dark red border"
            }
        },
        "interactionHints": [
            "Click on any task tile to view details",
            "Right-click for context menu",
            "Drag tasks between phases to reassign",
            "Use scroll wheel to zoom in/out",
            "Click and drag to pan the map"
        ],
        "aiAnalysisSuggestions": [
            "Identify phases with low completion rates",
            "Find tasks marked as 'blocked' that need attention",
            "Check for dependency cycles",
            "Look for high-priority tasks that are still pending",
            "Analyze task distribution across phases"
        ]
    }

    # Add statistics if available
    if "project" in state and "phases" in state["project"]:
        total_tasks = 0
        tasks_by_status = {}
        tasks_by_priority = {}

        for phase in state["project"]["phases"]:
            for task in phase.get("tasks", []):
                total_tasks += 1
                status = task.get("status", "pending")
                priority = task.get("priority", "medium")

                tasks_by_status[status] = tasks_by_status.get(status, 0) + 1
                tasks_by_priority[priority] = tasks_by_priority.get(priority, 0) + 1

        metadata["statistics"] = {
            "totalTasks": total_tasks,
            "tasksByStatus": tasks_by_status,
            "tasksByPriority": tasks_by_priority
        }

    return metadata


def detect_rts_format(filename: str) -> str:
    """Detect the RTS format from filename."""
    if filename.endswith('.brts.json'):
        return 'bRTS'
    elif filename.endswith('.rts.png'):
        return 'PixelRTS'
    elif filename.endswith('.meta.json'):
        return 'PixelRTS-Metadata'
    elif '_tile_' in filename:
        return 'TiledRTS'
    elif '_index.json' in filename:
        return 'TiledRTS-Index'
    else:
        return 'Unknown'


@app.get("/", response_class=HTMLResponse)
async def root():
    """Serve dashboard UI."""
    html_path = Path(__file__).parent / "static" / "index.html"
    if html_path.exists():
        return html_path.read_text()

    # Simple fallback UI
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>AI PM Dashboard</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            h1 { color: #333; }
            .status { margin: 20px 0; padding: 20px; background: #f5f5f5; border-radius: 8px; }
            .metric { display: inline-block; margin: 0 20px; }
            .metric-value { font-size: 24px; font-weight: bold; }
            .metric-label { color: #666; }
        </style>
    </head>
    </head>
    <body>
        <h1>AI Project Management Dashboard</h1>
        <div class="status">
            <div class="metric">
                <div class="metric-value" id="active-count">0</div>
                <div class="metric-label">Active Tasks</div>
            </div>
            <div class="metric">
                <div class="metric-value" id="completed-count">0</div>
                <div class="metric-label">Completed Tasks</div>
            </div>
            <div class="metric">
                <div class="metric-value" id="neuromodulation-dopamine">0.5</div>
                <div class="metric-label">Dopamine</div>
            </div>
        </div>
        <script>
            // Fetch initial status
            fetch('/api/status')
                .then(r => r.json())
                .then(data => {
                    document.getElementById('active-count').textContent = data.active_tasks;
                    document.getElementById('completed-count').textContent = data.completed_tasks;
                    document.getElementById('neuromodulation-dopamine').textContent =
                        data.neuromodulation.dopamine.toFixed(2);
                });
        </script>
    </body>
    </html>
    """


def get_demo_project(project_id: str) -> Dict:
    """Return demo project data for when no .planning directory exists."""
    return {
        "id": project_id,
        "is_demo": True,
        "name": "Demo Project",
        "description": "This is a demo project. Create a .planning directory with PROJECT.md and ROADMAP.md to use your own data.",
        "position": {"x": 0, "y": 0},
        "phases": [
            {
                "id": "1",
                "name": "Planning",
                "status": "complete",
                "directory": "01-planning",
                "position": {"x": 0, "y": 0, "width": 100, "height": 100},
                "tasks": [
                    {
                        "id": "1-01",
                        "name": "Define requirements",
                        "description": "Gather and document project requirements",
                        "status": "complete",
                        "priority": "high",
                        "subtasks": [{"text": "Stakeholder interviews", "done": True}, {"text": "Requirements doc", "done": True}],
                        "progress": 100,
                        "dependencies": [],
                        "position": {"x": 5, "y": 5}
                    },
                    {
                        "id": "1-02",
                        "name": "Create design mockups",
                        "description": "Design the UI/UX for the application",
                        "status": "complete",
                        "priority": "medium",
                        "subtasks": [{"text": "Wireframes", "done": True}, {"text": "High-fidelity mockups", "done": True}],
                        "progress": 100,
                        "dependencies": [],
                        "position": {"x": 20, "y": 5}
                    }
                ]
            },
            {
                "id": "2",
                "name": "Development",
                "status": "in-progress",
                "directory": "02-development",
                "position": {"x": 120, "y": 0, "width": 100, "height": 100},
                "tasks": [
                    {
                        "id": "2-01",
                        "name": "Setup project structure",
                        "description": "Initialize the project with all dependencies",
                        "status": "complete",
                        "priority": "high",
                        "subtasks": [{"text": "Init repo", "done": True}, {"text": "Setup CI/CD", "done": True}],
                        "progress": 100,
                        "dependencies": [],
                        "position": {"x": 125, "y": 5}
                    },
                    {
                        "id": "2-02",
                        "name": "Build core features",
                        "description": "Implement the main functionality",
                        "status": "in-progress",
                        "priority": "high",
                        "subtasks": [{"text": "API endpoints", "done": True}, {"text": "Database schema", "done": True}, {"text": "Authentication", "done": False}],
                        "progress": 66,
                        "dependencies": ["2-01"],
                        "position": {"x": 140, "y": 5}
                    },
                    {
                        "id": "2-03",
                        "name": "Add testing",
                        "description": "Write unit and integration tests",
                        "status": "pending",
                        "priority": "medium",
                        "subtasks": [{"text": "Unit tests", "done": False}, {"text": "E2E tests", "done": False}],
                        "progress": 0,
                        "dependencies": ["2-02"],
                        "position": {"x": 155, "y": 5}
                    }
                ]
            },
            {
                "id": "3",
                "name": "Testing & QA",
                "status": "pending",
                "directory": "03-testing",
                "position": {"x": 240, "y": 0, "width": 100, "height": 100},
                "tasks": [
                    {
                        "id": "3-01",
                        "name": "Performance testing",
                        "description": "Run load tests and optimize",
                        "status": "pending",
                        "priority": "medium",
                        "subtasks": [{"text": "Load tests", "done": False}, {"text": "Optimization", "done": False}],
                        "progress": 0,
                        "dependencies": ["2-03"],
                        "position": {"x": 245, "y": 5}
                    },
                    {
                        "id": "3-02",
                        "name": "Security audit",
                        "description": "Review code for security issues",
                        "status": "pending",
                        "priority": "high",
                        "subtasks": [],
                        "progress": 0,
                        "dependencies": ["2-03"],
                        "position": {"x": 260, "y": 5}
                    }
                ]
            },
            {
                "id": "4",
                "name": "Deployment",
                "status": "pending",
                "directory": "04-deployment",
                "position": {"x": 360, "y": 0, "width": 100, "height": 100},
                "tasks": [
                    {
                        "id": "4-01",
                        "name": "Deploy to staging",
                        "description": "Deploy application to staging environment",
                        "status": "pending",
                        "priority": "high",
                        "subtasks": [{"text": "Configure staging", "done": False}, {"text": "Deploy", "done": False}],
                        "progress": 0,
                        "dependencies": ["3-01"],
                        "position": {"x": 365, "y": 5}
                    },
                    {
                        "id": "4-02",
                        "name": "Production launch",
                        "description": "Launch to production",
                        "status": "pending",
                        "priority": "high",
                        "subtasks": [{"text": "Final checks", "done": False}, {"text": "Go live", "done": False}],
                        "progress": 0,
                        "dependencies": ["4-01"],
                        "position": {"x": 380, "y": 5}
                    }
                ]
            }
        ]
    }

if __name__ == "__main__":
    import uvicorn
    import os
    port = int(os.getenv("AI_PM_PORT", 8001))
    print("=" * 60)
    print("AI PM Dashboard Starting...")
    print(f"Open http://localhost:{port}/ai-pm in your browser")
    print("=" * 60)
    uvicorn.run(app, host="0.0.0.0", port=port)
