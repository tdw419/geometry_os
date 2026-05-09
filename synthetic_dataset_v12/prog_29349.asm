; DESCRIPTION: Creates a blue circular shape at (145, 191) with radius 47.
; PLAN: r0=145(x), r1=191(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 191
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
