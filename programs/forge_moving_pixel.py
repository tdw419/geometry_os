"""
Geometry OS — Moving Pixel with Forge Boundary Telemetry
=========================================================
WASD-controlled white pixel. Fires ISSUE_CREATE when hitting screen edges.

Forge contract:
  ISSUE_CREATE reads: r0=tag, r1=payload, r2=priority_bits
  tag=1 means "boundary hit", payload encodes which edge + coordinate.

Register map:
  r0  = scratch (tag for ISSUE_CREATE, also color via RECTF convention)
  r1  = X position (starts at 128)
  r2  = Y position (starts at 128)
  r3  = keyboard port address (1023)
  r4  = key value read from port
  r5  = comparison value
  r6  = step size (1)
  r7  = zero (for clearing keyboard port)
  r8  = boundary check constant (0)
  r9  = boundary check constant (255)

Memory map (calculated below):
  000-023: INIT (load constants)
  024-091: LOOP (clear, read kbd, branch WASD)
  092-098: DRAW (white pixel, YIELD, JMP LOOP)
  099-129: MOVE_UP + boundary check + ISSUE_CREATE
  130-160: MOVE_DOWN + boundary check + ISSUE_CREATE
  161-191: MOVE_LEFT + boundary check + ISSUE_CREATE
  192-222: MOVE_RIGHT + boundary check + ISSUE_CREATE
  1023:   KBD_PORT

To run:
  python3 programs/forge_moving_pixel.py && cargo run --release
  F6 to load, F5 to run, WASD to move.
  Watch terminal for [FORGE ISSUE] output on boundary hits.
"""

import struct

# ═══ Opcodes ═══
OP_ADD    = 0x41  # A  width 3
OP_BRANCH = 0x42  # B  width 3
OP_HALT   = 0x48  # H  width 1
OP_LDI    = 0x49  # I  width 3
OP_JMP    = 0x4A  # J  width 2
OP_LOAD   = 0x4C  # L  width 3
OP_PSET   = 0x50  # P  width 4
OP_STORE  = 0x53  # S  width 3
OP_SUB    = 0x55  # U  width 3
OP_YIELD  = 0x59  # Y  width 1
OP_ISSUE  = 0x63  # c  width 1

# Branch conditions
BEQ = 0  # equal
BLT = 2  # signed less than

KBD_PORT = 1023
KEY_W = 0x77
KEY_A = 0x61
KEY_S = 0x73
KEY_D = 0x64

BLACK = 0x00000000
WHITE = 0xFFFFFFFF

def bc(cond, ra, rb):
    """Pack BRANCH condition pixel."""
    return cond | (ra << 16) | (rb << 24)


