; DESCRIPTION: Creates a red circular shape at (52, 158) with radius 44.
; PLAN: r0=52(x), r1=158(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 158
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
