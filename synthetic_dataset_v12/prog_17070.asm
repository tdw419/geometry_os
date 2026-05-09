; DESCRIPTION: Renders a green disk with center (373, 122) and radius 75.
; PLAN: r0=373(x), r1=122(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 122
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
