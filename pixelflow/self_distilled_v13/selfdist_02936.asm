; DESCRIPTION: Draws a yellow circle centered at (390, 85) with radius 76.
; PLAN: r0=390(x), r1=85(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 85
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
