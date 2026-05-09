; DESCRIPTION: Renders a yellow disk with center (186, 105) and radius 58.
; PLAN: r0=186(x), r1=105(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 105
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
