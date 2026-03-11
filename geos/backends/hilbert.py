"""Hilbert decoder and ASCII renderer for geos map."""

import json
import random
from pathlib import Path
from typing import Optional


class HilbertRenderer:
    """Render the Infinite Map as ASCII art."""

    # ASCII density characters (low to high)
    DENSITY_CHARS = " .:-=+*#%@"

    def __init__(self):
        self._lut = None
        self._load_hilbert_lut()

    def _load_hilbert_lut(self):
        """Load Hilbert LUT if available."""
        try:
            from systems.sisyphus.native_hilbert import NativeHilbertLUT
            self._lut = NativeHilbertLUT()
        except Exception:
            pass

    def render_ascii(
        self,
        view: str = "districts",
        zoom: int = 1,
        width: int = 40,
        height: int = 15
    ) -> str:
        """
        Render the map as ASCII art.

        Args:
            view: Layer to render (thoughts, districts, mutations)
            zoom: Zoom level (1-4)
            width: ASCII width in characters
            height: ASCII height in characters

        Returns:
            ASCII art string
        """
        # Load state based on view
        state = self._load_view_state(view)

        # Generate ASCII grid
        lines = []
        lines.append("┌" + "─" * width + "┐")

        for y in range(height):
            row = "│"
            for x in range(width):
                # Sample density at this position
                density = self._sample_density(x, y, width, height, state, zoom)
                char = self._density_to_char(density)
                row += char
            row += "│"
            lines.append(row)

        lines.append("└" + "─" * width + "┘")

        # Add legend
        legend = self._generate_legend(view, state)
        lines.append(legend)

        return "\n".join(lines)

    def _load_view_state(self, view: str) -> dict:
        """Load state for the given view."""
        state = {"hotspots": [], "agents": [], "mutations": []}

        # Try to load real state
        if view == "districts":
            path = Path(".geometry/districts.json")
        elif view == "mutations":
            path = Path(".geometry/evolution_state.json")
        elif view == "thoughts":
            path = Path(".geometry/thought_field.json")
        else:
            path = Path(".geometry/districts.json")

        if path.exists():
            try:
                with open(path) as f:
                    state = json.load(f)
            except Exception:
                pass

        return state

    def _sample_density(
        self,
        x: int,
        y: int,
        width: int,
        height: int,
        state: dict,
        zoom: int
    ) -> float:
        """Sample density at position (procedural fallback)."""
        # Use procedural generation for visual interest when no real data
        # In production, this would sample actual Hilbert sector data

        # Simple noise-based density
        seed = hash((x * zoom, y * zoom, zoom))
        random.seed(seed)
        base = random.random()

        # Add some structure (hotspots in corners and center)
        cx, cy = width / 2, height / 2
        dist = ((x - cx) ** 2 + (y - cy) ** 2) ** 0.5
        max_dist = (cx ** 2 + cy ** 2) ** 0.5
        center_factor = 1 - (dist / max_dist) * 0.5

        return min(1.0, base * center_factor + random.random() * 0.3)

    def _density_to_char(self, density: float) -> str:
        """Convert density (0-1) to ASCII character."""
        index = int(density * (len(self.DENSITY_CHARS) - 1))
        index = max(0, min(len(self.DENSITY_CHARS) - 1, index))
        return self.DENSITY_CHARS[index]

    def _generate_legend(self, view: str, state: dict) -> str:
        """Generate legend for the map."""
        agent_count = 0
        mutation_count = 0

        if isinstance(state, list):
            agent_count = sum(len(d.get("agents", [])) for d in state if isinstance(d, dict))
        elif isinstance(state, dict):
            agent_count = len(state.get("agents", []))
            mutation_count = len(state.get("mutations", []))

        return f"Active: {agent_count} agents | Mutations: {mutation_count} pending | View: {view}"


class HilbertInspector:
    """Inspect specific Hilbert sectors."""

    def __init__(self):
        self._lut = None
        self._load_hilbert_lut()

    def _load_hilbert_lut(self):
        """Load Hilbert LUT if available."""
        try:
            from systems.sisyphus.native_hilbert import NativeHilbertLUT
            self._lut = NativeHilbertLUT()
        except Exception:
            pass

    def inspect(self, address: str, format: str = "rts") -> str:
        """
        Inspect a Hilbert sector.

        Args:
            address: Hilbert address (e.g., "0x8000" or "32768")
            format: Output format (rts, raw)

        Returns:
            Inspection result string
        """
        # Parse address
        try:
            if address.startswith("0x"):
                addr = int(address, 16)
            else:
                addr = int(address)
        except ValueError:
            return f"Error: Invalid address '{address}'"

        # Decode Hilbert to coordinates
        coords = self._decode_address(addr)

        # Read sector data
        data = self._read_sector(coords)

        # Format output
        return self._format_inspection(addr, coords, data, format)

    def _decode_address(self, addr: int) -> tuple:
        """Decode Hilbert address to coordinates."""
        if self._lut:
            try:
                return self._lut.decode(addr)
            except Exception:
                pass
        # Simple fallback
        return (addr % 256, addr // 256)

    def _read_sector(self, coords: tuple) -> bytes:
        """Read sector data at coordinates."""
        # In production, this would read from .rts.png
        # For now, return placeholder
        return b"PLACEHOLDER_DATA"

    def _format_inspection(
        self,
        addr: int,
        coords: tuple,
        data: bytes,
        format: str
    ) -> str:
        """Format inspection result."""
        lines = [
            "=" * 50,
            "HILBERT SECTOR INSPECTION",
            "=" * 50,
            f"Address: 0x{addr:04x} ({addr})",
            f"Coordinates: ({coords[0]}, {coords[1]})",
            f"Size: {len(data)} bytes",
            "",
        ]

        if format == "raw":
            # Hex dump
            lines.append("Raw data:")
            for i in range(0, min(64, len(data)), 16):
                hex_str = " ".join(f"{b:02x}" for b in data[i:i+16])
                lines.append(f"  {i:04x}: {hex_str}")
        else:
            lines.append("Type: Placeholder (RTS decoder pending)")
            lines.append("Entropy: 0.00 (no data)")

        lines.append("")
        lines.append("=" * 50)

        return "\n".join(lines)
