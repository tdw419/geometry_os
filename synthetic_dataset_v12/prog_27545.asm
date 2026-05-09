; DESCRIPTION: Renders a purple disk with center (97, 99) and radius 50.
; PLAN: r0=97(x), r1=99(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 99
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
