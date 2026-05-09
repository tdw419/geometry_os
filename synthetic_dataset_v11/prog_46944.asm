; DESCRIPTION: Creates a orange circular shape at (88, 86) with radius 72.
; PLAN: r0=88(x), r1=86(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 86
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
