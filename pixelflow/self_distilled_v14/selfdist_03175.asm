; DESCRIPTION: Renders a green circular shape at (97, 73) with radius 20.
; PLAN: r0=97(x), r1=73(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 73
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
