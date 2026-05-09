; DESCRIPTION: Renders a blue disk with center (94, 125) and radius 60.
; PLAN: r0=94(x), r1=125(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 125
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
