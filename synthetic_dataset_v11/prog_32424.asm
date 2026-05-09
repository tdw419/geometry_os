; DESCRIPTION: Creates a red circular shape at (194, 170) with radius 53.
; PLAN: r0=194(x), r1=170(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 170
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
