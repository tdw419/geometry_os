; DESCRIPTION: Creates a purple circular shape at (33, 214) with radius 32.
; PLAN: r0=33(x), r1=214(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 214
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
