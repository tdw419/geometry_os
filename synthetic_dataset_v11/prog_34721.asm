; DESCRIPTION: Places a white circle of radius 15 at center (170, 72).
; PLAN: r0=170(x), r1=72(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 72
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
