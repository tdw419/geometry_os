; DESCRIPTION: Renders a yellow disk with center (80, 97) and radius 43.
; PLAN: r0=80(x), r1=97(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 97
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
