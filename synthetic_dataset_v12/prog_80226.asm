; DESCRIPTION: Places a green line segment connecting (109, 170) to (484, 81).
; PLAN: r0=109(x1), r1=170(y1), r2=484(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 170
LDI r2, 484
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
