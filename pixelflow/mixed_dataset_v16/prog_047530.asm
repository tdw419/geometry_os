; DESCRIPTION: Creates a red circular shape at (47, 76) with radius 47.
; PLAN: r0=47(x), r1=76(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 76
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
