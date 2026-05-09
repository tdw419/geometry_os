; DESCRIPTION: Renders a yellow disk with center (332, 123) and radius 70.
; PLAN: r0=332(x), r1=123(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 123
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
