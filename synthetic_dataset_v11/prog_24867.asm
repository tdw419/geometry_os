; DESCRIPTION: Renders a white disk with center (145, 192) and radius 25.
; PLAN: r0=145(x), r1=192(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 192
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
