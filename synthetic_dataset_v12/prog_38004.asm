; DESCRIPTION: Places a yellow line segment connecting (156, 66) to (311, 80).
; PLAN: r0=156(x1), r1=66(y1), r2=311(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 66
LDI r2, 311
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
