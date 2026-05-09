; DESCRIPTION: Renders a purple disk with center (306, 132) and radius 23.
; PLAN: r0=306(x), r1=132(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 132
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
