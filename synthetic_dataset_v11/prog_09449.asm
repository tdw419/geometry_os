; DESCRIPTION: Draws a purple circle centered at (207, 73) with radius 35.
; PLAN: r0=207(x), r1=73(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 73
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
