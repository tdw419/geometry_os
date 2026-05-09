; DESCRIPTION: Creates a blue circular shape at (418, 191) with radius 38.
; PLAN: r0=418(x), r1=191(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 191
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