def assemble():
    px = []

    # ═══════════════════════════════════════════════════════════
    # INIT — 24 pixels (8 × LDI)
    # ═══════════════════════════════════════════════════════════
    px += [OP_LDI, 1, 128]       # r1 = X = 128
    px += [OP_LDI, 2, 128]       # r2 = Y = 128
    px += [OP_LDI, 3, KBD_PORT]  # r3 = keyboard port addr
    px += [OP_LDI, 6, 1]         # r6 = step
    px += [OP_LDI, 7, 0]         # r7 = zero
    px += [OP_LDI, 8, 0]         # r8 = lower bound (0)
    px += [OP_LDI, 9, 255]       # r9 = upper bound (255)
    px += [OP_LDI, 0, 1]         # r0 = 1 (boundary tag for ISSUE_CREATE)
    assert len(px) == 24

    ADDR_LOOP = 24

    # ═══════════════════════════════════════════════════════════
    # LOOP — clear old, read keyboard, branch on WASD
    # 4 + 3 + 3 + 3+3 + 3+3 + 3+3 + 3+3 + 2 = 34 pixels
    # ═══════════════════════════════════════════════════════════
    # Clear old pixel (black)
    px += [OP_PSET, 1, 2, BLACK]     # 4 px (24-27)

    # Read keyboard
    px += [OP_LOAD, 4, 3]            # 3 px (28-30)
    px += [OP_STORE, 3, 7]           # 3 px (31-33)

    # Branch W (up)
    px += [OP_LDI, 5, KEY_W]         # 3 px (34-36)
    px += [OP_BRANCH, bc(BEQ, 4, 5), 99]   # 3 px (37-39)

    # Branch A (left)
    px += [OP_LDI, 5, KEY_A]         # 3 px (40-42)
    px += [OP_BRANCH, bc(BEQ, 4, 5), 161]  # 3 px (43-45)

    # Branch S (down)
    px += [OP_LDI, 5, KEY_S]         # 3 px (46-48)
    px += [OP_BRANCH, bc(BEQ, 4, 5), 130]  # 3 px (49-51)

    # Branch D (right)
    px += [OP_LDI, 5, KEY_D]         # 3 px (52-54)
    px += [OP_BRANCH, bc(BEQ, 4, 5), 192]  # 3 px (55-57)

    # Fall through — no key matched
    px += [OP_JMP, 92]               # 2 px (58-59) → BOUNDS_SAFE

    assert len(px) == 60, f"LOOP end: expected 60, got {len(px)}"

    # Pad to 92 (where BOUNDS_SAFE starts)
    # Need 32 NOPs
    for _ in range(32):
        px.append(0x4E)
    assert len(px) == 92

    # ═══════════════════════════════════════════════════════════
    # BOUNDS_SAFE (addr 92) — shared "no boundary hit" path
    # ═══════════════════════════════════════════════════════════
    ADDR_BOUNDS_SAFE = 92
    assert len(px) == ADDR_BOUNDS_SAFE

    # DRAW: white pixel, YIELD, JMP LOOP
    px += [OP_PSET, 1, 2, WHITE]     # 4 px (92-95)
    px += [OP_YIELD]                  # 1 px  (96)
    px += [OP_JMP, ADDR_LOOP]         # 2 px  (97-98)
    assert len(px) == 99

    # ═══════════════════════════════════════════════════════════
    # MOVE_UP (addr 99) — Y -= 1, check Y < 0
    # ═══════════════════════════════════════════════════════════
    ADDR_MOVE_UP = 99
    assert len(px) == ADDR_MOVE_UP

    # SUB r2, r6  ; Y -= 1
    px += [OP_SUB, 2, 6]              # 3 px (99-101)
    # BRANCH BLT r2, r8 → ISSUE  (Y < 0?)
    px += [OP_BRANCH, bc(BLT, 2, 8), 108]  # 3 px (102-104)
    # No boundary — jump to BOUNDS_SAFE
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px (105-106)
    # Padding to align ISSUE_CREATE at 108
    px.append(0x4E)                    # 1 px NOP (107)
    # ISSUE_CREATE (r0=1 tag, r1=X coord, r2=Y coord as priority bits)
    px += [OP_LDI, 0, 1]             # 3 px (108-110) tag = boundary hit
    px += [OP_ISSUE]                   # 1 px  (111)
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px  (112-113)

    # Wait — that's 15 pixels (99-113), but we need 31 total for this block
    # Actually let me recalculate. We have:
    # 99-101: SUB (3)
    # 102-104: BRANCH (3)
    # 105-106: JMP BOUNDS_SAFE (2)
    # 107: NOP (1)
    # 108-110: LDI r0, 1 (3)
    # 111: ISSUE_CREATE (1)
    # 112-113: JMP BOUNDS_SAFE (2)
    # Total: 15 px, next addr = 114

    # But we allocated MOVE_DOWN at 130. Need 16 NOPs to pad.
    for _ in range(130 - 114):
        px.append(0x4E)
    assert len(px) == 130

    # ═══════════════════════════════════════════════════════════
    # MOVE_DOWN (addr 130) — Y += 1, check Y > 255
    # ═══════════════════════════════════════════════════════════
    ADDR_MOVE_DOWN = 130
    assert len(px) == ADDR_MOVE_DOWN

    px += [OP_ADD, 2, 6]              # 3 px (130-132)
    px += [OP_BRANCH, bc(BEQ, 2, 9), 139]  # 3 px (133-135) Y == 255?
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px (136-137)
    px.append(0x4E)                    # 1 px NOP (138)
    px += [OP_LDI, 0, 1]             # 3 px (139-141)
    px += [OP_ISSUE]                   # 1 px (142)
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px (143-144)

    for _ in range(161 - 145):
        px.append(0x4E)
    assert len(px) == 161

    # ═══════════════════════════════════════════════════════════
    # MOVE_LEFT (addr 161) — X -= 1, check X < 0
    # ═══════════════════════════════════════════════════════════
    ADDR_MOVE_LEFT = 161
    assert len(px) == ADDR_MOVE_LEFT

    px += [OP_SUB, 1, 6]              # 3 px (161-163)
    px += [OP_BRANCH, bc(BLT, 1, 8), 170]  # 3 px (164-166)
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px (167-168)
    px.append(0x4E)                    # 1 px NOP (169)
    px += [OP_LDI, 0, 1]             # 3 px (170-172)
    px += [OP_ISSUE]                   # 1 px (173)
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px (174-175)

    for _ in range(192 - 176):
        px.append(0x4E)
    assert len(px) == 192

    # ═══════════════════════════════════════════════════════════
    # MOVE_RIGHT (addr 192) — X += 1, check X > 255
    # ═══════════════════════════════════════════════════════════
    ADDR_MOVE_RIGHT = 192
    assert len(px) == ADDR_MOVE_RIGHT

    px += [OP_ADD, 1, 6]              # 3 px (192-194)
    px += [OP_BRANCH, bc(BEQ, 1, 9), 201]  # 3 px (195-197)
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px (198-199)
    px.append(0x4E)                    # 1 px NOP (200)
    px += [OP_LDI, 0, 1]             # 3 px (201-203)
    px += [OP_ISSUE]                   # 1 px (204)
    px += [OP_JMP, ADDR_BOUNDS_SAFE]  # 2 px (205-206)

    print(f"Active pixels: {len(px)}")
    assert len(px) <= KBD_PORT, f"Program too large! {len(px)} > {KBD_PORT}"

    # Pad to 1024
    while len(px) < 1024:
        px.append(0)

    with open("programs/boot.rts", "wb") as f:
        for p in px:
            f.write(struct.pack("<I", p))

    print(f"Written 1024 pixels → programs/boot.rts")
    print()
    print("Layout:")
    print(f"  000-023  INIT      (24 px) — register setup + boundary constants")
    print(f"  024-059  LOOP      (36 px) — clear, read kbd, WASD branches")
    print(f"  060-091  NOP pad   (32 px)")
    print(f"  092-098  DRAW      (7 px)  — white pixel + YIELD + JMP LOOP")
    print(f"  099-113  MOVE_UP   (15 px) — Y-=1, BLT r2,r8 → ISSUE_CREATE")
    print(f"  114-129  NOP pad")
    print(f"  130-144  MOVE_DOWN (15 px) — Y+=1, BEQ r2,r9 → ISSUE_CREATE")
    print(f"  145-160  NOP pad")
    print(f"  161-175  MOVE_LEFT (15 px) — X-=1, BLT r1,r8 → ISSUE_CREATE")
    print(f"  176-191  NOP pad")
    print(f"  192-206  MOVE_RIGHT(15 px) — X+=1, BEQ r1,r9 → ISSUE_CREATE")
    print(f"  1023     KBD_PORT")
    print()
    print("Forge events fire when pixel hits edge (X or Y = 0 or 255)")
    print("Terminal output: [FORGE ISSUE #N (PC:addr) Tag: 0x00000001 ...]")
    return px


if __name__ == "__main__":
    assemble()
