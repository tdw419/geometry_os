; DESCRIPTION: Creates a purple circular shape at (291, 215) with radius 33.
; PLAN: r0=291(x), r1=215(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 215
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
