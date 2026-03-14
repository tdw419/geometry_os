#!/usr/bin/env python3
"""
Simple Status API Server
Serves /api/status for the dashboard without requiring full compositor.
"""

import json
import re
from http.server import HTTPServer, SimpleHTTPRequestHandler
from pathlib import Path

ROOT = Path(__file__).parent.parent.parent

def get_best_gips():
    """Read evolution results and return best/last GIPS."""
    path = ROOT / "apps" / "autoresearch" / "evolution_cycle_results.tsv"
    best = 0.0
    last = 0.0
    try:
        with open(path) as f:
            for line in f:
                if "THE ENGINE" in line:
                    parts = line.strip().split('\t')
                    if len(parts) > 3:
                        try:
                            gips = float(parts[3])
                            last = gips
                            if gips > best:
                                best = gips
                        except ValueError:
                            pass
    except FileNotFoundError:
        pass
    return best, last

def get_allocator_fitness():
    """Read fitness results."""
    path = ROOT / "apps" / "autoresearch" / "results_fitness.tsv"
    try:
        with open(path) as f:
            for line in reversed(list(f)):
                if "Fitness Score:" in line or "%" in line:
                    # Extract percentage
                    match = re.search(r'(\d+\.?\d*)%', line)
                    if match:
                        return float(match.group(1)) / 100.0
    except FileNotFoundError:
        pass
    return 0.54  # Default

def count_experiments():
    """Count total experiments."""
    path = ROOT / "apps" / "autoresearch" / "evolution_cycle_results.tsv"
    try:
        with open(path) as f:
            return sum(1 for line in f if line.strip() and not line.startswith('timestamp'))
    except FileNotFoundError:
        return 0

def is_evolution_running():
    """Check if evolution daemon is running."""
    import subprocess
    try:
        result = subprocess.run(['pgrep', '-f', 'run_evolution'],
                              capture_output=True)
        return result.returncode == 0
    except:
        return False

def get_kernel_size():
    """Get kernel binary size."""
    # Check for geometry_os.kernel
    path = ROOT / "kernel" / "geos" / "geometry_os.kernel"
    if path.exists():
        return path.stat().st_size
    # Fallback to kernel.bin
    path = ROOT / "kernel" / "geos" / "kernel.bin"
    try:
        return path.stat().st_size
    except FileNotFoundError:
        return 0

class StatusHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(ROOT / "systems" / "visual_shell" / "web"), **kwargs)

    def do_GET(self):
        if self.path == '/api/status':
            best_gips, last_gips = get_best_gips()
            status = {
                "gips": last_gips,
                "best_gips": best_gips,
                "allocator_fitness": get_allocator_fitness(),
                "evolution_experiments": count_experiments(),
                "evolution_running": is_evolution_running(),
                "kernel_size": get_kernel_size(),
                "kernel_ready": get_kernel_size() > 0,
                "shell_active": True,
            }
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            self.wfile.write(json.dumps(status).encode())
        else:
            super().do_GET()

def main():
    port = 8080
    server = HTTPServer(('0.0.0.0', port), StatusHandler)
    print(f"Status API server running on http://localhost:{port}")
    print(f"Dashboard: http://localhost:{port}/status.html")
    print(f"API: http://localhost:{port}/api/status")
    server.serve_forever()

if __name__ == "__main__":
    main()
