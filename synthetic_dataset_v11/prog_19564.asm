; DESCRIPTION: Renders a yellow disk with center (208, 58) and radius 35.
; PLAN: r0=208(x), r1=58(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 58
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
