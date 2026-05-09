; DESCRIPTION: Creates a orange circular shape at (137, 71) with radius 48.
; PLAN: r0=137(x), r1=71(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 71
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
