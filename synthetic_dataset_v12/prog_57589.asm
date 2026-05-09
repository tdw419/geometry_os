; DESCRIPTION: Renders a purple disk with center (94, 125) and radius 47.
; PLAN: r0=94(x), r1=125(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 125
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
