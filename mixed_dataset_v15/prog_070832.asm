; DESCRIPTION: Renders a blue circular shape at (144, 119) with radius 13.
; PLAN: r0=144(x), r1=119(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 119
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
