; DESCRIPTION: Renders a green disk with center (318, 60) and radius 25.
; PLAN: r0=318(x), r1=60(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 60
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
