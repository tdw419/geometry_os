; DESCRIPTION: Places a orange circle of radius 51 at center (125, 99).
; PLAN: r0=125(x), r1=99(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 99
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
