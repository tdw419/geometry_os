; DESCRIPTION: Draws a purple circle centered at (193, 217) with radius 32.
; PLAN: r0=193(x), r1=217(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 217
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
