; DESCRIPTION: Creates a red circular shape at (158, 78) with radius 29.
; PLAN: r0=158(x), r1=78(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 78
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
