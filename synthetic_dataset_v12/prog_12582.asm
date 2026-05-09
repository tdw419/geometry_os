; DESCRIPTION: Creates a purple circular shape at (144, 193) with radius 49.
; PLAN: r0=144(x), r1=193(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 193
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
