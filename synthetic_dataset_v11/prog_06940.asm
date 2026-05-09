; DESCRIPTION: Renders a orange disk with center (105, 86) and radius 44.
; PLAN: r0=105(x), r1=86(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 86
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
