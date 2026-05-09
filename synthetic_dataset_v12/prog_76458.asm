; DESCRIPTION: Renders a yellow disk with center (427, 159) and radius 76.
; PLAN: r0=427(x), r1=159(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 159
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
