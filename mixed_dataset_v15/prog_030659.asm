; DESCRIPTION: Renders a green circular shape at (266, 22) with radius 24.
; PLAN: r0=266(x), r1=22(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 22
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
