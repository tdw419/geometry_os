; DESCRIPTION: Creates a red circular shape at (102, 109) with radius 38.
; PLAN: r0=102(x), r1=109(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 109
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
