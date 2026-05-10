; DESCRIPTION: Renders a yellow disk with center (219, 192) and radius 23.
; PLAN: r0=219(x), r1=192(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 192
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
