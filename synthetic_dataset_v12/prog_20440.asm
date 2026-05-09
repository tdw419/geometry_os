; DESCRIPTION: Renders a blue disk with center (94, 37) and radius 36.
; PLAN: r0=94(x), r1=37(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 37
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
