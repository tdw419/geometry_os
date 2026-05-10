; DESCRIPTION: Draws a black circle centered at (311, 88) with radius 74.
; PLAN: r0=311(x), r1=88(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 88
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
