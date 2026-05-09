; DESCRIPTION: Renders a cyan box of size 32x36 starting at (361, 23).
; PLAN: r0=361(x), r1=23(y), r2=32(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 23
LDI r2, 32
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
