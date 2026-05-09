; DESCRIPTION: Places a green line segment connecting (156, 84) to (52, 39).
; PLAN: r0=156(x1), r1=84(y1), r2=52(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 84
LDI r2, 52
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
