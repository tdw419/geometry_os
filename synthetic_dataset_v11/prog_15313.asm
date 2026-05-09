; DESCRIPTION: Renders a yellow disk with center (136, 194) and radius 45.
; PLAN: r0=136(x), r1=194(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 194
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
