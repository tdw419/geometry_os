; DESCRIPTION: Renders a yellow disk with center (427, 174) and radius 65.
; PLAN: r0=427(x), r1=174(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 174
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
