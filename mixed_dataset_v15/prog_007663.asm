; DESCRIPTION: Creates a red circular shape at (316, 142) with radius 71.
; PLAN: r0=316(x), r1=142(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 142
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
