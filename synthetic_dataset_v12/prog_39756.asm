; DESCRIPTION: Creates a purple circular shape at (364, 162) with radius 60.
; PLAN: r0=364(x), r1=162(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 162
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
