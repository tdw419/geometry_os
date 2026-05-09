; DESCRIPTION: Draws a black circle centered at (120, 191) with radius 19.
; PLAN: r0=120(x), r1=191(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 191
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
