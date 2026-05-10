; DESCRIPTION: Places a blue circle of radius 76 at center (144, 90).
; PLAN: r0=144(x), r1=90(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 90
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
