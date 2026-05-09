; DESCRIPTION: Draws a purple circle centered at (177, 91) with radius 73.
; PLAN: r0=177(x), r1=91(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 91
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
