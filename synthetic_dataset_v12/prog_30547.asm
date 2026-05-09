; DESCRIPTION: Draws a purple circle centered at (448, 44) with radius 31.
; PLAN: r0=448(x), r1=44(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 44
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
