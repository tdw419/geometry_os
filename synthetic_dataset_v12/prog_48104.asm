; DESCRIPTION: Draws a purple circle centered at (308, 183) with radius 28.
; PLAN: r0=308(x), r1=183(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 183
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
