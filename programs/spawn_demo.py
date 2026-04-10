"""
Geometry OS — Spawn Demo
========================
WASD-controlled white pixel. Press SPACE to drop a child VM that blinks green.

Tests the child VM pipeline:
  1. Parent reads keyboard, moves with WASD
  2. Space key packs (y << 16 | x) and calls SPAWN
  3. Host bridge (main.rs) collects child, creates Vm, runs, composites
  4. Child extracts x,y from r0, blinks a green pixel forever

Register map (parent):
  r1  = X position (starts 128)
  r2  = Y position (starts 128)
  r3  = 1023 (keyboard port address)
  r4  = key value read from port
  r5  = comparison key (ASCII)
  r6  = 1 (step size)
  r7  = 0 (zero / clear port)
  r8  = CHILD_ADDR (200)
  r9  = 16 (shift amount for packing y)
  r10 = 0xFFFF (mask, unused by parent directly but available)
  r11 = packed arg (y << 16 | x)

Register map (child):
  r0  = arg = (y << 16 | x) — set by spawn_child()
  r1  = extracted X
  r2  = extracted Y
  r3  = blink toggle (0 or 1)
  r4  = 0xFFFF (AND mask)
  r5  = 16 (SHR amount)
  r6  = 0 (zero)
  r7  = 1 (XOR toggle)
  r8  = color ON  (green = 0x0000FF00)
  r9  = color OFF (black = 0x00000000)

Memory map:
  0x000-0x04E   PARENT (79 pixels active)
  0x04F-0x0C6   PARENT SPAWN SECTION (rest of parent)
  0x0C7-0x0C7   NOP padding
  0x0C8-0x0FF   Zero padding (to reach addr 200)
  0x0C8         CHILD_ADDR = 200 = child program start
  0x3FF         KBD_PORT (1023)

Usage:
  1. python3 programs/spawn_demo.py
  2. cargo run
  3. Press F6 to load programs/boot.rts
  4. Press F5 to start execution
  5. WASD to move, SPACE to drop a blinking child
"""

import struct

# ═══ Opcodes ═══
OP_ADD    = 0x41  # A — width 3: dst, src
OP_AND    = 0x61  # a — width 3: dst, src (lowercase)
OP_BRANCH = 0x42  # B — width 3: cond_pixel, target_addr
OP_HALT   = 0x48  # H — width 1
OP_LDI    = 0x49  # I — width 3: dst_reg, immediate_value
OP_JMP    = 0x4A  # J — width 2: target_addr
OP_SHL    = 0x4B  # K — width 3: dst, amount_reg
OP_LOAD   = 0x4C  # L — width 3: dst_reg, addr_reg
OP_MOV    = 0x4D  # M — width 3: dst, src
OP_OR     = 0x4F  # O — width 3: dst, src
OP_PSET   = 0x50  # P — width 4: x_reg, y_reg, color_reg
OP_SPAWN  = 0x51  # Q — width 3: addr_reg, arg_reg
OP_STORE  = 0x53  # S — width 3: addr_reg, src_reg
OP_SUB    = 0x55  # U — width 3: dst, src
OP_XOR    = 0x58  # X — width 3: dst, src
OP_YIELD  = 0x59  # Y — width 1
OP_SHR    = 0x6B  # k — width 3: dst, amount_reg (lowercase)

# ═══ Branch condition types ═══
COND_BEQ = 0  # branch if equal

# ═══ Colors ═══
BLACK     = 0x00000000
WHITE     = 0xFFFFFFFF
GREEN     = 0x0000FF00
COLOR_OFF = 0x00000000

# ═══ ASCII key codes ═══
KEY_W     = 0x77  # up
KEY_A     = 0x61  # left
KEY_S     = 0x73  # down
KEY_D     = 0x64  # right
KEY_SPACE = 0x20  # spawn child

# ═══ Layout ═══
KBD_PORT    = 1023
CHILD_ADDR  = 200  # child program starts here

def branch_cond(cond_type, r_a, r_b):
    """Pack BRANCH condition pixel."""
    return cond_type | (r_a << 16) | (r_b << 24)

