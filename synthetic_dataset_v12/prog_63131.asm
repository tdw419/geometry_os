; DESCRIPTION: Places a white circle of radius 10 at center (18, 72).
; PLAN: r0=18(x), r1=72(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 72
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
