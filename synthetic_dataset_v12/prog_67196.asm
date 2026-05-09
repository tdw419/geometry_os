; DESCRIPTION: Renders a yellow disk with center (155, 113) and radius 60.
; PLAN: r0=155(x), r1=113(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 113
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
