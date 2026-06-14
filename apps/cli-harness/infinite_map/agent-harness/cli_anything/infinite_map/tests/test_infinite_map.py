"""
Infinite Map CLI Tests
"""

import json
import subprocess
import sys
from pathlib import Path


def run_command(args):
    """Run a g-map command and return the result"""
    cmd = [sys.executable, "-m", "cli_anything.infinite_map.infinite_map_cli"] + args
    result = subprocess.run(
        cmd, capture_output=True, text=True, cwd=Path(__file__).parent.parent.parent
    )
    return result


def test_help():
    """Test that help works"""
    result = run_command(["--help"])
    assert result.returncode == 0
    assert "Geometry OS Infinite Map CLI" in result.stdout


def test_status():
    """Test status command"""
    result = run_command(["status"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "status"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert data["infinite_map"]["status"] == "running"


def test_tiles():
    """Test tiles command"""
    result = run_command(["tiles"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "tiles"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert "tiles" in data["infinite_map"]


def test_allocate():
    """Test allocate command"""
    result = run_command(["allocate"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "allocate"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert data["infinite_map"]["action"] == "allocate"


def test_free():
    """Test free command"""
    result = run_command(["free", "tile_001"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "free", "tile_001"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert data["infinite_map"]["action"] == "free"


def test_vat():
    """Test vat command"""
    result = run_command(["vat"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "vat"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert "vat_table" in data["infinite_map"]


def test_map():
    """Test map command"""
    result = run_command(["map", "0x0000000000005000"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "map", "0x0000000000005000"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert data["infinite_map"]["action"] == "map"


def test_unmap():
    """Test unmap command"""
    result = run_command(["unmap", "0x0000000000005000"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "unmap", "0x0000000000005000"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert data["infinite_map"]["action"] == "unmap"


def test_stats():
    """Test stats command"""
    result = run_command(["stats"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "stats"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "infinite_map" in data
    assert "memory_statistics" in data["infinite_map"]


if __name__ == "__main__":
    test_help()
    test_status()
    test_tiles()
    test_allocate()
    test_free()
    test_vat()
    test_map()
    test_unmap()
    test_stats()
    print("All tests passed!")
