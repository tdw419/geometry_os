; DESCRIPTION: Renders a yellow disk with center (431, 71) and radius 12.
; PLAN: r0=431(x), r1=71(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 71
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
