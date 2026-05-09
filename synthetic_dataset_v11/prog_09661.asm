; DESCRIPTION: Renders a blue disk with center (83, 114) and radius 58.
; PLAN: r0=83(x), r1=114(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 114
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
