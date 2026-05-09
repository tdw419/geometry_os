; DESCRIPTION: Places a white circle of radius 51 at center (414, 203).
; PLAN: r0=414(x), r1=203(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 203
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
