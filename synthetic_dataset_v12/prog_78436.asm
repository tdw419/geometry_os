; DESCRIPTION: Draws a purple circle centered at (194, 103) with radius 68.
; PLAN: r0=194(x), r1=103(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 103
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
