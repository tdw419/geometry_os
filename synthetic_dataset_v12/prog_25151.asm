; DESCRIPTION: Draws a purple circle centered at (82, 123) with radius 74.
; PLAN: r0=82(x), r1=123(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 123
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
