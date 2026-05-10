; DESCRIPTION: Places a green line segment connecting (390, 40) to (156, 63).
; PLAN: r0=390(x1), r1=40(y1), r2=156(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 40
LDI r2, 156
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
