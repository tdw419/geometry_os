; DESCRIPTION: Draws a yellow circle centered at (335, 191) with radius 24.
; PLAN: r0=335(x), r1=191(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 191
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
