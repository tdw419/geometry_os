; DESCRIPTION: Creates a orange circular shape at (115, 71) with radius 55.
; PLAN: r0=115(x), r1=71(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 71
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
