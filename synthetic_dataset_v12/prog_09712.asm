; DESCRIPTION: Renders a yellow disk with center (89, 137) and radius 75.
; PLAN: r0=89(x), r1=137(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 137
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
