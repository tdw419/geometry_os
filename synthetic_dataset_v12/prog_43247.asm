; DESCRIPTION: Creates a orange circular shape at (57, 191) with radius 36.
; PLAN: r0=57(x), r1=191(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 191
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
