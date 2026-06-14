"""
Visual Shell CLI Tests
"""

import json
import subprocess
import sys
from pathlib import Path


def run_command(args):
    """Run a g-visual command and return the result"""
    cmd = [sys.executable, "-m", "cli_anything.visual_shell.visual_shell_cli"] + args
    result = subprocess.run(
        cmd, capture_output=True, text=True, cwd=Path(__file__).parent.parent.parent
    )
    return result


def test_help():
    """Test that help works"""
    result = run_command(["--help"])
    assert result.returncode == 0
    assert "Geometry OS Visual Shell CLI" in result.stdout


def test_status():
    """Test status command"""
    result = run_command(["status"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "status"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert data["visual_shell"]["status"] == "running"


def test_layers():
    """Test layers command"""
    result = run_command(["layers"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "layers"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert "layers" in data["visual_shell"]


def test_create_layer():
    """Test create-layer command"""
    result = run_command(["create-layer", "--name", "test", "--type", "static", "--z-index", "50"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "create-layer", "--name", "test", "--type", "static"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert data["visual_shell"]["action"] == "create_layer"


def test_remove_layer():
    """Test remove-layer command"""
    result = run_command(["remove-layer", "layer_1"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "remove-layer", "layer_1"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert data["visual_shell"]["action"] == "remove_layer"


def test_set_wallpaper():
    """Test set-wallpaper command"""
    result = run_command(["set-wallpaper", "/test/wallpaper.jpg"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "set-wallpaper", "/test/wallpaper.jpg"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert data["visual_shell"]["action"] == "set_wallpaper"


def test_widgets():
    """Test widgets command"""
    result = run_command(["widgets"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "widgets"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert "widgets" in data["visual_shell"]


def test_add_widget():
    """Test add-widget command"""
    result = run_command(
        ["add-widget", "--name", "test", "--type", "clock", "--x", "100", "--y", "100"]
    )
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "add-widget", "--name", "test", "--type", "clock"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert data["visual_shell"]["action"] == "add_widget"


def test_remove_widget():
    """Test remove-widget command"""
    result = run_command(["remove-widget", "widget_1"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "remove-widget", "widget_1"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "visual_shell" in data
    assert data["visual_shell"]["action"] == "remove_widget"


if __name__ == "__main__":
    test_help()
    test_status()
    test_layers()
    test_create_layer()
    test_remove_layer()
    test_set_wallpaper()
    test_widgets()
    test_add_widget()
    test_remove_widget()
    print("All tests passed!")
