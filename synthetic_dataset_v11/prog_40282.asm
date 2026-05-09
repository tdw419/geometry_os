; DESCRIPTION: Renders a yellow disk with center (192, 114) and radius 56.
; PLAN: r0=192(x), r1=114(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 114
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
