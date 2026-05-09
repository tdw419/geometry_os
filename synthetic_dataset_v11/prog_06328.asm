; DESCRIPTION: Creates a red circular shape at (104, 142) with radius 66.
; PLAN: r0=104(x), r1=142(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 142
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
