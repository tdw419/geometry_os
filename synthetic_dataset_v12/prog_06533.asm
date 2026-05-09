; DESCRIPTION: Draws a black circle centered at (287, 158) with radius 75.
; PLAN: r0=287(x), r1=158(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 158
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
