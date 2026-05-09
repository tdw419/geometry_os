; DESCRIPTION: Creates a orange circular shape at (83, 86) with radius 56.
; PLAN: r0=83(x), r1=86(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 86
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
