; DESCRIPTION: Renders a black disk with center (451, 124) and radius 25.
; PLAN: r0=451(x), r1=124(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 124
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
