
import asyncio
import os
from datetime import datetime
from pathlib import Path
from typing import Optional, Dict, Any, List
import json


def _get_config_path() -> Optional[Path]:
    """
    Search for AI PM configuration file in multiple locations.

    Searches in order of priority:
    1. Environment variable AI_PM_CONFIG_PATH
    2. .ai-pm-config.yaml (current directory)
    3. config.yaml in AI PM project root
    4. Parent directory's config.yaml

    Returns:
        Path to config file if found, None otherwise
    """
    # Check environment variable first
    env_path = os.getenv("AI_PM_CONFIG_PATH")
    if env_path:
        path = Path(env_path).resolve()
        if path.exists():
            return path

    # Check current directory for .ai-pm-config.yaml
    current_dir = Path.cwd()
    local_config = current_dir / ".ai-pm-config.yaml"
    if local_config.exists():
        return local_config

    # Try to find AI PM project root and its config.yaml
    # Look for ai_project_management directory structure
    current = Path(__file__).resolve().parent
    for _ in range(5):  # Search up to 5 levels
        root_config = current / "config.yaml"
        if root_config.exists():
            return root_config
        # Check for ai-pm root markers
        if (current / "pyproject.toml").exists():
            config_file = current / "config.yaml"
            if config_file.exists():
                return config_file
        parent = current.parent
        if parent == current:  # Reached filesystem root
            break
        current = parent

    # Check parent directory as fallback
    parent_config = Path(__file__).resolve().parent.parent / "config.yaml"
    if parent_config.exists():
        return parent_config

    return None


def _json_serializer(obj: Any) -> Any:
    """Custom JSON serializer for datetime and other non-serializable objects."""
    if isinstance(obj, datetime):
        return obj.isoformat()
    if hasattr(obj, "model_dump"):
        return obj.model_dump()
    if hasattr(obj, "__dict__"):
        return obj.__dict__
    raise TypeError(f"Object of type {type(obj)} is not JSON serializable")

# Try to import FastMCP, fallback to standard Server if needed or handle error
try:
    from mcp.server.fastmcp import FastMCP
except ImportError:
    raise ImportError("mcp>=0.9.0 is required for this server. Please install it with 'pip install mcp>=0.9.0'")

# Create the MCP server instance
mcp = FastMCP("ai-project-management")

@mcp.tool()
async def process_roadmap(roadmap_path: str, output_dir: Optional[str] = None) -> str:
    """
    Process a new roadmap file and generate OpenSpec artifacts.

    Args:
        roadmap_path: Absolute path to the roadmap markdown file.
        output_dir: Optional absolute path to output directory for artifacts.
    """
    from .orchestrator import AIProjectManagerOrchestrator, OrchestratorConfig

    # Load config from file with enhanced path resolution (P0 fix)
    config_path = _get_config_path()
    if config_path and config_path.exists():
        config = OrchestratorConfig.from_file(config_path)
    else:
        config = OrchestratorConfig()
    if output_dir:
        config.openspec_output_dir = Path(output_dir)

    orchestrator = AIProjectManagerOrchestrator(config)
    await orchestrator.initialize()
    
    try:
        roadmap_model = await orchestrator.process_roadmap(Path(roadmap_path))
        return f"Successfully processed roadmap '{roadmap_model.metadata.title}' with {len(roadmap_model.phases)} phases."
    except Exception as e:
        return f"Error processing roadmap: {str(e)}"
    finally:
        await orchestrator.shutdown()

@mcp.tool()
async def execute_tasks(roadmap_path: str, max_iterations: int = 5) -> str:
    """
    Execute tasks from the roadmap until completion or max iterations reached.

    Args:
        roadmap_path: Absolute path to the roadmap markdown file.
        max_iterations: Maximum number of improvement iterations to run.
    """
    from .orchestrator import AIProjectManagerOrchestrator, OrchestratorConfig

    # Load config from file with enhanced path resolution (P0 fix)
    config_path = _get_config_path()
    if config_path and config_path.exists():
        config = OrchestratorConfig.from_file(config_path)
    else:
        config = OrchestratorConfig()
    config.max_iterations = max_iterations

    orchestrator = AIProjectManagerOrchestrator(config)
    await orchestrator.initialize()
    
    try:
        # Ensure roadmap is loaded
        await orchestrator.process_roadmap(Path(roadmap_path))
        
        state = await orchestrator.execute_until_completion()
        
        result_summary = {
            "completed_tasks": len(state.completed_tasks),
            "failed_tasks": len(state.failed_tasks),
            "blocked_tasks": len(state.blocked_tasks),
            "iteration": state.iteration_state.iteration_number,
            "converged": state.iteration_state.is_converged
        }
        return json.dumps(result_summary, indent=2, default=_json_serializer)
    except Exception as e:
        return f"Error executing tasks: {str(e)}"
    finally:
        await orchestrator.shutdown()

