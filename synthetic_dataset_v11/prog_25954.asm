; DESCRIPTION: Places a yellow line segment connecting (26, 156) to (60, 205).
; PLAN: r0=26(x1), r1=156(y1), r2=60(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 156
LDI r2, 60
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
