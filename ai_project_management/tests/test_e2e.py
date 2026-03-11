"""End-to-end tests for AI PM Spatial Map."""

import pytest
import subprocess
import time
import requests
from pathlib import Path


@pytest.fixture(scope="module")
def dashboard_server():
    """Start the dashboard server for testing."""
    import os
    env = os.environ.copy()
    # Add src to PYTHONPATH so ai_project_management can be found
    project_root = Path(__file__).parent.parent
    src_path = project_root / "src"
    env["PYTHONPATH"] = f"{src_path}:{env.get('PYTHONPATH', '')}"
    env["AI_PM_PORT"] = "8001"

    proc = subprocess.Popen(
        ["python3", "-m", "ai_project_management.dashboard.app"],
        cwd=project_root,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        env=env
    )

    # Wait for server to start
    time.sleep(5)

    yield "http://localhost:8001"

    proc.terminate()
    proc.wait()


def test_ai_pm_dashboard_loads(dashboard_server):
    """Dashboard page should load successfully."""
    response = requests.get(f"{dashboard_server}/ai-pm")
    assert response.status_code == 200
    assert "AI PM Spatial Map" in response.text


def test_api_projects_endpoint(dashboard_server):
    """Projects API should return data."""
    response = requests.get(f"{dashboard_server}/api/pm/projects")
    assert response.status_code == 200
    data = response.json()
    assert "projects" in data


def test_api_project_detail(dashboard_server):
    """Project detail API should return structured data."""
    response = requests.get(f"{dashboard_server}/api/pm/project/default")
    assert response.status_code == 200
    data = response.json()
    assert "name" in data
    assert "phases" in data


def test_api_phases(dashboard_server):
    """Phases API should return phase list."""
    response = requests.get(f"{dashboard_server}/api/pm/phases")
    assert response.status_code == 200
    data = response.json()
    assert "phases" in data


def test_api_tasks(dashboard_server):
    """Tasks API should return task list."""
    response = requests.get(f"{dashboard_server}/api/pm/tasks")
    assert response.status_code == 200
    data = response.json()
    assert "tasks" in data


def test_static_assets_served(dashboard_server):
    """Static assets should be accessible."""
    # Test CSS
    response = requests.get(f"{dashboard_server}/static/ai_pm/ai_pm.css")
    assert response.status_code == 200

    # Test JS files
    for js_file in ["ai_pm_api.js", "ai_pm_map.js", "ai_pm_ui.js"]:
        response = requests.get(f"{dashboard_server}/static/ai_pm/{js_file}")
        assert response.status_code == 200
