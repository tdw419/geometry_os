; DESCRIPTION: Renders a yellow disk with center (471, 24) and radius 18.
; PLAN: r0=471(x), r1=24(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 24
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
