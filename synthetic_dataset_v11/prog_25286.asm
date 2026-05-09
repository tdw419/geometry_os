; DESCRIPTION: Creates a orange circular shape at (189, 73) with radius 49.
; PLAN: r0=189(x), r1=73(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 73
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
