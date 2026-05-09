; DESCRIPTION: Creates a purple circular shape at (253, 108) with radius 10.
; PLAN: r0=253(x), r1=108(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 108
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
