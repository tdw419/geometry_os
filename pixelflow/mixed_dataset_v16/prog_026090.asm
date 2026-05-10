; DESCRIPTION: Draws a purple circle centered at (426, 141) with radius 79.
; PLAN: r0=426(x), r1=141(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 141
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
