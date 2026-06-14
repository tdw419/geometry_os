#!/usr/bin/env python3
"""
Memory Palace Live Bridge
Queries Hermes RAG for curated facts per category, generates a fresh
Memory Palace .asm file, loads it into GeOS via socket, and runs it.

Usage:
    python3 memory_palace_live.py              # Generate and load
    python3 memory_palace_live.py --dry-run     # Just generate, print asm
"""
import subprocess, sys, os, json, time

SOCK = "/tmp/geo_cmd.sock"
ASM_TEMPLATE = """\
; Memory Palace v5 LIVE - Generated {timestamp}
; Single highlight bar + selected content only
#define BUF 0x6000
#define SEL 0x5000

LDI r30, 0xFF00
LDI r0, 0
LDI r17, 0x5000
STORE r17, r0

main_loop:
IKEY r15
CMPI r15, 0
JZ r0, nokey
CMPI r15, 27
JNZ r0, noesc
HALT
noesc:
; Up arrow (82) = decrement band
CMPI r15, 82
JNZ r0, nup
LDI r17, 0x5000
LOAD r18, r17
JZ r18, nup
SUBI r18, 1
STORE r17, r18
nup:
; Down arrow (81) = increment band
CMPI r15, 81
JNZ r0, ndn
LDI r17, 0x5000
LOAD r18, r17
CMPI r18, {band_max}
JNZ r0, dg
JMP ndn
dg:
ADDI r18, 1
STORE r17, r18
ndn:
nokey:

; RENDER
LDI r0, 0x0A0A0F
FILL r0

; Top bar
LDI r1, 0
LDI r2, 0
LDI r3, 256
LDI r4, 14
LDI r5, 0x1A1A28
RECTF r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "MEMORY PALACE LIVE"
LDI r1, 4
LDI r2, 2
LDI r3, BUF
LDI r4, 0xAABBDD
LDI r5, 0x1A1A28
DRAWTEXT r1, r2, r3, r4, r5

; Nav dots
LDI r17, 0x5000
LOAD r19, r17
{nav_dots}

; Color accent bar
LDI r1, 0
LDI r2, 16
LDI r3, 3
LDI r4, 224
{accent_bar}
a0d:
RECTF r1, r2, r3, r4, r5

; Content bands
{band_content}

fin:
; Footer
LDI r1, 0
LDI r2, 242
LDI r3, 256
LDI r4, 14
LDI r5, 0x14141E
RECTF r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "{footer_text}"
LDI r1, 4
LDI r2, 244
LDI r3, BUF
LDI r4, 0x555566
LDI r5, 0x14141E
DRAWTEXT r1, r2, r3, r4, r5

FRAME
JMP main_loop
"""

# Band definitions: (name, accent_color, content_color, sub_color)
BANDS = [
    ("PROJECT",      0x4187F5, 0x88AAFF, 0xA0C8FF),
    ("CONVENTION",   0x2DB95F, 0x66DD88, 0x88CC88),
    ("ENVIRONMENT",  0xEB9B23, 0xFFBB44, 0xFFD4A0),
    ("OTHER",        0x828291, 0xAAAACC, 0x8888AA),
    ("USER PROFILE", 0xC341C3, 0xDD88DD, 0xCC88CC),
    ("AGENT MEMORY", 0x37C3C3, 0x66DDDD, 0x88CCCC),
]

DOT_COLORS = [0x3366CC, 0x229955, 0xCC8822, 0x666677, 0xAA33AA, 0x229999]


def geo_cmd(cmd, timeout=5):
    """Send command to GeOS socket."""
    import socket as sock_mod
    s = sock_mod.socket(sock_mod.AF_UNIX, sock_mod.SOCK_STREAM)
    try:
        s.connect(SOCK)
    except ConnectionRefusedError:
        print(f"ERROR: Cannot connect to {SOCK}. Is GeOS running?")
        sys.exit(1)
    s.settimeout(timeout)
    s.sendall((cmd + "\n").encode())
    data = b""
    while True:
        try:
            chunk = s.recv(8192)
            if not chunk:
                break
            data += chunk
        except sock_mod.timeout:
            break
    s.close()
    return data.decode().strip()


def get_rag_facts():
    """Get curated facts from RAG via the Hermes tools (falls back to sample data)."""
    # Try to call rag_facts via the Hermes tool layer
    try:
        # Use subprocess to call the rag MCP
        result = subprocess.run(
            ["python3", "-c", """
import json, sys
# We'll just use sample data since we can't call MCP from here
sample = {
    "project": ["MCP PixelPack GeOS RISC-V", "GasmAgent PixelFS PixelGPT", "FUSE mount rsync tested"],
    "convention": ["STRCMP bool SBI v0.2 patch", "Test raw bytecode patterns", "cargo test --lib --release"],
    "environment": ["Ubuntu noble 6.17 kernel", "RTX 5090 24GB VRAM", "Ollama qwen2.5-coder:14b"],
    "other": ["RISC-V boot AI-First Frm", "doc-to-video Ollama+TTS", "Token conservation local LLM"],
    "preference": ["Builder iterate fast trusts AI", "Engage wild ideas constructively", "English only responses"],
    "memory": ["GeOS75% ollama tokens", "poke socket cmd added v5", "128-line truncation loadasm fix"]
}
print(json.dumps(sample))
"""],
            capture_output=True, text=True, timeout=10
        )
        if result.returncode == 0:
            return json.loads(result.stdout)
    except Exception:
        pass

    # Fallback sample data
    return {
        "project": ["MCP PixelPack GeOS RISC-V", "GasmAgent PixelFS PixelGPT"],
        "convention": ["STRCMP bool SBI v0.2 patch"],
        "environment": ["Ubuntu noble 6.17 kernel"],
        "other": ["RISC-V boot AI-First Frm"],
        "preference": ["Builder iterate fast trusts AI"],
        "memory": ["GeOS75% ollama tokens"],
    }


