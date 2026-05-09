; DESCRIPTION: Creates a orange circular shape at (114, 158) with radius 55.
; PLAN: r0=114(x), r1=158(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 158
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
