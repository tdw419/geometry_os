; DESCRIPTION: Creates a green circular shape at (134, 89) with radius 67.
; PLAN: r0=134(x), r1=89(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 89
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
