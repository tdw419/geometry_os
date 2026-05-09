; DESCRIPTION: Renders a yellow disk with center (326, 113) and radius 26.
; PLAN: r0=326(x), r1=113(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 113
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
