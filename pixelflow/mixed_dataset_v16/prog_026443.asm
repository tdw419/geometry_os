; DESCRIPTION: Creates a orange circular shape at (332, 92) with radius 29.
; PLAN: r0=332(x), r1=92(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 92
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
