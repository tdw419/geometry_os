; DESCRIPTION: Renders a black box of size 32x73 starting at (221, 102).
; PLAN: r0=221(x), r1=102(y), r2=32(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 102
LDI r2, 32
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
