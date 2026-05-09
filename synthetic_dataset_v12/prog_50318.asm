; DESCRIPTION: Draws a purple circle centered at (177, 105) with radius 63.
; PLAN: r0=177(x), r1=105(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 105
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
