; DESCRIPTION: Places a orange circle of radius 51 at center (59, 105).
; PLAN: r0=59(x), r1=105(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 105
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
