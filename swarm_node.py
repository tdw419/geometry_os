#!/usr/bin/env python3
"""
Swarm Node Launcher for Geometry OS
====================================

Start a new swarm node to join the Geometry OS distributed cluster.

Usage:
    python3 swarm_node.py                          # Start with defaults
    python3 swarm_node.py --port 6001              # Custom TCP port
    python3 swarm_node.py --capabilities compute,gpu_render,llm_inference
    python3 swarm_node.py --name "worker-01" --port 6001

The node will automatically discover other nodes via UDP broadcast on port 5001.
"""

import asyncio
import argparse
import sys
import logging
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent))

from systems.swarm.swarm_daemon import SwarmDaemon

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger("SwarmNode")

# Predefined capability presets
CAPABILITY_PRESETS = {
    "full": ["compute", "pixel_rts", "llm_inference", "gpu_render", "verification"],
    "compute": ["compute", "pixel_rts"],
    "gpu": ["gpu_render", "compute"],
    "llm": ["llm_inference", "compute"],
    "verifier": ["verification", "formal_proofs"],
    "minimal": ["compute"],
}

def parse_capabilities(cap_str: str) -> list:
    """Parse capabilities from comma-separated string or preset name."""
    if cap_str in CAPABILITY_PRESETS:
        return CAPABILITY_PRESETS[cap_str]
    return [c.strip() for c in cap_str.split(",")]


async def run_node(port: int, capabilities: list, name: str = None, discovery_port: int = 5001):
    """Start and run the swarm daemon."""
    logger.info(f"🐝 Starting Swarm Node '{name or 'unnamed'}' on port {port}")
    logger.info(f"   Capabilities: {capabilities}")
    logger.info(f"   Discovery port: {discovery_port}")

    daemon = SwarmDaemon(
        port=port,
        capabilities=capabilities
    )

    # Set custom node name if provided
    if name:
        daemon.telepathy.node_id = name[:8]  # Truncate to 8 chars

    try:
        await daemon.start()
    except KeyboardInterrupt:
        logger.info("🛑 Shutdown requested...")
    except Exception as e:
        logger.error(f"❌ Error running node: {e}")
        raise


def main():
    parser = argparse.ArgumentParser(
        description="Start a Geometry OS Swarm Node",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Capability Presets:
  full       - All capabilities: compute, pixel_rts, llm_inference, gpu_render, verification
  compute    - General compute: compute, pixel_rts
  gpu        - GPU rendering: gpu_render, compute
  llm        - LLM inference: llm_inference, compute
  verifier   - Verification: verification, formal_proofs
  minimal    - Just compute: compute

Examples:
  %(prog)s                              # Start with defaults (port 6000, full capabilities)
  %(prog)s --port 6001 --preset gpu     # GPU worker on port 6001
  %(prog)s -p 6002 -c llm_inference,compute  # Custom capabilities
  %(prog)s --name "worker-alpha"        # Named node for identification
"""
    )

    parser.add_argument(
        "-p", "--port",
        type=int,
        default=6000,
        help="TCP port for this node (default: 6000)"
    )

    parser.add_argument(
        "-c", "--capabilities",
        type=str,
        default="full",
        help="Comma-separated capabilities or preset name (default: full)"
    )

    parser.add_argument(
        "--preset",
        type=str,
        choices=list(CAPABILITY_PRESETS.keys()),
        help="Use a capability preset"
    )

    parser.add_argument(
        "-n", "--name",
        type=str,
        help="Node name (truncated to 8 chars)"
    )

    parser.add_argument(
        "--discovery-port",
        type=int,
        default=5001,
        help="UDP discovery port for auto-finding peers (default: 5001)"
    )

    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Enable debug logging"
    )

    args = parser.parse_args()

    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)

    # Determine capabilities
    if args.preset:
        capabilities = CAPABILITY_PRESETS[args.preset]
    else:
        capabilities = parse_capabilities(args.capabilities)

    print(f"""
╔══════════════════════════════════════════════════════════════╗
║              🐝 GEOMETRY OS SWARM NODE                       ║
╠══════════════════════════════════════════════════════════════╣
║  Port:           {args.port:<43} ║
║  Capabilities:   {', '.join(capabilities):<43} ║
║  Discovery:      UDP port {args.discovery_port:<35} ║
║  Name:           {args.name or 'auto-generated':<43} ║
╚══════════════════════════════════════════════════════════════╝

Press Ctrl+C to stop the node.
""")

    try:
        asyncio.run(run_node(
            port=args.port,
            capabilities=capabilities,
            name=args.name,
            discovery_port=args.discovery_port
        ))
    except KeyboardInterrupt:
        print("\n👋 Swarm node stopped.")


if __name__ == "__main__":
    main()
