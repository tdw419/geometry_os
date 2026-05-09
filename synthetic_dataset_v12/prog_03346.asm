; DESCRIPTION: Draws a purple circle centered at (407, 172) with radius 44.
; PLAN: r0=407(x), r1=172(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 172
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
