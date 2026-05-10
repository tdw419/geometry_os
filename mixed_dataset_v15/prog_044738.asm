; DESCRIPTION: Renders a white disk with center (216, 144) and radius 80.
; PLAN: r0=216(x), r1=144(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 144
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
