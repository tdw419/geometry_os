; DESCRIPTION: Renders a yellow disk with center (24, 80) and radius 21.
; PLAN: r0=24(x), r1=80(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 80
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
