; DESCRIPTION: Creates a green circular shape at (134, 72) with radius 71.
; PLAN: r0=134(x), r1=72(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 72
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
