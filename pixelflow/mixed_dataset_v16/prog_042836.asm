; DESCRIPTION: Renders a blue disk with center (449, 110) and radius 46.
; PLAN: r0=449(x), r1=110(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 110
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
