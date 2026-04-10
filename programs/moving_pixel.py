"""
Geometry OS — Moving Pixel Demo
================================
WASD-controlled white pixel on a black 256x256 screen.

Tests the full pipeline:
  1. Keyboard input via RAM[1023] port
  2. Conditional branching (BRANCH BEQ)
  3. Register arithmetic (ADD/SUB)
  4. Pixel output (PSET)
  5. Frame sync (YIELD)

Register map:
  r1 = X position (starts at 128)
  r2 = Y position (starts at 128)
  r3 = keyboard port address (1023)
  r4 = key value read from port
  r5 = comparison value (ASCII code being tested)
  r6 = increment amount (1)
  r7 = zero (for clearing keyboard port)

Layout (81 pixels, fits in 1023 — port at 1023 untouched):

  Addr 0-17:   INIT — load constants into registers
  Addr 18-53:  LOOP — clear old pixel, read keyboard, branch on WASD
  Addr 54-60:  DRAW — draw white pixel, YIELD, JMP LOOP
  Addr 61-65:  MOVE_UP    — SUB r2, r6; JMP DRAW
  Addr 66-70:  MOVE_DOWN  — ADD r2, r6; JMP DRAW
  Addr 71-75:  MOVE_LEFT  — SUB r1, r6; JMP DRAW
  Addr 76-80:  MOVE_RIGHT — ADD r1, r6; JMP DRAW

Usage:
  1. python3 programs/moving_pixel.py
  2. cargo run
  3. Press F6 to load programs/boot.rts
  4. Press F5 to start execution
  5. Use WASD to move the pixel
"""

import struct

# ═══ Opcodes ═══
OP_ADD    = 0x41  # A — width 3: dst, src
OP_BRANCH = 0x42  # B — width 3: cond_pixel, target_addr
OP_HALT   = 0x48  # H — width 1
OP_LDI    = 0x49  # I — width 3: dst_reg, immediate_value
OP_JMP    = 0x4A  # J — width 2: target_addr
OP_LOAD   = 0x4C  # L — width 3: dst_reg, addr_reg
OP_PSET   = 0x50  # P — width 4: x_reg, y_reg, color_raw
OP_STORE  = 0x53  # S — width 3: addr_reg, src_reg
OP_SUB    = 0x55  # U — width 3: dst, src
OP_YIELD  = 0x59  # Y — width 1

# ═══ Branch condition types ═══
COND_BEQ = 0  # branch if equal

# ═══ Colors ═══
BLACK = 0x00000000
WHITE = 0xFFFFFFFF

# ═══ ASCII key codes ═══
KEY_W = 0x77  # up
KEY_A = 0x61  # left
KEY_S = 0x73  # down
KEY_D = 0x64  # right

# ═══ Keyboard port ═══
KBD_PORT = 1023  # last pixel in 32x32 grid

def branch_cond(cond_type, r_a, r_b):
    """Pack BRANCH condition pixel.

    Byte 0: condition type (0=BEQ, 1=BNE, 2=BLT, 3=BGE)
    Byte 2: register index for left operand
    Byte 3: register index for right operand
    """
    return cond_type | (r_a << 16) | (r_b << 24)

