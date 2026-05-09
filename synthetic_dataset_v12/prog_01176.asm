; DESCRIPTION: Creates a red circular shape at (125, 136) with radius 72.
; PLAN: r0=125(x), r1=136(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 136
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
