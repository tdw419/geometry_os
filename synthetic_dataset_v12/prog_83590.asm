; DESCRIPTION: Creates a red circular shape at (341, 106) with radius 70.
; PLAN: r0=341(x), r1=106(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 106
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
