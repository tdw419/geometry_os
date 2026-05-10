; DESCRIPTION: Renders a blue circular shape at (205, 6) with radius 31.
; PLAN: r0=205(x), r1=6(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 6
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
