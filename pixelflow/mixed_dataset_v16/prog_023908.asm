; DESCRIPTION: Renders a yellow disk with center (172, 30) and radius 26.
; PLAN: r0=172(x), r1=30(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 30
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
