; DESCRIPTION: Creates a purple circular shape at (214, 49) with radius 16.
; PLAN: r0=214(x), r1=49(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 49
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
