; DESCRIPTION: Creates a red circular shape at (34, 203) with radius 28.
; PLAN: r0=34(x), r1=203(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 203
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
