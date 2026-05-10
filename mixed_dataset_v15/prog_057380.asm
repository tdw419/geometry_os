; DESCRIPTION: Renders a green circular shape at (200, 30) with radius 47.
; PLAN: r0=200(x), r1=30(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 30
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
