; DESCRIPTION: Places a orange circle of radius 27 at center (170, 51).
; PLAN: r0=170(x), r1=51(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 51
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