@mcp.tool()
async def get_system_status() -> str:
    """
    Get the current status of the AI Project Management system.
    Returns details about running tasks, iteration count, and neuromodulation state.
    """
    from .orchestrator import AIProjectManagerOrchestrator, OrchestratorConfig

    # Load config from file with enhanced path resolution (P0 fix)
    config_path = _get_config_path()
    if config_path and config_path.exists():
        config = OrchestratorConfig.from_file(config_path)
    else:
        config = OrchestratorConfig()
    orchestrator = AIProjectManagerOrchestrator(config)
    
    # We need to initialize to load state
    await orchestrator.initialize()
    await orchestrator.iteration_engine.load_state()
    
    try:
        status = orchestrator.get_status()
        return json.dumps(status, indent=2, default=_json_serializer)
    finally:
        await orchestrator.shutdown()

@mcp.tool()
async def run_daemon(interval_seconds: int = 60) -> str:
    """
    Start the continuous improvement daemon in the background.
    Note: This tool will return a message that the daemon has started.
    Programming Note: In a real MCP context, long running processes should be handled carefully.
    This tool might block if not careful, so we'll just start it and return.
    """
    # For now, we return instructions because starting a daemon from an MCP tool 
    # that persists beyond the tool call is complex without a separate process manager.
    return (
        "To start the daemon, please run the following command in your terminal:\n"
        "ai-pm daemon --interval " + str(interval_seconds)
    )

@mcp.tool()
async def read_roadmap_summary(roadmap_path: str) -> str:
    """
    Read and summarize a roadmap file.
    """
    from .roadmap import parse_roadmap_file

    try:
        roadmap_model = parse_roadmap_file(Path(roadmap_path))

        lines = [f"Roadmap: {roadmap_model.metadata.title} (v{roadmap_model.metadata.version})"]
        lines.append(f"Completion: {roadmap_model.overall_completion:.1f}%")

        for phase in roadmap_model.phases:
            lines.append(f"\nPhase: {phase.name} ({phase.status.value})")
            for feature in phase.features:
                completed = sum(1 for t in feature.tasks if t.completed)
                total = len(feature.tasks)
                lines.append(f"  - {feature.name}: {completed}/{total} tasks")

        return "\n".join(lines)
    except Exception as e:
        return f"Error reading roadmap: {str(e)}"

@mcp.tool()
async def discover_roadmaps(search_root: str = ".", max_depth: int = 3, analyze: bool = True) -> str:
    """
    Auto-discover roadmap files in the project directory.

    Args:
        search_root: Root directory to search for roadmap files (default: current directory).
        max_depth: Maximum directory depth to search (default: 3).
        analyze: Whether to analyze each roadmap for phase/task counts (default: True).

    Returns:
        JSON string with discovered roadmaps and their metadata.
    """
    from .roadmap.discovery import RoadmapDiscovery

    try:
        search_path = Path(search_root).resolve()

        discovery = RoadmapDiscovery(
            search_root=search_path,
            max_depth=max_depth
        )

        if analyze:
            roadmaps = await discovery.discover_and_analyze()
        else:
            roadmaps = await discovery.discover()

        # Format results
        results = []
        for rm in roadmaps:
            results.append({
                "path": str(rm.path),
                "title": rm.title,
                "priority": rm.priority,
                "last_modified": rm.last_modified,
                "phase_count": rm.phase_count,
                "task_count": rm.task_count,
                "completion_percentage": rm.completion_percentage,
            })

        return json.dumps({
            "count": len(results),
            "search_root": str(search_path),
            "roadmaps": results
        }, indent=2, default=_json_serializer)

    except Exception as e:
        return f"Error discovering roadmaps: {str(e)}"

if __name__ == "__main__":
    mcp.run()
