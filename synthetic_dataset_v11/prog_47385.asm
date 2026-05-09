; DESCRIPTION: Creates a purple circular shape at (96, 191) with radius 50.
; PLAN: r0=96(x), r1=191(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 191
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
