; DESCRIPTION: Renders a yellow disk with center (184, 97) and radius 80.
; PLAN: r0=184(x), r1=97(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 97
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
