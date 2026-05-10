; DESCRIPTION: Renders a black box of size 64x93 starting at (270, 64).
; PLAN: r0=270(x), r1=64(y), r2=64(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 64
LDI r2, 64
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
