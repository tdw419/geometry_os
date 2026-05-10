; DESCRIPTION: Creates a purple circular shape at (490, 171) with radius 10.
; PLAN: r0=490(x), r1=171(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 490
LDI r1, 171
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
