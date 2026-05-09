; DESCRIPTION: Places a orange circle of radius 51 at center (226, 196).
; PLAN: r0=226(x), r1=196(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 196
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
