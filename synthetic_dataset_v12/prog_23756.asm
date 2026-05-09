; DESCRIPTION: Renders a white disk with center (269, 37) and radius 31.
; PLAN: r0=269(x), r1=37(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 37
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
