; DESCRIPTION: Creates a red circular shape at (88, 81) with radius 30.
; PLAN: r0=88(x), r1=81(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 81
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
