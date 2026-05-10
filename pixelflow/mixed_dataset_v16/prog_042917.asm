; DESCRIPTION: Renders a blue disk with center (252, 75) and radius 46.
; PLAN: r0=252(x), r1=75(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 75
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
