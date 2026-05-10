; DESCRIPTION: Renders a blue disk with center (332, 174) and radius 75.
; PLAN: r0=332(x), r1=174(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 174
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
