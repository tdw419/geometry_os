; DESCRIPTION: Renders a blue disk with center (205, 139) and radius 31.
; PLAN: r0=205(x), r1=139(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 139
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
