; DESCRIPTION: Draws a purple circle centered at (370, 125) with radius 64.
; PLAN: r0=370(x), r1=125(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 125
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
