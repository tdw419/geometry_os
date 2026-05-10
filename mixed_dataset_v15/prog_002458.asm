; DESCRIPTION: Renders a orange disk with center (381, 226) and radius 11.
; PLAN: r0=381(x), r1=226(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 226
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
