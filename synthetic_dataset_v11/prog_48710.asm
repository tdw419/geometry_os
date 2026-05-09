; DESCRIPTION: Creates a orange circular shape at (77, 116) with radius 58.
; PLAN: r0=77(x), r1=116(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 116
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
