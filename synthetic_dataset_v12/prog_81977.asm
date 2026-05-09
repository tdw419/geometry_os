; DESCRIPTION: Places a orange circle of radius 23 at center (51, 114).
; PLAN: r0=51(x), r1=114(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 114
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
