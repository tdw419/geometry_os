; DESCRIPTION: Draws a purple circle centered at (375, 95) with radius 37.
; PLAN: r0=375(x), r1=95(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 95
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
