; DESCRIPTION: Renders a green box of size 81x101 starting at (165, 128).
; PLAN: r0=165(x), r1=128(y), r2=81(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 128
LDI r2, 81
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
