; DESCRIPTION: Draws a purple circle centered at (80, 52) with radius 20.
; PLAN: r0=80(x), r1=52(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 52
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
