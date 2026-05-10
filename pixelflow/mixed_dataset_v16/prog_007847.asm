; DESCRIPTION: Draws a purple circle centered at (250, 33) with radius 19.
; PLAN: r0=250(x), r1=33(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 33
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
