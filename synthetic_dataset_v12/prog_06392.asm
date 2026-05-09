; DESCRIPTION: Renders a white disk with center (269, 216) and radius 38.
; PLAN: r0=269(x), r1=216(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 216
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
