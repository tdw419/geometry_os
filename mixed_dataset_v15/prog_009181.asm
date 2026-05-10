; DESCRIPTION: Renders a orange disk with center (241, 40) and radius 11.
; PLAN: r0=241(x), r1=40(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 40
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
