; DESCRIPTION: Draws a orange circle centered at (158, 191) with radius 31.
; PLAN: r0=158(x), r1=191(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 191
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
