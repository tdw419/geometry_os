; DESCRIPTION: Renders a yellow disk with center (138, 201) and radius 20.
; PLAN: r0=138(x), r1=201(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 201
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
