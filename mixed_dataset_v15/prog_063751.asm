; DESCRIPTION: Creates a red circular shape at (341, 175) with radius 74.
; PLAN: r0=341(x), r1=175(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 175
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
