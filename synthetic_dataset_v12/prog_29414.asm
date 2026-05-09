; DESCRIPTION: Places a white circle of radius 15 at center (444, 123).
; PLAN: r0=444(x), r1=123(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 123
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
