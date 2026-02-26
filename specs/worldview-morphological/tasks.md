# WorldView Morphological Layer Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Transform Geometry OS from symbolic 2D to 3D geospatial substrate where "Earth is the Hard Drive"

**Architecture:** Three-layer hybrid model - Ground (Hilbert→Geodetic mapping), Orbital (Processes as satellites via TLE telemetry), Diagnostic (Thermal/NVG/CRT shaders for system observability)

**Tech Stack:** Rust (geodetic transforms), Python (TelemetryAgent + NEB), WGSL/WebGL (diagnostic shaders)

---

## Phase 1: Core Mathematical Foundation

### Task 1.1: Geodetic Coordinate Types

**Files:**
- Create: `systems/infinite_map_rs/src/geodetic.rs`
- Modify: `systems/infinite_map_rs/src/lib.rs` (add module export)
- Test: `systems/infinite_map_rs/src/geodetic.rs` (inline tests)

**Step 1: Write the failing test**

Add to `systems/infinite_map_rs/src/geodetic.rs`:

```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_geodetic_coords_creation() {
        let coords = GeodeticCoords {
            latitude: 30.267,
            longitude: -97.743,
            altitude: 100.0,
        };
        assert!((coords.latitude - 30.267).abs() < 0.001);
        assert!((coords.longitude - (-97.743)).abs() < 0.001);
    }

    #[test]
    fn test_capital_anchor() {
        // Texas State Capitol coordinates
        let capital = GeodeticCoords::capital_anchor();
        assert!((capital.latitude - 30.2747).abs() < 0.001);
        assert!((capital.longitude - (-97.7403)).abs() < 0.001);
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cd systems/infinite_map_rs && cargo test geodetic --no-run 2>&1 | head -20`
Expected: Error "cannot find type GeodeticCoords"

**Step 3: Write minimal implementation**

```rust
//! Geodetic coordinate transformations for WorldView Morphological Layer.
//!
//! Maps Hilbert-coded memory addresses to WGS84 coordinates.

/// WGS84 Geodetic coordinates (latitude, longitude, altitude).
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct GeodeticCoords {
    /// Latitude in degrees (-90 to 90)
    pub latitude: f64,
    /// Longitude in degrees (-180 to 180)
    pub longitude: f64,
    /// Altitude in meters above sea level
    pub altitude: f64,
}

impl GeodeticCoords {
    /// The Capital anchor point (Texas State Capitol).
    /// Core kernel (0x00000000 - 0x00FFFFFF) is anchored here.
    pub fn capital_anchor() -> Self {
        Self {
            latitude: 30.2747,
            longitude: -97.7403,
            altitude: 150.0, // meters
        }
    }

    /// Create new geodetic coordinates.
    pub fn new(latitude: f64, longitude: f64, altitude: f64) -> Self {
        Self { latitude, longitude, altitude }
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cd systems/infinite_map_rs && cargo test geodetic`
Expected: All tests pass

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/geodetic.rs systems/infinite_map_rs/src/lib.rs
git commit -m "feat(geodetic): add GeodeticCoords type with Capital anchor"
```

---

### Task 1.2: Hilbert-to-Geodetic Projection

**Files:**
- Modify: `systems/infinite_map_rs/src/geodetic.rs`
- Test: inline in same file

**Step 1: Write the failing test**

```rust
#[cfg(test)]
mod tests {
    // ... existing tests ...

    #[test]
    fn test_hilbert_to_geodetic_origin() {
        // Origin (0,0) should map to Capital anchor
        let projection = HilbertGeodeticProjection::new(64); // 64x64 grid
        let coords = projection.hilbert_to_geodetic(0);
        let capital = GeodeticCoords::capital_anchor();

        // Should be very close to capital
        assert!((coords.latitude - capital.latitude).abs() < 0.001);
        assert!((coords.longitude - capital.longitude).abs() < 0.001);
    }

