; DESCRIPTION: Renders a purple disk with center (427, 149) and radius 55.
; PLAN: r0=427(x), r1=149(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 149
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
