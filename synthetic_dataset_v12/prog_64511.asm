; DESCRIPTION: Renders a blue disk with center (110, 114) and radius 66.
; PLAN: r0=110(x), r1=114(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 114
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
