; DESCRIPTION: Renders a yellow disk with center (140, 104) and radius 76.
; PLAN: r0=140(x), r1=104(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 104
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
