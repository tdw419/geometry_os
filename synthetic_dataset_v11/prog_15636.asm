; DESCRIPTION: Creates a orange circular shape at (102, 57) with radius 43.
; PLAN: r0=102(x), r1=57(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 57
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
