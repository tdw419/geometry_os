; DESCRIPTION: Places a green circle of radius 35 at center (203, 88).
; PLAN: r0=203(x), r1=88(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 88
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