def assemble():
    px = []

    # ═══════════════════════════════════════════════════════════════
    # PARENT PROGRAM
    # ═══════════════════════════════════════════════════════════════

    # ── INIT (24 pixels, addr 0-23) ──
    px += [OP_LDI, 1, 128]          # LDI r1, 128          — X = center
    px += [OP_LDI, 2, 128]          # LDI r2, 128          — Y = center
    px += [OP_LDI, 3, KBD_PORT]     # LDI r3, 1023         — kbd port
    px += [OP_LDI, 6, 1]            # LDI r6, 1            — step
    px += [OP_LDI, 7, 0]            # LDI r7, 0            — zero
    px += [OP_LDI, 8, CHILD_ADDR]   # LDI r8, 200          — child addr
    px += [OP_LDI, 9, 16]           # LDI r9, 16           — shift amount
    px += [OP_LDI, 10, 0xFFFF]      # LDI r10, 0xFFFF      — mask
    assert len(px) == 24
    ADDR_LOOP = 24

    # ── LOOP: Clear old pixel ──
    # PSET r1, r2, r7  (r7=0=black → gasm mode: color from regs[r7]=0)
    px += [OP_PSET, 1, 2, 7]                # 4 px (24-27)

    # Read keyboard
    px += [OP_LOAD, 4, 3]                   # 3 px (28-30): r4 = ram[1023]
    px += [OP_STORE, 3, 7]                  # 3 px (31-33): ram[1023] = 0

    # ── Check W (up) ──
    px += [OP_LDI, 5, KEY_W]                # 3 px (34-36)
    ADDR_MOVE_UP = None  # will fix up
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), 0]  # 3 px (37-39), placeholder

    # ── Check A (left) ──
    px += [OP_LDI, 5, KEY_A]                # 3 px (40-42)
    ADDR_MOVE_LEFT = None
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), 0]  # 3 px (43-45)

    # ── Check S (down) ──
    px += [OP_LDI, 5, KEY_S]                # 3 px (46-48)
    ADDR_MOVE_DOWN = None
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), 0]  # 3 px (49-51)

    # ── Check D (right) ──
    px += [OP_LDI, 5, KEY_D]                # 3 px (52-54)
    ADDR_MOVE_RIGHT = None
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), 0]  # 3 px (55-57)

    # ── Check Space (spawn) ──
    px += [OP_LDI, 5, KEY_SPACE]            # 3 px (58-60)
    ADDR_SPAWN = None
    px += [OP_BRANCH, branch_cond(COND_BEQ, 4, 5), 0]  # 3 px (61-63)

    # ── No key matched → DRAW ──
    px += [OP_JMP, 0]  # 2 px (64-65), placeholder for DRAW

    assert len(px) == 66, f"Expected 66, got {len(px)}"

    # ── DRAW (addr 66) ──
    ADDR_DRAW = 66
    # PSET r1, r2, WHITE → need white in a register.
    # We don't have a dedicated white register. Load it into r5 temporarily.
    px += [OP_LDI, 5, WHITE]                # 3 px (66-68): r5 = 0xFFFFFFFF
    px += [OP_PSET, 1, 2, 5]                # 4 px (69-72): draw white pixel
    px += [OP_YIELD]                         # 1 px  (73)
    px += [OP_JMP, ADDR_LOOP]               # 2 px  (74-75)
    assert len(px) == 76, f"Expected 76 after DRAW, got {len(px)}"

    # ── MOVE_UP (addr 76) ──
    ADDR_MOVE_UP = 76
    px += [OP_SUB, 2, 6]                    # 3 px: Y -= 1
    px += [OP_JMP, ADDR_DRAW]               # 2 px

    # ── MOVE_DOWN (addr 81) ──
    ADDR_MOVE_DOWN = 81
    px += [OP_ADD, 2, 6]                    # 3 px: Y += 1
    px += [OP_JMP, ADDR_DRAW]               # 2 px

    # ── MOVE_LEFT (addr 86) ──
    ADDR_MOVE_LEFT = 86
    px += [OP_SUB, 1, 6]                    # 3 px: X -= 1
    px += [OP_JMP, ADDR_DRAW]               # 2 px

    # ── MOVE_RIGHT (addr 91) ──
    ADDR_MOVE_RIGHT = 91
    px += [OP_ADD, 1, 6]                    # 3 px: X += 1
    px += [OP_JMP, ADDR_DRAW]               # 2 px

    # ── SPAWN_SECTION (addr 96) ──
    ADDR_SPAWN = 96
    # Pack arg = (y << 16) | x into r11
    px += [OP_MOV, 11, 2]                   # 3 px: r11 = Y
    px += [OP_SHL, 11, 9]                   # 3 px: r11 <<= 16
    px += [OP_OR, 11, 1]                    # 3 px: r11 |= X
    px += [OP_SPAWN, 8, 11]                 # 3 px: child at r8(200), arg=r11
    px += [OP_JMP, ADDR_DRAW]               # 2 px: go draw

    assert len(px) == 110, f"Expected 110 after SPAWN, got {len(px)}"

    # ── Fix up branch targets ──
    # W branch target at px[38] (3rd pixel of 3-pixel BRANCH at offset 37-39)
    px[38] = ADDR_MOVE_UP
    # A branch target at px[44]
    px[44] = ADDR_MOVE_LEFT
    # S branch target at px[50]
    px[50] = ADDR_MOVE_DOWN
    # D branch target at px[56]
    px[56] = ADDR_MOVE_RIGHT
    # Space branch target at px[62]
    px[62] = ADDR_SPAWN
    # JMP DRAW at px[65]
    px[65] = ADDR_DRAW

    # ── Pad to CHILD_ADDR (200) ──
    while len(px) < CHILD_ADDR:
        px.append(0)

    assert len(px) == CHILD_ADDR, f"Padding error: {len(px)} != {CHILD_ADDR}"

    # ═══════════════════════════════════════════════════════════════
    # CHILD PROGRAM (starts at addr 200)
    # ═══════════════════════════════════════════════════════════════
    #
    # r0 = arg = (parent_y << 16) | parent_x
    # After init: r1 = X, r2 = Y
    # Blink loop: toggle r3, draw green or black

    CHILD_START = len(px)
    assert CHILD_START == CHILD_ADDR

    # ── Child INIT ──
    px += [OP_LDI, 4, 0xFFFF]       # r4 = mask (AND)
    px += [OP_LDI, 5, 16]           # r5 = shift (SHR)
    px += [OP_LDI, 6, 0]            # r6 = zero
    px += [OP_LDI, 7, 1]            # r7 = toggle amount
    px += [OP_LDI, 8, GREEN]        # r8 = color ON
    px += [OP_LDI, 9, COLOR_OFF]    # r9 = color OFF (black)
    px += [OP_LDI, 3, 0]            # r3 = blink state (start off)
    # 7 × LDI × 3 = 21 pixels
    assert len(px) == CHILD_ADDR + 21

    # Extract X: r1 = r0 & 0xFFFF
    px += [OP_MOV, 1, 0]            # r1 = arg
    px += [OP_AND, 1, 4]            # r1 &= 0xFFFF → X
    # 6 pixels

    # Extract Y: r2 = r0 >> 16
    px += [OP_MOV, 2, 0]            # r2 = arg
    px += [OP_SHR, 2, 5]            # r2 >>= 16 → Y
    # 6 pixels

    assert len(px) == CHILD_ADDR + 33

    # ── Child BLINK_LOOP ──
    CHILD_BLINK = len(px)
    # Toggle blink state
    px += [OP_XOR, 3, 7]            # r3 ^= 1 (toggle)

    # If r3 == 0 → draw black; else draw green
    # BRANCH BEQ r3, r6 → DRAW_BLACK
    CHILD_DRAW_BLACK = None  # fixup later
    px += [OP_BRANCH, branch_cond(COND_BEQ, 3, 6), 0]  # placeholder

    # DRAW_GREEN: PSET r1, r2, r8
    px += [OP_PSET, 1, 2, 8]        # green pixel
    px += [OP_YIELD]                 # frame sync
    px += [OP_JMP, CHILD_BLINK]     # loop
    # 1 + 3 + 4 + 1 + 2 = 11 pixels from BLINK start

    # DRAW_BLACK: PSET r1, r2, r9
    CHILD_DRAW_BLACK = len(px)
    px += [OP_PSET, 1, 2, 9]        # black pixel (erase)
    px += [OP_YIELD]                 # frame sync
    px += [OP_JMP, CHILD_BLINK]     # loop
    # 4 + 1 + 2 = 7 pixels

    # Fix up the BEQ target
    # The BRANCH is at CHILD_BLINK + 3 pixels (after XOR=3, BRANCH header=1)
    # The target pixel is at CHILD_BLINK + 4 (3rd pixel of BRANCH)
    px[CHILD_BLINK + 4] = CHILD_DRAW_BLACK

    # ── Pad to 1024 (32×32 grid) ──
    while len(px) < 1024:
        px.append(0)

    assert len(px) == 1024, f"Expected 1024, got {len(px)}"

    # ── Write .rts binary ──
    with open("programs/boot.rts", "wb") as f:
        for p in px:
            f.write(struct.pack("<I", p))

    active = CHILD_DRAW_BLACK + 7 - CHILD_ADDR + (CHILD_ADDR - 110) + 110
    print(f"Parent: 110 active pixels (addr 0-109)")
    print(f"Child: {CHILD_DRAW_BLACK + 7 - CHILD_ADDR} active pixels (addr {CHILD_ADDR}-{CHILD_DRAW_BLACK + 6})")
    print(f"Total: 1024 pixels → programs/boot.rts")
    print()
    print("Memory map:")
    print(f"  0x000-0x017  INIT          (24 px) — register setup")
    print(f"  0x018-0x041  LOOP          (42 px) — clear, kbd, branch WASD+Space")
    print(f"  0x042-0x04D  DRAW          (12 px) — draw white, YIELD, jump")
    print(f"  0x04C-0x050  MOVE_UP       (5 px)  — Y -= 1")
    print(f"  0x051-0x055  MOVE_DOWN     (5 px)  — Y += 1")
    print(f"  0x056-0x05A  MOVE_LEFT     (5 px)  — X -= 1")
    print(f"  0x05B-0x05F  MOVE_RIGHT    (5 px)  — X += 1")
    print(f"  0x060-0x06D  SPAWN_SECTION (14 px) — pack arg, Q r8 r11")
    print(f"  0x06E-0x0C7  padding       (zeros)")
    print(f"  0x0C8-0x0FF  CHILD INIT    (33 px) — extract x,y, set constants")
    print(f"  0x100-...    CHILD BLINK   (21 px) — toggle+draw loop")
    print(f"  0x3FF        KBD_PORT      (keyboard input)")
    print()
    print("Controls: WASD to move, SPACE to spawn a blinking child")

if __name__ == "__main__":
    assemble()
