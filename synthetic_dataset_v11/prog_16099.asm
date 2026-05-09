; DESCRIPTION: Places a blue circle of radius 13 at center (222, 205).
; PLAN: r0=222(x), r1=205(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 205
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
