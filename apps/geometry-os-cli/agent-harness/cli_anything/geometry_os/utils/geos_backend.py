import subprocess
import shutil
import os
from pathlib import Path
from typing import Dict, Any

class GeosBackend:
    """Wraps Geometry OS internal tools."""

    def __init__(self):
        # Path: apps/geometry-os-cli/agent-harness/cli_anything/geometry_os/utils/geos_backend.py
        # root should be 7 parents up
        self.root = Path(__file__).parent.parent.parent.parent.parent.parent.parent.absolute()
        self.riscv_vm_path = self.root / "systems" / "infinite_map_rs" / "target" / "release" / "run_riscv"
        self.compositor_path = self.root / "systems" / "infinite_map_rs" / "target" / "release" / "infinite_map_rs"
        self.crystallizer_py = self.root / "systems" / "pixel_compiler" / "pixelrts_v2_converter.py"
        self.riscv_jit_py = self.root / "systems" / "pixel_compiler" / "riscv_to_geometric_vm.py"
        self.evolution_py = self.root / "evolution_daemon_v8.py"

    def crystallize_binary(self, input_path: str, output_path: str, meta: Dict[str, str] = None) -> Dict[str, Any]:
        """Crystallize a binary into a standard PixelRTS v2 container."""
        cmd = [shutil.which("python3"), str(self.crystallizer_py), input_path, output_path]
        if meta:
            for k, v in meta.items():
                cmd.extend([f"--{k}", v])
        
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            raise RuntimeError(f"Crystallization failed: {result.stderr}")
        
        return {"status": "success", "output": output_path}

    def crystallize_to_geometric(self, input_path: str, output_path: str) -> Dict[str, Any]:
        """Crystallize RISC-V binary into a Geometric VM Brick (v3)."""
        cmd = [shutil.which("python3"), str(self.riscv_jit_py), input_path, output_path]
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            raise RuntimeError(f"Geometric crystallization failed: {result.stderr}")
        
        return {"status": "success", "output": output_path}

    def launch_map(self, brick_path: str = None) -> Dict[str, Any]:
        """Launch the Infinite Map compositor."""
        if not self.compositor_path.exists():
            raise RuntimeError("Compositor not built. Run 'cargo build --release' in systems/infinite_map_rs")
        
        cmd = [str(self.compositor_path)]
        if brick_path:
            cmd.append(brick_path)
            
        # Run in background as it's a GUI app
        process = subprocess.Popen(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return {"status": "launched", "pid": process.pid}

    def start_evolution(self, target_path: str) -> Dict[str, Any]:
        """Start the Evolution Daemon on a target Brick."""
        cmd = [shutil.which("python3"), str(self.evolution_py), "--target", target_path]
        process = subprocess.Popen(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return {"status": "evolving", "pid": process.pid}
