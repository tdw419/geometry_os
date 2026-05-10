; DESCRIPTION: Creates a red circular shape at (261, 66) with radius 62.
; PLAN: r0=261(x), r1=66(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 66
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
