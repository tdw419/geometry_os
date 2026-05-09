; DESCRIPTION: Renders a blue disk with center (130, 159) and radius 23.
; PLAN: r0=130(x), r1=159(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 159
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
