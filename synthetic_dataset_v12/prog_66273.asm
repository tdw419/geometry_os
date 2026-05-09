; DESCRIPTION: Renders a orange disk with center (137, 138) and radius 18.
; PLAN: r0=137(x), r1=138(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 138
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
