; DESCRIPTION: Draws a black circle centered at (422, 191) with radius 39.
; PLAN: r0=422(x), r1=191(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 191
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
