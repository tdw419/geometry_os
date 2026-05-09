; DESCRIPTION: Creates a red circular shape at (119, 35) with radius 30.
; PLAN: r0=119(x), r1=35(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 35
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
