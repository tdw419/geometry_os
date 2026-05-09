; DESCRIPTION: Renders a yellow disk with center (78, 98) and radius 62.
; PLAN: r0=78(x), r1=98(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 98
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