def assemble():
    px = []  # pixel values

    # ── INIT (18 pixels, addr 0-17) ──
    # LDI r1, 128           ; X = center
    px += [OP_LDI, 1, 128]
    # LDI r2, 128           ; Y = center
    px += [OP_LDI, 2, 128]
    # LDI r3, 1023          ; keyboard port address
    px += [OP_LDI, 3, KBD_PORT]
    # LDI r6, 1             ; step size
    px += [OP_LDI, 6, 1]
    # LDI r7, 0             ; zero constant (for clearing port)
    px += [OP_LDI, 7, 0]

    assert len(px) == 15  # 5 × LDI × 3 pixels each

    # Pad to 18 so LOOP starts at a round address
    # (3 NOPs = 3 pixels)
    px += [0x4E, 0x4E, 0x4E]  # NOP, NOP, NOP

    assert len(px) == 18
    ADDR_LOOP = 18

    # ── LOOP: Clear old pixel ──
    # PSET r1, r2, BLACK
    px += [OP_PSET, 1, 2, BLACK]    # 4 pixels (18-21)

    # ── Read keyboard ──
    # LOAD r4, r3          ; r4 = ram[r3] = ram[1023]
    px += [OP_LOAD, 4, 3]           # 3 pixels (22-24)
    # STORE r3, r7         ; ram[r3] = 0 (acknowledge keystroke)
    px += [OP_STORE, 3, 7]          # 3 pixels (25-27)

    # ── Check W (up) ──
    # LDI r5, 0x77
    px += [OP_LDI, 5, KEY_W]        # 3 pixels (28-30)
    # BRANCH BEQ r4,r5, MOVE_UP
    ADDR_MOVE_UP = 61  # calculated below
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), ADDR_MOVE_UP]  # 3 pixels (31-33)

    # ── Check A (left) ──
    px += [OP_LDI, 5, KEY_A]        # 3 pixels (34-36)
    ADDR_MOVE_LEFT = 71
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), ADDR_MOVE_LEFT]  # 3 pixels (37-39)

    # ── Check S (down) ──
    px += [OP_LDI, 5, KEY_S]        # 3 pixels (40-42)
    ADDR_MOVE_DOWN = 66
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), ADDR_MOVE_DOWN]  # 3 pixels (43-45)

    # ── Check D (right) ──
    px += [OP_LDI, 5, KEY_D]        # 3 pixels (46-48)
    ADDR_MOVE_RIGHT = 76
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), ADDR_MOVE_RIGHT]  # 3 pixels (49-51)

    # ── No key matched, fall through to DRAW ──
    # JMP DRAW
    ADDR_DRAW = 54
    px += [OP_JMP, ADDR_DRAW]       # 2 pixels (52-53)

    assert len(px) == 54, f"Expected 54 pixels before DRAW, got {len(px)}"

    # ── DRAW: Draw new pixel, sync frame ──
    # PSET r1, r2, WHITE
    px += [OP_PSET, 1, 2, WHITE]    # 4 pixels (54-57)
    # YIELD — return control to host for one frame
    px += [OP_YIELD]                # 1 pixel  (58)
    # JMP LOOP
    px += [OP_JMP, ADDR_LOOP]       # 2 pixels (59-60)

    assert len(px) == 61, f"Expected 61 pixels before MOVE_UP, got {len(px)}"

    # ── MOVE_UP (addr 61) ──
    assert len(px) == ADDR_MOVE_UP
    # SUB r2, r6           ; Y -= 1
    px += [OP_SUB, 2, 6]            # 3 pixels (61-63)
    # JMP DRAW
    px += [OP_JMP, ADDR_DRAW]       # 2 pixels (64-65)

    # ── MOVE_DOWN (addr 66) ──
    assert len(px) == ADDR_MOVE_DOWN
    # ADD r2, r6           ; Y += 1
    px += [OP_ADD, 2, 6]            # 3 pixels (66-68)
    # JMP DRAW
    px += [OP_JMP, ADDR_DRAW]       # 2 pixels (69-70)

    # ── MOVE_LEFT (addr 71) ──
    assert len(px) == ADDR_MOVE_LEFT
    # SUB r1, r6           ; X -= 1
    px += [OP_SUB, 1, 6]            # 3 pixels (71-73)
    # JMP DRAW
    px += [OP_JMP, ADDR_DRAW]       # 2 pixels (74-75)

    # ── MOVE_RIGHT (addr 76) ──
    assert len(px) == ADDR_MOVE_RIGHT
    # ADD r1, r6           ; X += 1
    px += [OP_ADD, 1, 6]            # 3 pixels (76-78)
    # JMP DRAW
    px += [OP_JMP, ADDR_DRAW]       # 2 pixels (79-80)

    assert len(px) == 81, f"Expected 81 pixels total, got {len(px)}"

    # ── Pad to 1024 (32×32 grid) ──
    while len(px) < 1024:
        px.append(0)

    # ── Write .rts binary (little-endian u32 per pixel) ──
    with open("programs/boot.rts", "wb") as f:
        for p in px:
            f.write(struct.pack("<I", p))

    print(f"Assembled 81 active pixels + {1024-81} padding = 1024 total")
    print(f"Program: {len(px)} pixels → programs/boot.rts")
    print()
    print("Memory map:")
    print(f"  0x000-0x011  INIT     (18 px) — register setup")
    print(f"  0x012-0x035  LOOP     (36 px) — clear, read kbd, branch")
    print(f"  0x036-0x03C  DRAW     (7 px)  — draw white, YIELD, jump")
    print(f"  0x03D-0x041  UP       (5 px)  — Y -= 1")
    print(f"  0x042-0x046  DOWN     (5 px)  — Y += 1")
    print(f"  0x047-0x04B  LEFT     (5 px)  — X -= 1")
    print(f"  0x04C-0x050  RIGHT    (5 px)  — X += 1")
    print(f"  0x04D-0x3FE  ...      (zeros)")
    print(f"  0x3FF        KBD_PORT (keyboard input from host)")
    print()
    print("Controls: WASD to move, F5 to start/stop")

if __name__ == "__main__":
    assemble()
