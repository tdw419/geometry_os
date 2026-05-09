; DESCRIPTION: Creates a red circular shape at (130, 172) with radius 76.
; PLAN: r0=130(x), r1=172(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 172
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
