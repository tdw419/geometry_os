; DESCRIPTION: Creates a orange circular shape at (76, 99) with radius 65.
; PLAN: r0=76(x), r1=99(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 99
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
