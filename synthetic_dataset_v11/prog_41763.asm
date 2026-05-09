; DESCRIPTION: Creates a red circular shape at (88, 183) with radius 47.
; PLAN: r0=88(x), r1=183(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 183
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
