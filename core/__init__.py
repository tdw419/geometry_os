"""
Core module for Geometry OS.

This package contains fundamental components:
- atlas_gen: Font atlas generation
- config_manager: Centralized configuration management
- config_deployer: Multi-instance configuration deployment
- config_cli: Configuration CLI tools
- debug_logger: Granular logging framework
- error_handler: Circuit breaker and retry logic
- error_integration: Error handling integration
- exceptions: Custom exception hierarchy
- unified_logging: Unified logging system
- hilbert_util: Hilbert curve utilities
- geo_cc: C compiler interface
- libgeo: Geometry library
- spirv_gen: SPIR-V generation
- ttf_export: TTF font export
- init: Initialization module
"""

# Core exports
from core.atlas_gen import generate_atlas, GLYPH_SIZE, ATLAS_SIZE
from core.hilbert_util import HilbertCurve

__all__ = [
    "generate_atlas",
    "GLYPH_SIZE",
    "ATLAS_SIZE",
    "HilbertCurve",
]
