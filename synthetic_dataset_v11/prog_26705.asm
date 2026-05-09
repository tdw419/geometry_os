; DESCRIPTION: Creates a orange circular shape at (177, 138) with radius 43.
; PLAN: r0=177(x), r1=138(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 138
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
