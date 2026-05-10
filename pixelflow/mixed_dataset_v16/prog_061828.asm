; DESCRIPTION: Draws a purple circle centered at (181, 161) with radius 61.
; PLAN: r0=181(x), r1=161(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 161
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
