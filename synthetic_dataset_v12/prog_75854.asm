; DESCRIPTION: Draws a purple circle centered at (211, 220) with radius 14.
; PLAN: r0=211(x), r1=220(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 220
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