    #[test]
    fn test_hilbert_to_geodetic_locality() {
        // Adjacent Hilbert indices should produce geodetically close coordinates
        let projection = HilbertGeodeticProjection::new(64);
        let c1 = projection.hilbert_to_geodetic(0);
        let c2 = projection.hilbert_to_geodetic(1);

        let lat_diff = (c1.latitude - c2.latitude).abs();
        let lon_diff = (c1.longitude - c2.longitude).abs();

        // Should be within ~1km of each other
        assert!(lat_diff < 0.01);
        assert!(lon_diff < 0.01);
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cd systems/infinite_map_rs && cargo test hilbert_to_geodetic 2>&1 | head -20`
Expected: Error "cannot find type HilbertGeodeticProjection"

**Step 3: Write minimal implementation**

```rust
use crate::hilbert::d2xy;

/// Configuration for Hilbert-to-Geodetic projection.
///
/// Maps Hilbert space to a geographic region centered on the Capital.
pub struct HilbertGeodeticProjection {
    /// Grid size (must be power of 2)
    grid_size: u32,
    /// Center point (The Capital)
    center: GeodeticCoords,
    /// Degrees per grid cell (controls zoom level)
    degrees_per_cell: f64,
}

impl HilbertGeodeticProjection {
    /// Create a new projection with the given grid size.
    ///
    /// The grid is centered on the Capital anchor point.
    pub fn new(grid_size: u32) -> Self {
        assert!(grid_size.is_power_of_two(), "Grid size must be power of 2");

        let center = GeodeticCoords::capital_anchor();
        // At 64x64, each cell is ~0.01 degrees (~1km at this latitude)
        let degrees_per_cell = 0.01;

        Self { grid_size, center, degrees_per_cell }
    }

    /// Convert Hilbert index to geodetic coordinates.
    ///
    /// Uses the Hilbert curve to preserve spatial locality - adjacent
    /// indices produce geodetically close coordinates.
    pub fn hilbert_to_geodetic(&self, hilbert_index: u64) -> GeodeticCoords {
        let (x, y) = d2xy(self.grid_size, hilbert_index);

        // Center the grid around the Capital
        let half_grid = self.grid_size as f64 / 2.0;

        let lat_offset = (y as f64 - half_grid) * self.degrees_per_cell;
        let lon_offset = (x as f64 - half_grid) * self.degrees_per_cell;

        GeodeticCoords {
            latitude: self.center.latitude + lat_offset,
            longitude: self.center.longitude + lon_offset,
            altitude: self.center.altitude,
        }
    }

    /// Convert geodetic coordinates back to Hilbert index.
    pub fn geodetic_to_hilbert(&self, coords: &GeodeticCoords) -> u64 {
        let half_grid = self.grid_size as f64 / 2.0;

        let x = ((coords.longitude - self.center.longitude) / self.degrees_per_cell + half_grid) as u32;
        let y = ((coords.latitude - self.center.latitude) / self.degrees_per_cell + half_grid) as u32;

        crate::hilbert::xy2d(self.grid_size, x.min(self.grid_size - 1), y.min(self.grid_size - 1))
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cd systems/infinite_map_rs && cargo test hilbert_to_geodetic`
Expected: All tests pass

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/geodetic.rs
git commit -m "feat(geodetic): implement Hilbert-to-Geodetic projection"
```

---

### Task 1.3: Memory Type to Building Typology Mapping

**Files:**
- Modify: `systems/infinite_map_rs/src/geodetic.rs`

**Step 1: Write the failing test**

```rust
#[test]
fn test_memory_type_typology() {
    assert_eq!(MemoryType::Heap.building_typology(), BuildingTypology::Residential);
    assert_eq!(MemoryType::Stack.building_typology(), BuildingTypology::Industrial);
    assert_eq!(MemoryType::Rom.building_typology(), BuildingTypology::Monument);
}

#[test]
fn test_geodetic_coords_with_typology() {
    let projection = HilbertGeodeticProjection::new(64);
    let feature = projection.hilbert_to_feature(0, MemoryType::Heap, 0.75);

    assert_eq!(feature.typology, BuildingTypology::Residential);
    assert!((feature.heat_score - 0.75).abs() < 0.01);
}
```

**Step 2: Run test to verify it fails**

Run: `cd systems/infinite_map_rs && cargo test typology 2>&1 | head -20`
Expected: Error "cannot find type MemoryType"

**Step 3: Write minimal implementation**

```rust
/// Memory region type for typology mapping.
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum MemoryType {
    Heap,
    Stack,
    Rom,
    Mmap,
    Unknown,
}

/// Building typology for 3D visualization.
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum BuildingTypology {
    Residential,   // Heap
    Industrial,    // Stack
    Monument,      // ROM
    Utility,       // Mmap
    Unstructured,  // Unknown
}

impl MemoryType {
    /// Map memory type to building typology for 3D visualization.
    pub fn building_typology(&self) -> BuildingTypology {
        match self {
            MemoryType::Heap => BuildingTypology::Residential,
            MemoryType::Stack => BuildingTypology::Industrial,
            MemoryType::Rom => BuildingTypology::Monument,
            MemoryType::Mmap => BuildingTypology::Utility,
            MemoryType::Unknown => BuildingTypology::Unstructured,
        }
    }
}

/// Geodetic feature with semantic metadata.
#[derive(Debug, Clone)]
pub struct GeodeticFeature {
    /// Geodetic coordinates
    pub coords: GeodeticCoords,
    /// Hilbert index
    pub hilbert_index: u64,
    /// Memory type
    pub memory_type: MemoryType,
    /// Building typology
    pub typology: BuildingTypology,
    /// Heat score (0.0 - 1.0) maps to thermal shader intensity
    pub heat_score: f64,
}

impl HilbertGeodeticProjection {
    /// Convert Hilbert index to a full geodetic feature with metadata.
    pub fn hilbert_to_feature(&self, hilbert_index: u64, memory_type: MemoryType, heat_score: f64) -> GeodeticFeature {
        GeodeticFeature {
            coords: self.hilbert_to_geodetic(hilbert_index),
            hilbert_index,
            memory_type,
            typology: memory_type.building_typology(),
            heat_score: heat_score.clamp(0.0, 1.0),
        }
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cd systems/infinite_map_rs && cargo test typology`
Expected: All tests pass

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/geodetic.rs
git commit -m "feat(geodetic): add MemoryType to BuildingTypology mapping"
```

---

### Task 1.4: Update lib.rs with Geodetic Module

**Files:**
- Modify: `systems/infinite_map_rs/src/lib.rs`

**Step 1: Add module export**

```rust
// In lib.rs, add after existing pub mod declarations:
pub mod geodetic;
pub use geodetic::{
    GeodeticCoords, GeodeticFeature, HilbertGeodeticProjection,
    MemoryType, BuildingTypology,
};
```

**Step 2: Verify compilation**

Run: `cd systems/infinite_map_rs && cargo build`
Expected: Compiles successfully

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/lib.rs
git commit -m "feat(geodetic): export geodetic module from lib.rs"
```

---

## Phase 2: Telemetry Ingestion

### Task 2.1: Create Telemetry Module Structure

**Files:**
- Create: `systems/telemetry/__init__.py`
- Create: `systems/telemetry/telemetry_agent.py`
- Create: `systems/telemetry/tle_parser.py`
- Test: `tests/telemetry/test_tle_parser.py`

**Step 1: Write the failing test**

Create `tests/telemetry/test_tle_parser.py`:

```python
"""Tests for TLE (Two-Line Element) parser."""

import pytest
from systems.telemetry.tle_parser import TLEParser, TLEData


class TestTLEParser:
    def test_parse_iss_tle(self):
        """Parse ISS TLE data."""
        line1 = "1 25544U 98067A   08264.51782528 -.00002182  00000-0 -11606-4 0  2927"
        line2 = "2 25544  51.6416 247.4627 0006703 130.5360 325.0288 15.72125391563537"

        tle = TLEParser.parse(line1, line2)

        assert tle.norad_id == 25544
        assert tle.satellite_name == "ISS"
        assert abs(tle.inclination - 51.6416) < 0.001

    def test_tle_to_orbital_state(self):
        """Convert TLE to orbital state vector."""
        line1 = "1 25544U 98067A   08264.51782528 -.00002182  00000-0 -11606-4 0  2927"
        line2 = "2 25544  51.6416 247.4627 0006703 130.5360 325.0288 15.72125391563537"

        tle = TLEParser.parse(line1, line2)
        state = tle.to_orbital_state()

        assert state.altitude_km > 400  # ISS orbits ~420km
        assert state.velocity_kmps > 7.5  # ~7.66 km/s
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/telemetry/test_tle_parser.py -v 2>&1 | head -20`
Expected: Error "No module named 'systems.telemetry'"

**Step 3: Create module structure**

Create `systems/telemetry/__init__.py`:
```python
"""Telemetry ingestion for WorldView Morphological Layer."""

from systems.telemetry.telemetry_agent import TelemetryAgent
from systems.telemetry.tle_parser import TLEParser, TLEData

__all__ = ["TelemetryAgent", "TLEParser", "TLEData"]
```

Create `systems/telemetry/tle_parser.py`:
```python
"""TLE (Two-Line Element) parser for satellite orbital data."""

from dataclasses import dataclass
from typing import Optional
import math


@dataclass
class OrbitalState:
    """Current orbital state of a satellite."""
    latitude: float  # degrees
    longitude: float  # degrees
    altitude_km: float
    velocity_kmps: float
    epoch: float  # Unix timestamp


@dataclass
class TLEData:
    """Parsed TLE data."""
    norad_id: int
    satellite_name: str
    inclination: float  # degrees
    raan: float  # Right Ascension of Ascending Node
    eccentricity: float
    argument_of_perigee: float
    mean_anomaly: float
    mean_motion: float  # revolutions per day
    epoch_year: int
    epoch_day: float
    line1: str
    line2: str

    def to_orbital_state(self) -> OrbitalState:
        """Convert TLE to approximate orbital state using SGP4 principles."""
        # Simplified orbital mechanics calculation
        # Real implementation would use sgp4 library
        earth_radius_km = 6371.0

        # Mean motion to semi-major axis (Kepler's 3rd law)
        # a^3 = GM / n^2 where n = mean motion in rad/s
        n = self.mean_motion * 2 * math.pi / 86400  # rad/s
        a = (398600.4418 / (n ** 2)) ** (1/3)  # km

        altitude_km = a - earth_radius_km

        # Circular velocity approximation
        velocity_kmps = math.sqrt(398600.4418 / a)

        # Approximate position from mean anomaly
        # This is a simplification - real SGP4 is much more complex
        lat = self.inclination * math.sin(math.radians(self.mean_anomaly))
        lon = self.raan + self.mean_anomaly

        return OrbitalState(
            latitude=lat,
            longitude=lon,
            altitude_km=altitude_km,
            velocity_kmps=velocity_kmps,
            epoch=self._epoch_to_unix(),
        )

    def _epoch_to_unix(self) -> float:
        """Convert TLE epoch to Unix timestamp."""
        # TLE epoch: year (2 or 4 digits) + day of year (fractional)
        import datetime
        year = self.epoch_year
        if year < 57:
            year += 2000
        else:
            year += 1900

        base = datetime.datetime(year, 1, 1)
        delta = datetime.timedelta(days=self.epoch_day - 1)
        return (base + delta).timestamp()


class TLEParser:
    """Parser for NORAD Two-Line Element format."""

    @staticmethod
    def parse(line1: str, line2: str, name: str = "Unknown") -> TLEData:
        """
        Parse TLE lines into structured data.

        Args:
            line1: First line of TLE (starts with '1')
            line2: Second line of TLE (starts with '2')
            name: Optional satellite name

        Returns:
            TLEData with parsed orbital elements
        """
        # Validate line format
        if not line1.startswith('1') or not line2.startswith('2'):
            raise ValueError("Invalid TLE format")

        # Parse line 1
        norad_id = int(line1[2:7])
        epoch_year = int(line1[18:20])
        epoch_day = float(line1[20:32])

        # Parse line 2
        inclination = float(line2[8:16])
        raan = float(line2[17:25])
        eccentricity = float("0." + line2[26:33])
        argument_of_perigee = float(line2[34:42])
        mean_anomaly = float(line2[43:51])
        mean_motion = float(line2[52:63])

        return TLEData(
            norad_id=norad_id,
            satellite_name=name,
            inclination=inclination,
            raan=raan,
            eccentricity=eccentricity,
            argument_of_perigee=argument_of_perigee,
            mean_anomaly=mean_anomaly,
            mean_motion=mean_motion,
            epoch_year=epoch_year,
            epoch_day=epoch_day,
            line1=line1,
            line2=line2,
        )
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/telemetry/test_tle_parser.py -v`
Expected: All tests pass

**Step 5: Commit**

```bash
git add systems/telemetry/ tests/telemetry/
git commit -m "feat(telemetry): add TLE parser for satellite orbital data"
```

---

### Task 2.2: Create TelemetryAgent for NEB Integration

**Files:**
- Create: `systems/telemetry/telemetry_agent.py`
- Test: `tests/telemetry/test_telemetry_agent.py`

**Step 1: Write the failing test**

```python
"""Tests for TelemetryAgent NEB integration."""

import pytest
from unittest.mock import MagicMock, patch
from systems.telemetry.telemetry_agent import TelemetryAgent


class TestTelemetryAgent:
    def test_agent_initialization(self):
        """TelemetryAgent initializes with NEB connection."""
        agent = TelemetryAgent(node_id="telemetry-001")
        assert agent.node_id == "telemetry-001"
        assert agent.neb_bus is not None

    def test_publish_satellite_position(self):
        """Agent publishes satellite position to NEB."""
        agent = TelemetryAgent(node_id="telemetry-001")

        # Mock the NEB bus publish
        agent.neb_bus.publish = MagicMock()

        agent.publish_satellite_position(
            norad_id=25544,
            name="ISS",
            lat=30.0,
            lon=-97.0,
            alt_km=420.0,
            velocity=7.66,
            priority=1,  # CPU priority -> orbital altitude
        )

        # Verify NEB publish was called
        agent.neb_bus.publish.assert_called_once()
        call_args = agent.neb_bus.publish.call_args
        assert "orbital.satellite.25544" in call_args[0][0]
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/telemetry/test_telemetry_agent.py -v 2>&1 | head -20`
Expected: Error "cannot import name 'TelemetryAgent'"

**Step 3: Write minimal implementation**

```python
"""TelemetryAgent - Bridges real-world telemetry to Neural Event Bus."""

import time
from typing import Optional, Dict, Any
from dataclasses import dataclass

from systems.swarm.neb_bus import NEBBus
from systems.swarm.neb_signal import NEBSignal


@dataclass
class SatellitePosition:
    """Satellite position with system mapping."""
    norad_id: int
    name: str
    latitude: float
    longitude: float
    altitude_km: float
    velocity_kmps: float
    cpu_priority: int  # Maps to altitude in visualization
    memory_bandwidth: float  # Maps to velocity in visualization
    timestamp: float


class TelemetryAgent:
    """
    Ingests real-world telemetry and injects into NEB.

    Maps:
    - Satellites (NORAD TLE) -> orbital.satellite.* topics
    - Aviation (ADSB) -> orbital.aviation.* topics
    - System processes -> orbital.process.* topics
    """

    def __init__(self, node_id: str = "telemetry-agent"):
        """Initialize TelemetryAgent with NEB connection."""
        self.node_id = node_id
        self.neb_bus = NEBBus(node_id=node_id)
        self._satellite_cache: Dict[int, SatellitePosition] = {}

    def publish_satellite_position(
        self,
        norad_id: int,
        name: str,
        lat: float,
        lon: float,
        alt_km: float,
        velocity: float,
        priority: int = 0,
    ) -> None:
        """
        Publish satellite position to NEB.

        Args:
            norad_id: NORAD catalog number
            name: Satellite name
            lat: Latitude in degrees
            lon: Longitude in degrees
            alt_km: Altitude in kilometers
            velocity: Velocity in km/s
            priority: CPU priority (maps to orbital visualization)
        """
        topic = f"orbital.satellite.{norad_id}"

        signal = NEBSignal(
            source_id=self.node_id,
            topic=topic,
            payload={
                "norad_id": norad_id,
                "name": name,
                "latitude": lat,
                "longitude": lon,
                "altitude_km": alt_km,
                "velocity_kmps": velocity,
                "cpu_priority": priority,
                "memory_bandwidth": velocity,  # Simplified mapping
            },
            embedding=None,
            timestamp=time.time(),
        )

        self.neb_bus.publish(topic, signal.to_dict())
        self._satellite_cache[norad_id] = SatellitePosition(
            norad_id=norad_id,
            name=name,
            latitude=lat,
            longitude=lon,
            altitude_km=alt_km,
            velocity_kmps=velocity,
            cpu_priority=priority,
            memory_bandwidth=velocity,
            timestamp=time.time(),
        )

    def map_process_to_satellite(
        self,
        process_id: int,
        process_name: str,
        cpu_priority: int,
        memory_bandwidth: float,
    ) -> SatellitePosition:
        """
        Map a system process to a virtual satellite.

        Process priority -> orbital altitude
        Memory bandwidth -> orbital velocity
        """
        # Map CPU priority (typically -20 to 20) to altitude
        # Higher priority = higher orbit (more "important" view)
        base_alt = 400  # ISS-like base
        alt_km = base_alt + (cpu_priority + 20) * 10  # 200km range

        # Generate position based on process ID (deterministic)
        import hashlib
        h = hashlib.md5(str(process_id).encode()).digest()
        lat = ((h[0] / 255.0) - 0.5) * 180
        lon = ((h[1] / 255.0) - 0.5) * 360

        return SatellitePosition(
            norad_id=process_id,  # Reuse field for process ID
            name=process_name,
            latitude=lat,
            longitude=lon,
            altitude_km=alt_km,
            velocity_kmps=memory_bandwidth,
            cpu_priority=cpu_priority,
            memory_bandwidth=memory_bandwidth,
            timestamp=time.time(),
        )
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/telemetry/test_telemetry_agent.py -v`
Expected: All tests pass

**Step 5: Commit**

```bash
git add systems/telemetry/telemetry_agent.py tests/telemetry/test_telemetry_agent.py
git commit -m "feat(telemetry): add TelemetryAgent for NEB integration"
```

---

## Phase 3: Diagnostic Shaders

### Task 3.1: Create Thermal Shader

**Files:**
- Create: `systems/visual_shell/shaders/thermal.wgsl`
- Create: `systems/visual_shell/shaders/README.md`

**Step 1: Write thermal shader**

Create `systems/visual_shell/shaders/thermal.wgsl`:

```wgsl
// Thermal Diagnostic Shader for Geometry OS
// Visualizes "hot" memory and CPU usage via heat-map gradients

struct ThermalUniforms {
    time: f32,
    intensity: f32,
    threshold_low: f32,
    threshold_high: f32,
}

@group(0) @binding(0) var<uniform> uniforms: ThermalUniforms;
@group(0) @binding(1) var input_texture: texture_2d<f32>;
@group(0) @binding(2) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Heat gradient: black -> blue -> cyan -> green -> yellow -> red -> white
fn heat_color(value: f32) -> vec4<f32> {
    let v = clamp(value, 0.0, 1.0);

    if (v < 0.2) {
        // Black to blue
        return vec4<f32>(0.0, 0.0, v * 5.0, 1.0);
    } else if (v < 0.4) {
        // Blue to cyan
        let t = (v - 0.2) * 5.0;
        return vec4<f32>(0.0, t, 1.0, 1.0);
    } else if (v < 0.6) {
        // Cyan to green
        let t = (v - 0.4) * 5.0;
        return vec4<f32>(0.0, 1.0, 1.0 - t, 1.0);
    } else if (v < 0.8) {
        // Green to yellow
        let t = (v - 0.6) * 5.0;
        return vec4<f32>(t, 1.0, 0.0, 1.0);
    } else {
        // Yellow to red to white
        let t = (v - 0.8) * 5.0;
        return vec4<f32>(1.0, 1.0 - t * 0.5, t * 0.3, 1.0);
    }
}

@compute @workgroup_size(8, 8)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let dims = textureDimensions(input_texture);
    let coords = vec2<i32>(global_id.xy);

    if (coords.x >= i32(dims.x) || coords.y >= i32(dims.y)) {
        return;
    }

    let input_color = textureLoad(input_texture, coords, 0);
    let luminance = dot(input_color.rgb, vec3<f32>(0.299, 0.587, 0.114));

    // Apply thermal mapping based on luminance (heat score from memory access)
    let heat_value = luminance * uniforms.intensity;
    let thermal_color = heat_color(heat_value);

    textureStore(output_texture, coords, thermal_color);
}
```

**Step 2: Create shader README**

Create `systems/visual_shell/shaders/README.md`:

```markdown
# Diagnostic Shaders for WorldView Morphological Layer

These shaders provide system observability through visual effects.

## Shaders

### thermal.wgsl
Visualizes "hot" memory regions and CPU-intensive processes.
- **Input**: Luminance from source texture (represents heat score)
- **Output**: Heat-map gradient (blue=cold, red=hot)
- **Use Case**: Identify memory leaks, runaway processes

### nvg.wgsl (planned)
Night Vision Goggle effect - highlights hidden/encrypted data.
- **Input**: Texture with semantic metadata
- **Output**: Monochrome green with noise grain
- **Use Case**: Reveal .rts.png encrypted containers

### crt.wgsl (planned)
CRT distortion effect - visualizes Phase Alignment Stability.
- **Input**: Stable viewport frame
- **Output**: Scanline distortion proportional to PAS drift
- **Use Case**: Detect kernel-viewport desynchronization

## Usage

```rust
// In Visual Shell renderer
let thermal_shader = device.create_shader_module(&include_wgsl!("thermal.wgsl"));
// Apply to regions with high heat_score from GeodeticFeature
```
```

**Step 3: Commit**

```bash
git add systems/visual_shell/shaders/
git commit -m "feat(shaders): add thermal diagnostic shader for heat visualization"
```

---

### Task 3.2: Create NVG Shader

**Files:**
- Create: `systems/visual_shell/shaders/nvg.wgsl`

**Step 1: Write NVG shader**

```wgsl
// NVG (Night Vision Goggle) Diagnostic Shader for Geometry OS
// Highlights hidden or encrypted data fragments

struct NVGUniforms {
    time: f32,
    gain: f32,
    noise_intensity: f32,
    hidden_threshold: f32,
}

@group(0) @binding(0) var<uniform> uniforms: NVGUniforms;
@group(0) @binding(1) var input_texture: texture_2d<f32>;
@group(0) @binding(2) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Pseudo-random noise for grain effect
fn random(coords: vec2<i32>, time: f32) -> f32 {
    let dot = f32(coords.x * 12 + coords.y * 783) + time;
    return fract(sin(dot) * 43758.5453);
}

@compute @workgroup_size(8, 8)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let dims = textureDimensions(input_texture);
    let coords = vec2<i32>(global_id.xy);

    if (coords.x >= i32(dims.x) || coords.y >= i32(dims.y)) {
        return;
    }

    let input_color = textureLoad(input_texture, coords, 0);
    let luminance = dot(input_color.rgb, vec3<f32>(0.299, 0.587, 0.114));

    // Apply gain (amplification) for night vision effect
    var amplified = luminance * uniforms.gain;

    // Detect "hidden" data (low alpha or specific markers)
    let is_hidden = input_color.a < uniforms.hidden_threshold;
    if (is_hidden) {
        amplified *= 2.0; // Extra bright for hidden data
    }

    // Add noise grain
    let noise = random(coords, uniforms.time) * uniforms.noise_intensity;
    amplified += noise;

    // Clamp to valid range
    amplified = clamp(amplified, 0.0, 1.0);

    // NVG green monochrome output
    let green = vec3<f32>(0.1, amplified, 0.05);
    let alpha = if is_hidden { 1.0 } else { 0.8 };

    textureStore(output_texture, coords, vec4<f32>(green, alpha));
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/shaders/nvg.wgsl
git commit -m "feat(shaders): add NVG shader for hidden data visualization"
```

---

### Task 3.3: Create CRT Shader (PAS Visualization)

**Files:**
- Create: `systems/visual_shell/shaders/crt.wgsl`

**Step 1: Write CRT shader**

```wgsl
// CRT Diagnostic Shader for Geometry OS
// Visualizes Phase Alignment Stability (PAS) through scanline distortion

struct CRTUniforms {
    time: f32,
    pas_score: f32,        // Phase Alignment Stability (0 = unstable, 1 = stable)
    scanline_intensity: f32,
    distortion_amount: f32,
    resolution: vec2<f32>,
}

@group(0) @binding(0) var<uniform> uniforms: CRTUniforms;
@group(0) @binding(1) var input_texture: texture_2d<f32>;
@group(0) @binding(2) var output_texture: texture_storage_2d<rgba8unorm, write>;

fn random(coords: vec2<f32>) -> f32 {
    return fract(sin(dot(coords, vec2<f32>(12.9898, 78.233))) * 43758.5453);
}

@compute @workgroup_size(8, 8)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let dims = textureDimensions(input_texture);
    let frag_coord = vec2<f32>(global_id.xy);

    if (frag_coord.x >= f32(dims.x) || frag_coord.y >= f32(dims.y)) {
        return;
    }

    // Distortion increases as PAS decreases
    let distortion = (1.0 - uniforms.pas_score) * uniforms.distortion_amount;

    // Apply barrel distortion
    let uv = frag_coord / uniforms.resolution;
    let center = uv - 0.5;
    let dist = length(center);
    let distorted_uv = uv + center * dist * dist * distortion;

    // Sample with distortion
    let sample_coords = vec2<i32>(distorted_uv * uniforms.resolution);

    var color = vec4<f32>(0.0);
    if (sample_coords.x >= 0 && sample_coords.x < i32(dims.x) &&
        sample_coords.y >= 0 && sample_coords.y < i32(dims.y)) {
        color = textureLoad(input_texture, sample_coords, 0);
    }

    // Scanline effect (intensity based on PAS)
    let scanline = sin(frag_coord.y * 0.5) * 0.5 + 0.5;
    let scanline_factor = 1.0 - (1.0 - scanline) * uniforms.scanline_intensity * (1.0 - uniforms.pas_score);
    color.rgb *= scanline_factor;

    // RGB phosphor separation (increases with instability)
    let separation = distortion * 2.0;
    let r_offset = vec2<i32>(i32(separation), 0);
    let b_offset = vec2<i32>(-i32(separation), 0);

    let r_sample_coords = sample_coords + r_offset;
    let b_sample_coords = sample_coords + b_offset;

    if (r_sample_coords.x >= 0 && r_sample_coords.x < i32(dims.x) &&
        r_sample_coords.y >= 0 && r_sample_coords.y < i32(dims.y)) {
        color.r = textureLoad(input_texture, r_sample_coords, 0).r;
    }
    if (b_sample_coords.x >= 0 && b_sample_coords.x < i32(dims.x) &&
        b_sample_coords.y >= 0 && b_sample_coords.y < i32(dims.y)) {
        color.b = textureLoad(input_texture, b_sample_coords, 0).b;
    }

    // Vignette effect
    let vignette = 1.0 - dist * 0.5;
    color.rgb *= vignette;

    // Jitter when PAS is very low
    if (uniforms.pas_score < 0.3) {
        let jitter = (random(uv + uniforms.time) - 0.5) * (1.0 - uniforms.pas_score) * 0.1;
        color.rgb += jitter;
    }

    textureStore(output_texture, vec2<i32>(global_id.xy), color);
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/shaders/crt.wgsl
git commit -m "feat(shaders): add CRT shader for PAS stability visualization"
```

---

## Phase 4: Vibe Agent Orchestrator

### Task 4.1: Create VibeAgentOrchestrator

**Files:**
- Create: `systems/evolution_daemon/vibe_orchestrator.py`
- Test: `tests/evolution_daemon/test_vibe_orchestrator.py`

**Step 1: Write the failing test**

```python
"""Tests for VibeAgentOrchestrator - multi-agent CLI for parallel evolution."""

import pytest
from unittest.mock import MagicMock, patch, AsyncMock
from systems.evolution_daemon.vibe_orchestrator import (
    VibeAgentOrchestrator,
    AgentTrack,
    VibeSession,
)


class TestVibeAgentOrchestrator:
    def test_orchestrator_initialization(self):
        """Orchestrator initializes with agent tracks."""
        orchestrator = VibeAgentOrchestrator()
        assert orchestrator is not None
        assert len(orchestrator.tracks) == 3  # Shader, Logic, Performance

    def test_agent_tracks_defined(self):
        """Agent tracks have correct specializations."""
        orchestrator = VibeAgentOrchestrator()

        assert AgentTrack.SHADER in orchestrator.tracks
        assert AgentTrack.LOGIC in orchestrator.tracks
        assert AgentTrack.PERFORMANCE in orchestrator.tracks

    @pytest.mark.asyncio
    async def test_start_vibe_session(self):
        """Can start a vibe coding session with parallel agents."""
        orchestrator = VibeAgentOrchestrator()

        session = await orchestrator.start_session(
            goal="Implement thermal shader with heat gradient",
            tracks=[AgentTrack.SHADER, AgentTrack.LOGIC],
        )

        assert session is not None
        assert session.status == "running"
        assert len(session.active_agents) == 2
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/evolution_daemon/test_vibe_orchestrator.py -v 2>&1 | head -20`
Expected: Error "cannot import name 'VibeAgentOrchestrator'"

**Step 3: Write minimal implementation**

```python
"""
VibeAgentOrchestrator - Multi-agent CLI for parallel OS evolution.

Implements the "vibe coding" pattern from WorldView where multiple
specialized agents work in parallel on different tracks.
"""

import asyncio
from enum import Enum
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional
from datetime import datetime
import uuid


class AgentTrack(Enum):
    """Specialization tracks for vibe coding agents."""
    SHADER = "shader"      # GLSL/WGSL post-processing effects
    LOGIC = "logic"        # Core algorithms and data structures
    PERFORMANCE = "perf"   # Memory management, rendering optimization
    DATA = "data"          # Data pipelines and ingestion
    UI = "ui"              # User interface and interaction


@dataclass
class VibeAgent:
    """A single agent in a vibe coding session."""
    agent_id: str
    track: AgentTrack
    status: str = "idle"
    current_task: Optional[str] = None
    context: Dict[str, Any] = field(default_factory=dict)


@dataclass
class VibeSession:
    """A vibe coding session with parallel agents."""
    session_id: str
    goal: str
    tracks: List[AgentTrack]
    active_agents: Dict[AgentTrack, VibeAgent] = field(default_factory=dict)
    status: str = "pending"
    created_at: datetime = field(default_factory=datetime.now)
    shared_context: Dict[str, Any] = field(default_factory=dict)

    def add_agent_result(self, track: AgentTrack, result: Dict[str, Any]) -> None:
        """Add result from an agent to shared context."""
        if "results" not in self.shared_context:
            self.shared_context["results"] = {}
        self.shared_context["results"][track.value] = result


class VibeAgentOrchestrator:
    """
    Orchestrates multiple AI agents for parallel evolution.

    Inspired by WorldView's approach where 4-8 agents work simultaneously
    on different technical domains.

    Usage:
        orchestrator = VibeAgentOrchestrator()
        session = await orchestrator.start_session(
            goal="Implement diagnostic shader",
            tracks=[AgentTrack.SHADER, AgentTrack.PERFORMANCE]
        )
        results = await orchestrator.wait_for_completion(session)
    """

    def __init__(self):
        """Initialize the orchestrator with default tracks."""
        self.tracks: Dict[AgentTrack, str] = {
            AgentTrack.SHADER: "Specialized in WGSL/GLSL post-processing effects",
            AgentTrack.LOGIC: "Specialized in core algorithms and data structures",
            AgentTrack.PERFORMANCE: "Specialized in memory management and optimization",
            AgentTrack.DATA: "Specialized in data pipelines and ingestion",
            AgentTrack.UI: "Specialized in user interface and interaction",
        }
        self._sessions: Dict[str, VibeSession] = {}

    async def start_session(
        self,
        goal: str,
        tracks: List[AgentTrack],
    ) -> VibeSession:
        """
        Start a new vibe coding session.

        Args:
            goal: The high-level goal for this session
            tracks: Which agent tracks to activate

        Returns:
            VibeSession with active agents
        """
        session_id = str(uuid.uuid4())[:8]

        session = VibeSession(
            session_id=session_id,
            goal=goal,
            tracks=tracks,
            status="running",
        )

        # Spawn agents for each track
        for track in tracks:
            agent = VibeAgent(
                agent_id=f"{track.value}-{session_id}",
                track=track,
                status="active",
                current_task=goal,
            )
            session.active_agents[track] = agent

        self._sessions[session_id] = session
        return session

    async def wait_for_completion(
        self,
        session: VibeSession,
        timeout: float = 300.0,
    ) -> Dict[str, Any]:
        """
        Wait for all agents to complete their tasks.

        Args:
            session: The session to wait for
            timeout: Maximum time to wait in seconds

        Returns:
            Aggregated results from all agents
        """
        start_time = asyncio.get_event_loop().time()

        while asyncio.get_event_loop().time() - start_time < timeout:
            all_complete = all(
                agent.status == "complete"
                for agent in session.active_agents.values()
            )
            if all_complete:
                session.status = "complete"
                return session.shared_context.get("results", {})
            await asyncio.sleep(0.1)

        session.status = "timeout"
        return session.shared_context.get("results", {})

    def get_session(self, session_id: str) -> Optional[VibeSession]:
        """Get a session by ID."""
        return self._sessions.get(session_id)

    def list_active_sessions(self) -> List[VibeSession]:
        """List all active sessions."""
        return [
            s for s in self._sessions.values()
            if s.status == "running"
        ]
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/evolution_daemon/test_vibe_orchestrator.py -v`
Expected: All tests pass

**Step 5: Commit**

```bash
git add systems/evolution_daemon/vibe_orchestrator.py tests/evolution_daemon/test_vibe_orchestrator.py
git commit -m "feat(evolution): add VibeAgentOrchestrator for parallel agent evolution"
```

---

### Task 4.2: Integrate VibeOrchestrator with Evolution Daemon

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon_v8.py` (or create if needed)
- Test: Update test file

**Step 1: Add integration method**

```python
# In evolution_daemon_v8.py or equivalent

from systems.evolution_daemon.vibe_orchestrator import (
    VibeAgentOrchestrator,
    AgentTrack,
)

class EvolutionDaemonV8:
    """Evolution daemon with vibe coding support."""

    def __init__(self):
        # ... existing init ...
        self.vibe_orchestrator = VibeAgentOrchestrator()

    async def evolve_with_vibe(
        self,
        goal: str,
        tracks: List[AgentTrack] = None,
    ) -> Dict[str, Any]:
        """
        Perform evolution using parallel vibe coding agents.

        This is the WorldView-style evolution where multiple agents
        work simultaneously on different aspects of the codebase.
        """
        if tracks is None:
            tracks = [AgentTrack.LOGIC, AgentTrack.PERFORMANCE]

        session = await self.vibe_orchestrator.start_session(
            goal=goal,
            tracks=tracks,
        )

        results = await self.vibe_orchestrator.wait_for_completion(session)
        return results
```

**Step 2: Commit**

```bash
git add systems/evolution_daemon/evolution_daemon_v8.py
git commit -m "feat(evolution): integrate VibeOrchestrator with EvolutionDaemonV8"
```

---

## Summary

This plan implements the WorldView Morphological Layer across 4 phases:

| Phase | Component | Files Created | Key Deliverable |
|-------|-----------|---------------|-----------------|
| 1 | Core Foundation | `geodetic.rs` | Hilbert→Geodetic projection |
| 2 | Telemetry | `telemetry_agent.py`, `tle_parser.py` | NORAD/NEB integration |
| 3 | Shaders | `thermal.wgsl`, `nvg.wgsl`, `crt.wgsl` | Diagnostic visualization |
| 4 | Evolution | `vibe_orchestrator.py` | Multi-agent CLI orchestration |

**Total Tasks:** 12 bite-sized tasks with TDD approach
**Estimated Time:** 2-4 hours with fresh subagent per task
