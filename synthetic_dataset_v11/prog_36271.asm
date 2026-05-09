; DESCRIPTION: Renders a orange disk with center (114, 97) and radius 75.
; PLAN: r0=114(x), r1=97(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 97
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
