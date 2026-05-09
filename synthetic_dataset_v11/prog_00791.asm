; DESCRIPTION: Creates a red circular shape at (134, 135) with radius 45.
; PLAN: r0=134(x), r1=135(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 135
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
