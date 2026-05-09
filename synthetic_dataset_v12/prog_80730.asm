; DESCRIPTION: Renders a yellow disk with center (189, 113) and radius 64.
; PLAN: r0=189(x), r1=113(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 113
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
