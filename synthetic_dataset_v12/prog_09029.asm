; DESCRIPTION: Renders a yellow disk with center (253, 100) and radius 40.
; PLAN: r0=253(x), r1=100(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 100
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
