; DESCRIPTION: Creates a purple circular shape at (65, 136) with radius 63.
; PLAN: r0=65(x), r1=136(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 136
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
