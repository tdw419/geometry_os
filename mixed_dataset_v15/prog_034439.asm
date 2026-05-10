; DESCRIPTION: Renders a orange disk with center (338, 118) and radius 51.
; PLAN: r0=338(x), r1=118(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 118
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
