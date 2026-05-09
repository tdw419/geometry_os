; DESCRIPTION: Places a white circle of radius 30 at center (170, 78).
; PLAN: r0=170(x), r1=78(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 78
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
