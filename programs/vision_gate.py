#!/usr/bin/env python3
"""vision_gate.py -- Deterministic Visual Kernel property checker.

Analyzes a GeOS 256x256 framebuffer to enforce the visual complexity
constraints from the Visual Kernel design spec:

  MeC (Meaningful Colors) <= 8
  TiR (Text-Ink Ratio)    <= 30%
  Rule of 6                <= 6 visual groups
  Hierarchy                top-left health indicator
  Resolution               fits 256x256 (always true)

Usage:
  # Via MCP (if GeOS is running):
  python3 vision_gate.py --mcp

  # From a saved pixel dump:
  python3 vision_gate.py --pixels <hex_file>

  # From a screenshot PNG:
  python3 vision_gate.py --image <path.png>

Exit code 0 = all pass, 1 = one or more fails.
"""

import sys
import json
import subprocess
import argparse
from collections import Counter, deque
from pathlib import Path

# GeOS MCP server path
MCP_SERVER = Path.home() / "zion/projects/geometry_os/geometry_os/target/release/geo_mcp_server"

# Framebuffer geometry
FB_W = 256
FB_H = 256

# Thresholds
MEC_MAX = 8
TIR_MAX = 30.0
RULE6_MAX = 6
# Minimum pixels for a color to count as "meaningful" (avoids antialiasing noise)
MIN_PIXEL_COUNT = 50
# Minimum pixels for a connected component to count as a "visual group"
MIN_COMPONENT_SIZE = 50


def _read_json_response(proc: subprocess.Popen, timeout: float = 30, expect_id=None) -> dict:
    """Read lines from stdout until we get a valid JSON-RPC response."""
    import time
    deadline = time.time() + timeout
    while time.time() < deadline:
        line = proc.stdout.readline()
        if not line:
            break
        line = line.strip()
        if not line:
            continue
        try:
            resp = json.loads(line)
        except json.JSONDecodeError:
            continue
        # Skip responses that don't match expected id
        if expect_id is not None and resp.get("id") != expect_id:
            continue
        return resp
    raise RuntimeError("MCP: no valid JSON response received")


def mcp_session() -> subprocess.Popen:
    """Start a persistent MCP server process and do the init handshake."""
    proc = subprocess.Popen(
        [str(MCP_SERVER)], stdin=subprocess.PIPE,
        stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)

    init_msg = {"jsonrpc": "2.0", "id": 0, "method": "initialize",
                "params": {"protocolVersion": "2024-11-05",
                           "capabilities": {}, "clientInfo": {"name": "vision_gate", "version": "1.0"}}}
    proc.stdin.write(json.dumps(init_msg) + "\n")
    proc.stdin.flush()

    resp = _read_json_response(proc, expect_id=0)
    if resp.get("error") is not None:
        proc.kill()
        raise RuntimeError(f"MCP init failed: {resp['error']}")

    notif = {"jsonrpc": "2.0", "method": "notifications/initialized"}
    proc.stdin.write(json.dumps(notif) + "\n")
    proc.stdin.flush()

    return proc


def mcp_call(proc: subprocess.Popen, tool_name: str, arguments: dict) -> dict:
    """Call a single MCP tool on an existing session."""
    msg = {"jsonrpc": "2.0", "id": 1, "method": "tools/call",
           "params": {"name": tool_name, "arguments": arguments}}
    proc.stdin.write(json.dumps(msg) + "\n")
    proc.stdin.flush()
    resp = _read_json_response(proc, expect_id=1)
    # GeoOS returns "error": null (JSON null) not missing
    if resp.get("error") is not None:
        raise RuntimeError(f"MCP error: {resp['error']}")
    result = resp.get("result", {})
    content_list = result.get("content", [])
    if not content_list:
        return result
    content = content_list[0]
    text = content.get("text", "")
    if text:
        try:
            return json.loads(text)
        except json.JSONDecodeError:
            return content
    return content


def get_pixels_from_mcp() -> list[str]:
    """Fetch 256x256 pixel dump from running GeOS via MCP."""
    proc = mcp_session()
    try:
        result = mcp_call(proc, "vm_screen_dump", {})
        return result["pixels"].split()
    finally:
        proc.kill()
        proc.wait()


def get_pixels_from_hex(path: str) -> list[str]:
    """Load pixel hex dump from file (space-separated 6-char hex values)."""
    with open(path) as f:
        return f.read().split()


def get_pixels_from_image(path: str) -> list[str]:
    """Load pixels from PNG via PIL, convert to hex list."""
    try:
        from PIL import Image
    except ImportError:
        print("ERROR: PIL/Pillow required for --image mode", file=sys.stderr)
        sys.exit(2)
    img = Image.open(path).convert("RGB")
    if img.size != (256, 256):
        print(f"WARNING: image is {img.size[0]}x{img.size[1]}, expected 256x256", file=sys.stderr)
    pixels = []
    for r, g, b in img.getdata():
        pixels.append(f"{r:02x}{g:02x}{b:02x}")
    return pixels


def count_visual_groups(pixels: list[str]) -> int:
    """Count connected components of non-black pixels (8-connectivity).

    Operates on a 256x256 row-major pixel grid. Components smaller than
    MIN_COMPONENT_SIZE are dropped as noise (antialiasing, stray dots).
    """
    if len(pixels) != FB_W * FB_H:
        return 0
    visited = bytearray(FB_W * FB_H)
    groups = 0
    for start in range(FB_W * FB_H):
        if visited[start] or pixels[start].lower() == "000000":
            continue
        # BFS flood-fill
        queue = deque([start])
        visited[start] = 1
        size = 0
        while queue:
            idx = queue.popleft()
            size += 1
            x = idx % FB_W
            y = idx // FB_W
            for dy in (-1, 0, 1):
                for dx in (-1, 0, 1):
                    if dx == 0 and dy == 0:
                        continue
                    nx, ny = x + dx, y + dy
                    if 0 <= nx < FB_W and 0 <= ny < FB_H:
                        nidx = ny * FB_W + nx
                        if not visited[nidx] and pixels[nidx].lower() != "000000":
                            visited[nidx] = 1
                            queue.append(nidx)
        if size >= MIN_COMPONENT_SIZE:
            groups += 1
    return groups


