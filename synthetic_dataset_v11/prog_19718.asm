; DESCRIPTION: Creates a orange circular shape at (134, 177) with radius 14.
; PLAN: r0=134(x), r1=177(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 177
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
