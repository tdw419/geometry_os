; DESCRIPTION: Renders a orange disk with center (341, 187) and radius 51.
; PLAN: r0=341(x), r1=187(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 187
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
