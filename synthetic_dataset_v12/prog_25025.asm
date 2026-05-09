; DESCRIPTION: Creates a purple circular shape at (291, 63) with radius 19.
; PLAN: r0=291(x), r1=63(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 63
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
