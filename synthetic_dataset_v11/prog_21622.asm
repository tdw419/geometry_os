; DESCRIPTION: Draws a purple circle centered at (43, 93) with radius 35.
; PLAN: r0=43(x), r1=93(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 93
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
