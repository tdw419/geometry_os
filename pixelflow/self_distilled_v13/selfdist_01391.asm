; DESCRIPTION: Draws a purple circle centered at (181, 57) with radius 24.
; PLAN: r0=181(x), r1=57(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 57
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
