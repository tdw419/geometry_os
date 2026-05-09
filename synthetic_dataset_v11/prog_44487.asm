; DESCRIPTION: Creates a purple circular shape at (168, 45) with radius 14.
; PLAN: r0=168(x), r1=45(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 45
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
