; DESCRIPTION: Renders a yellow disk with center (204, 94) and radius 64.
; PLAN: r0=204(x), r1=94(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 94
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
