; DESCRIPTION: Renders a green disk with center (217, 83) and radius 23.
; PLAN: r0=217(x), r1=83(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 83
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
