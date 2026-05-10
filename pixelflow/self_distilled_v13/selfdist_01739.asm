; DESCRIPTION: Places a blue disk with center (188, 43) and radius 13.
; PLAN: r0=188(x), r1=43(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 43
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
