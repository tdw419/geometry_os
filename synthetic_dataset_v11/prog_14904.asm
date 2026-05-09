; DESCRIPTION: Draws a blue circle centered at (61, 110) with radius 36.
; PLAN: r0=61(x), r1=110(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 110
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
