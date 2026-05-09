; DESCRIPTION: Renders a yellow disk with center (188, 97) and radius 76.
; PLAN: r0=188(x), r1=97(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 97
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
