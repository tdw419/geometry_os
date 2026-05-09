; DESCRIPTION: Creates a red circular shape at (274, 122) with radius 45.
; PLAN: r0=274(x), r1=122(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 122
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
