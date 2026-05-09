; DESCRIPTION: Renders a purple disk with center (359, 170) and radius 60.
; PLAN: r0=359(x), r1=170(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 170
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
