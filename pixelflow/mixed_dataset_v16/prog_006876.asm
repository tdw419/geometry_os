; DESCRIPTION: Draws a black circle centered at (261, 118) with radius 38.
; PLAN: r0=261(x), r1=118(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 118
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