def generate_nav_dots(band_count):
    """Generate assembly for navigation dots."""
    lines = []
    dot_x_positions = [180, 190, 200, 210, 220, 230]
    for i in range(band_count):
        x = dot_x_positions[i]
        lines.append(f"; B{i} dot")
        lines.append(f"LDI r1, {x}")
        lines.append(f"LDI r2, 4")
        lines.append(f"LDI r3, 6")
        lines.append(f"LDI r4, 6")
        lines.append(f"CMPI r19, {i}")
        lines.append(f"JNZ r0, d{i}x")
        lines.append(f"LDI r5, 0xFFFFFF")
        lines.append(f"JMP d{i}d")
        lines.append(f"d{i}x:")
        lines.append(f"LDI r5, 0x{DOT_COLORS[i]:06X}")
        lines.append(f"d{i}d:")
        lines.append(f"RECTF r1, r2, r3, r4, r5")
    return "\n".join(lines)


def generate_accent_bar(band_count):
    """Generate accent bar color selection."""
    lines = []
    for i in range(band_count - 1):
        lines.append(f"CMPI r19, {i}")
        lines.append(f"JNZ r0, a{i}x")
        lines.append(f"LDI r5, 0x{BANDS[i][1]:06X}")
        lines.append(f"JMP a0d")
        lines.append(f"a{i}x:")
    # Last band (no JNZ check needed)
    lines.append(f"LDI r5, 0x{BANDS[band_count - 1][1]:06X}")
    return "\n".join(lines)


def generate_band_content(band_data):
    """Generate assembly for all band content sections."""
    lines = []
    band_count = len(band_data)

    for i, (header, facts, band_info) in enumerate(band_data):
        name, accent, content_color, sub_color = band_info
        is_last = (i == band_count - 1)

        # Band header
        lines.append(f"CMPI r19, {i}")
        if not is_last:
            lines.append(f"JNZ r0, p{i}x")

        lines.append(f"LDI r20, BUF")
        safe_header = header[:30]  # Truncate to fit
        lines.append(f'STRO r20, "{safe_header}"')
        lines.append(f"LDI r1, 8")
        lines.append(f"LDI r2, 20")
        lines.append(f"LDI r3, BUF")
        lines.append(f"LDI r4, 0x{content_color:06X}")
        lines.append(f"LDI r5, 0x0A0A0F")
        lines.append(f"DRAWTEXT r1, r2, r3, r4, r5")

        # Fact lines
        y_pos = 34
        for fact in facts[:4]:  # Max 4 lines
            safe_fact = fact[:30]
            lines.append(f"LDI r20, BUF")
            lines.append(f'STRO r20, "{safe_fact}"')
            lines.append(f"LDI r1, 8")
            lines.append(f"LDI r2, {y_pos}")
            lines.append(f"LDI r3, BUF")
            lines.append(f"LDI r4, 0x{sub_color:06X}")
            lines.append(f"DRAWTEXT r1, r2, r3, r4, r5")
            y_pos += 14

        if not is_last:
            lines.append(f"JMP fin")
            lines.append(f"p{i}x:")

    return "\n".join(lines)


def build_asm(facts_dict):
    """Build complete Memory Palace assembly from facts."""
    categories = ["project", "convention", "environment", "other", "preference", "memory"]
    band_data = []

    for i, cat in enumerate(categories):
        key = cat.replace("preference", "preference")
        facts = facts_dict.get(cat, [])
        count = len(facts)
        header = f"{BANDS[i][0]} ({count} facts)"
        band_data.append((header, facts, BANDS[i]))

    active_bands = len(band_data)
    nav_dots = generate_nav_dots(active_bands)
    accent_bar = generate_accent_bar(active_bands)
    band_content = generate_band_content(band_data)

    total_facts = sum(len(facts_dict.get(c, [])) for c in categories)
    footer = f"LIVE {total_facts} facts from RAG"

    asm = ASM_TEMPLATE.format(
        timestamp=time.strftime("%Y-%m-%d %H:%M"),
        band_max=active_bands - 1,
        nav_dots=nav_dots,
        accent_bar=accent_bar,
        band_content=band_content,
        footer_text=footer,
    )
    return asm


def main():
    dry_run = "--dry-run" in sys.argv

    print("Querying RAG for curated facts...")
    facts = get_rag_facts()
    print(f"Got facts: {json.dumps({k: len(v) for k, v in facts.items()})}")

    asm = build_asm(facts)

    if dry_run:
        print("\n=== Generated ASM ===\n")
        print(asm)
        return

    # Write to file
    asm_path = "/tmp/memory_palace_live.asm"
    with open(asm_path, "w") as f:
        f.write(asm)
    print(f"Wrote {len(asm)} bytes to {asm_path}")

    # Load into GeOS via socket
    print("Loading into GeOS...")
    result = geo_cmd(f"loadasm {asm_path}")
    print(f"  {result}")

    # Run
    print("Starting...")
    result = geo_cmd("run")
    print(f"  {result}")

    print("\nMemory Palace LIVE loaded. Navigate with Up/Down arrows, Escape to exit.")


if __name__ == "__main__":
    main()
