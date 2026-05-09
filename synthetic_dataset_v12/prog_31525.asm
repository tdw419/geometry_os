; DESCRIPTION: Creates a purple circular shape at (285, 172) with radius 79.
; PLAN: r0=285(x), r1=172(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 172
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
