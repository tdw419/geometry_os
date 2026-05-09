; DESCRIPTION: Creates a red circular shape at (76, 217) with radius 28.
; PLAN: r0=76(x), r1=217(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 217
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
