; DESCRIPTION: Places a orange circle of radius 61 at center (293, 112).
; PLAN: r0=293(x), r1=112(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 112
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
