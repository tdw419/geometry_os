; DESCRIPTION: Renders a green circular shape at (204, 113) with radius 36.
; PLAN: r0=204(x), r1=113(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 113
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
