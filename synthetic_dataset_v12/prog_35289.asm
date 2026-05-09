; DESCRIPTION: Renders a purple disk with center (364, 155) and radius 31.
; PLAN: r0=364(x), r1=155(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 155
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
