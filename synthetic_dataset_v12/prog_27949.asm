; DESCRIPTION: Creates a purple circular shape at (145, 86) with radius 79.
; PLAN: r0=145(x), r1=86(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 86
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
