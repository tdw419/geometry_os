; DESCRIPTION: Places a green circle of radius 26 at center (390, 182).
; PLAN: r0=390(x), r1=182(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 182
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
