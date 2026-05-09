; DESCRIPTION: Draws a purple circle centered at (91, 15) with radius 10.
; PLAN: r0=91(x), r1=15(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 15
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
