; DESCRIPTION: Renders a black box of size 64x61 starting at (188, 105).
; PLAN: r0=188(x), r1=105(y), r2=64(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 105
LDI r2, 64
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
