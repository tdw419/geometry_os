; DESCRIPTION: Renders a purple disk with center (151, 170) and radius 44.
; PLAN: r0=151(x), r1=170(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 170
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