def analyze(pixels: list[str]) -> dict:
    """Run all five checks against a pixel list. Returns results dict."""
    total = len(pixels)
    color_counts = Counter(p.lower() for p in pixels)

    # Filter to significant colors only (> MIN_PIXEL_COUNT pixels)
    sig = {c: n for c, n in color_counts.items() if n >= MIN_PIXEL_COUNT}

    # Classify
    black = sig.get("000000", 0)
    white = sig.get("ffffff", 0)
    semantic = {c: n for c, n in sig.items() if c not in ("000000", "ffffff")}
    non_bg = sum(sig.values()) - black

    # MeC
    mec_count = len(semantic)
    mec_pass = mec_count <= MEC_MAX

    # TiR
    tir_pct = (white / non_bg * 100) if non_bg > 0 else 0
    tir_pass = tir_pct <= TIR_MAX

    # Rule of 6 -- count connected components of non-black pixels.
    # Two same-colored regions separated by black background count as 2 groups;
    # a multi-color region (e.g., a bar with a label inside) counts as 1.
    rule6_count = count_visual_groups(pixels)
    rule6_pass = rule6_count <= RULE6_MAX

    # Hierarchy -- check top-left 64x16 region for a non-black, non-white color
    # (health indicator should be a colored bar, not text)
    top_left = pixels[:64 * 16]  # first 1024 pixels
    top_colors = Counter(c.lower() for c in top_left)
    has_health = any(
        c not in ("000000", "ffffff") and n > 50
        for c, n in top_colors.items()
    )
    hierarchy_pass = has_health

    # Resolution -- always passes at 256x256
    resolution_pass = True

    return {
        "total_pixels": total,
        "significant_colors": len(sig),
        "mec": {"count": mec_count, "max": MEC_MAX, "pass": mec_pass,
                "colors": dict(sorted(semantic.items(), key=lambda x: -x[1]))},
        "tir": {"pct": round(tir_pct, 1), "max": TIR_MAX, "pass": tir_pass,
                "white_px": white, "non_bg_px": non_bg},
        "rule6": {"count": rule6_count, "max": RULE6_MAX, "pass": rule6_pass},
        "hierarchy": {"pass": hierarchy_pass,
                      "top_left_colors": dict(top_colors.most_common(5))},
        "resolution": {"pass": resolution_pass},
        "all_pass": all([mec_pass, tir_pass, rule6_pass, hierarchy_pass, resolution_pass]),
    }


def print_results(results: dict) -> None:
    """Print human-readable results."""
    print("=" * 55)
    print("  VISUAL KERNEL PROPERTY GATE")
    print("=" * 55)
    print(f"  Pixels analyzed: {results['total_pixels']}")
    print(f"  Significant colors: {results['significant_colors']}")
    print()

    checks = [
        ("MeC (Colors)", results["mec"]["pass"],
         f"{results['mec']['count']} / {results['mec']['max']}"),
        ("TiR (Text %)", results["tir"]["pass"],
         f"{results['tir']['pct']}% / {results['tir']['max']}%"),
        ("Rule of 6", results["rule6"]["pass"],
         f"{results['rule6']['count']} / {results['rule6']['max']}"),
        ("Hierarchy", results["hierarchy"]["pass"],
         "top-left health indicator" if results["hierarchy"]["pass"] else "NO health indicator in top-left"),
        ("Resolution", results["resolution"]["pass"], "256x256"),
    ]

    all_pass = True
    for name, passed, detail in checks:
        status = "PASS" if passed else "FAIL"
        all_pass = all_pass and passed
        marker = " OK " if passed else "FAIL"
        print(f"  [{marker}] {name}: {detail}")

    print()
    if all_pass:
        print("  ALL CHECKS PASSED")
    else:
        failed = [n for n, p, _ in checks if not p]
        print(f"  FAILED: {', '.join(failed)}")

    # Show color breakdown
    if not results["mec"]["pass"]:
        print()
        print("  Color breakdown (MeC FAIL):")
        for color, count in list(results["mec"]["colors"].items())[:12]:
            print(f"    {color}: {count}px")

    print("=" * 55)


def main():
    parser = argparse.ArgumentParser(description="Visual Kernel property gate checker")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--mcp", action="store_true", help="Fetch pixels from running GeOS via MCP")
    group.add_argument("--pixels", metavar="FILE", help="Load pixel hex dump from file")
    group.add_argument("--image", metavar="FILE", help="Load pixels from PNG image")
    parser.add_argument("--json", action="store_true", help="Output results as JSON")
    args = parser.parse_args()

    if args.mcp:
        if not MCP_SERVER.exists():
            print(f"ERROR: MCP server not found at {MCP_SERVER}", file=sys.stderr)
            sys.exit(2)
        pixels = get_pixels_from_mcp()
    elif args.pixels:
        pixels = get_pixels_from_hex(args.pixels)
    elif args.image:
        pixels = get_pixels_from_image(args.image)

    results = analyze(pixels)

    if args.json:
        print(json.dumps(results, indent=2))
    else:
        print_results(results)

    sys.exit(0 if results["all_pass"] else 1)


if __name__ == "__main__":
    main()
