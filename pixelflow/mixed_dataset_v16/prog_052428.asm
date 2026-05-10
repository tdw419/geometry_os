; DESCRIPTION: Draws a purple circle centered at (233, 55) with radius 19.
; PLAN: r0=233(x), r1=55(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 55
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
