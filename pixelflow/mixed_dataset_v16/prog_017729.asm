; DESCRIPTION: Renders a yellow disk with center (389, 85) and radius 17.
; PLAN: r0=389(x), r1=85(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 85
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
