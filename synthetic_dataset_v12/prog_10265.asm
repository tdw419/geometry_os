; DESCRIPTION: Renders a orange disk with center (265, 125) and radius 18.
; PLAN: r0=265(x), r1=125(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 125
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
