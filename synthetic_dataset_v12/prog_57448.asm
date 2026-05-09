; DESCRIPTION: Draws a purple circle centered at (52, 50) with radius 14.
; PLAN: r0=52(x), r1=50(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 50
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
