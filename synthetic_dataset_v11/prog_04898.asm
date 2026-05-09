; DESCRIPTION: Places a orange circle of radius 51 at center (203, 124).
; PLAN: r0=203(x), r1=124(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 124
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
