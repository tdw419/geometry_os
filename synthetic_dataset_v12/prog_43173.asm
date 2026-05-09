; DESCRIPTION: Draws a purple circle centered at (251, 210) with radius 30.
; PLAN: r0=251(x), r1=210(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 210
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
