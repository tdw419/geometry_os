; DESCRIPTION: Renders a blue disk with center (144, 99) and radius 68.
; PLAN: r0=144(x), r1=99(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 99
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
