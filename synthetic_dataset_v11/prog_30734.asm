; DESCRIPTION: Places a green circle of radius 40 at center (99, 122).
; PLAN: r0=99(x), r1=122(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 122
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
