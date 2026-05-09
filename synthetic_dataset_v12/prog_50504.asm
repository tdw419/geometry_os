; DESCRIPTION: Draws a purple circle centered at (275, 140) with radius 35.
; PLAN: r0=275(x), r1=140(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 140
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
