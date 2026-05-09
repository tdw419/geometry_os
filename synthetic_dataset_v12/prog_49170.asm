; DESCRIPTION: Renders a blue disk with center (63, 118) and radius 39.
; PLAN: r0=63(x), r1=118(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 118
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
