; DESCRIPTION: Renders a purple disk with center (458, 170) and radius 37.
; PLAN: r0=458(x), r1=170(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 170
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
