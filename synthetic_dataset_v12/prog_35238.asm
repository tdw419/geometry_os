; DESCRIPTION: Creates a orange circular shape at (134, 32) with radius 18.
; PLAN: r0=134(x), r1=32(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 32
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
