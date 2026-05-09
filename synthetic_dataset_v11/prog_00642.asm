; DESCRIPTION: Draws a black circle centered at (179, 145) with radius 49.
; PLAN: r0=179(x), r1=145(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 145
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
