; DESCRIPTION: Renders a purple disk with center (68, 137) and radius 17.
; PLAN: r0=68(x), r1=137(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 137
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
