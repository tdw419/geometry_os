; DESCRIPTION: Renders a purple disk with center (252, 119) and radius 57.
; PLAN: r0=252(x), r1=119(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 119
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
