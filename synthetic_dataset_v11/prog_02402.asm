; DESCRIPTION: Renders a yellow disk with center (129, 36) and radius 13.
; PLAN: r0=129(x), r1=36(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 36
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
