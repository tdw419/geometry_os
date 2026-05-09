; DESCRIPTION: Creates a purple circular shape at (232, 191) with radius 42.
; PLAN: r0=232(x), r1=191(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 191
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
