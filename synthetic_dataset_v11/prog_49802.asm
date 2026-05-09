; DESCRIPTION: Renders a black disk with center (86, 110) and radius 54.
; PLAN: r0=86(x), r1=110(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 110
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
