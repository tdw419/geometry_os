; DESCRIPTION: Creates a purple circular shape at (148, 172) with radius 64.
; PLAN: r0=148(x), r1=172(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 172
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
