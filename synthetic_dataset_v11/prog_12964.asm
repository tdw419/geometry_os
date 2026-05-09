; DESCRIPTION: Renders a green disk with center (203, 198) and radius 15.
; PLAN: r0=203(x), r1=198(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 198
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
