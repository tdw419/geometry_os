; DESCRIPTION: Renders a yellow disk with center (81, 89) and radius 80.
; PLAN: r0=81(x), r1=89(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 89
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
