; DESCRIPTION: Renders a purple disk with center (157, 125) and radius 54.
; PLAN: r0=157(x), r1=125(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 125
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
