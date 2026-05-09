; DESCRIPTION: Renders a orange disk with center (270, 57) and radius 35.
; PLAN: r0=270(x), r1=57(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 57
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
