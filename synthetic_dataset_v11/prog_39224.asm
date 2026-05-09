; DESCRIPTION: Creates a red circular shape at (88, 212) with radius 34.
; PLAN: r0=88(x), r1=212(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 212
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
