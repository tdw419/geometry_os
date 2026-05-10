; DESCRIPTION: Draws a purple circle centered at (184, 145) with radius 35.
; PLAN: r0=184(x), r1=145(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 145
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
