; DESCRIPTION: Draws a purple circle centered at (475, 160) with radius 33.
; PLAN: r0=475(x), r1=160(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 160
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
