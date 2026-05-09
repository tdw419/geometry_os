; DESCRIPTION: Renders a purple disk with center (120, 66) and radius 49.
; PLAN: r0=120(x), r1=66(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 66
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
