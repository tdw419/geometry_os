; DESCRIPTION: Creates a red circular shape at (137, 88) with radius 61.
; PLAN: r0=137(x), r1=88(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 88
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
