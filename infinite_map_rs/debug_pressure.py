#!/usr/bin/env python3
"""Debug pressure calculations for refinery simulation."""

import math

# Constants
GRAVITY = 9.81  # m/s²
ATMOSPHERIC_PRESSURE = 101325.0  # Pa
TANK_DIAMETER = 10.0  # m
TANK_AREA = math.pi * (TANK_DIAMETER / 2.0) ** 2
CRUDE_OIL_DENSITY = 851.0  # kg/m³ at 298K

def tank_pressure_from_volume(volume_m3):
    """Calculate hydrostatic pressure from fluid volume."""
    if volume_m3 <= 0:
        return ATMOSPHERIC_PRESSURE

    fluid_height = volume_m3 / TANK_AREA
    hydrostatic_pressure = CRUDE_OIL_DENSITY * GRAVITY * fluid_height
    return ATMOSPHERIC_PRESSURE + hydrostatic_pressure

# Test different volumes
volumes = [0, 100, 500, 1000]

print(f"Tank diameter: {TANK_DIAMETER} m")
print(f"Tank area: {TANK_AREA:.2f} m²")
print(f"Atmospheric pressure: {ATMOSPHERIC_PRESSURE:.0f} Pa ({ATMOSPHERIC_PRESSURE/1e6:.3f} MPa)")
print()

for vol in volumes:
    pressure = tank_pressure_from_volume(vol)
    hydrostatic = pressure - ATMOSPHERIC_PRESSURE
    print(f"Volume: {vol:4.0f} m³ → Height: {vol/TANK_AREA:5.2f} m → Hydrostatic: {hydrostatic/1000:6.2f} kPa → Total: {pressure/1e6:.3f} MPa")

print()
print("Pipe pressure setting (from test): 2.0 MPa = 2,000,000 Pa")
print("Hydrostatic pressure from 1000 m³: ~109 kPa = 0.109 MPa")
print("Ratio: hydrostatic / pipe = 0.109 / 2.0 = 0.0545 (5.45%)")
print("Threshold check: 0.109 MPa < 2.0 MPa * 0.1 = 0.2 MPa? YES → fallback to pipe pressure")