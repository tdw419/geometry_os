; DESCRIPTION: Creates a orange circular shape at (40, 53) with radius 18.
; PLAN: r0=40(x), r1=53(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 53
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
