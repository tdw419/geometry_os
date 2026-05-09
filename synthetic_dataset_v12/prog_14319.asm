; DESCRIPTION: Draws a purple circle centered at (112, 91) with radius 37.
; PLAN: r0=112(x), r1=91(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 91
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
