; DESCRIPTION: Draws a black circle centered at (158, 64) with radius 54.
; PLAN: r0=158(x), r1=64(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 64
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
