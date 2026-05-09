; DESCRIPTION: Creates a red circular shape at (312, 212) with radius 26.
; PLAN: r0=312(x), r1=212(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 212
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
