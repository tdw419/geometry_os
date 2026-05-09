; DESCRIPTION: Draws a purple circle centered at (125, 97) with radius 58.
; PLAN: r0=125(x), r1=97(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 97
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
