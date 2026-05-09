; DESCRIPTION: Renders a yellow disk with center (409, 64) and radius 12.
; PLAN: r0=409(x), r1=64(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 64
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
