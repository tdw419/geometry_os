; DESCRIPTION: Renders a blue disk with center (455, 71) and radius 55.
; PLAN: r0=455(x), r1=71(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 71
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
