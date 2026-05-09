; DESCRIPTION: Creates a red circular shape at (109, 167) with radius 61.
; PLAN: r0=109(x), r1=167(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 167
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
