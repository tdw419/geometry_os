; DESCRIPTION: Renders a yellow disk with center (194, 174) and radius 28.
; PLAN: r0=194(x), r1=174(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 174
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
