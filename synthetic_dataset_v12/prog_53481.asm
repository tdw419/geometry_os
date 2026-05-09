; DESCRIPTION: Draws a yellow circle centered at (389, 110) with radius 73.
; PLAN: r0=389(x), r1=110(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 110
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
