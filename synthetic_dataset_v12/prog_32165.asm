; DESCRIPTION: Draws a purple circle centered at (229, 125) with radius 24.
; PLAN: r0=229(x), r1=125(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 125
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
