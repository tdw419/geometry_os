; DESCRIPTION: Renders a orange disk with center (136, 104) and radius 35.
; PLAN: r0=136(x), r1=104(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 104
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
