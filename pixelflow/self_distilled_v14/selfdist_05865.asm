; DESCRIPTION: Places a white disk with center (316, 155) and radius 72.
; PLAN: r0=316(x), r1=155(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 155
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
