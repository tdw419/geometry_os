; DESCRIPTION: Renders a yellow disk with center (112, 162) and radius 37.
; PLAN: r0=112(x), r1=162(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 162
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
