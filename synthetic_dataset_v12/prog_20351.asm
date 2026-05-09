; DESCRIPTION: Places a green line segment connecting (390, 10) to (339, 144).
; PLAN: r0=390(x1), r1=10(y1), r2=339(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 10
LDI r2, 339
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
