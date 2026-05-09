; DESCRIPTION: Draws a purple circle centered at (54, 125) with radius 52.
; PLAN: r0=54(x), r1=125(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 125
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
