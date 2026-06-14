"""
G-Shell: AI-Native Terminal with Spatial Computing

A terminal that bridges standard Linux bash with Geometry OS spatial computing.
The terminal state is encoded as Hilbert-mapped RGBA textures for AI perception.

Usage:
    g-shell shell              # Start interactive G-Shell session
    g-shell map                # Show current spatial map
    g-shell spawn <cmd>        # Spawn a process in a tile
    g-shell ai <prompt>        # Send context to AI
    g-shell --help             # Show all commands

For AI agents, use --json flag for structured output:
    g-shell --json map
"""

__version__ = "1.0.0"
__author__ = "Geometry OS Contributors"
