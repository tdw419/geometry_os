; DESCRIPTION: Creates a purple circular shape at (269, 165) with radius 73.
; PLAN: r0=269(x), r1=165(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 165
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
