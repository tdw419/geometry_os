; DESCRIPTION: Draws a purple circle centered at (76, 112) with radius 65.
; PLAN: r0=76(x), r1=112(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 112
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
