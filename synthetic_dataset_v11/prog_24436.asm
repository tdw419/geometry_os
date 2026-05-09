; DESCRIPTION: Renders a yellow disk with center (211, 85) and radius 44.
; PLAN: r0=211(x), r1=85(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 85
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
