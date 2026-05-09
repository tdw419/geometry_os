; DESCRIPTION: Creates a red circular shape at (58, 167) with radius 37.
; PLAN: r0=58(x), r1=167(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 167
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
