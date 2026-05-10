; DESCRIPTION: Places a yellow disk with center (208, 136) and radius 78.
; PLAN: r0=208(x), r1=136(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 136
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
