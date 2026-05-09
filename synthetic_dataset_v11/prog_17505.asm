; DESCRIPTION: Draws a purple circle centered at (125, 95) with radius 44.
; PLAN: r0=125(x), r1=95(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 95
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
