; DESCRIPTION: Renders a blue circular shape at (77, 68) with radius 34.
; PLAN: r0=77(x), r1=68(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 68
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
