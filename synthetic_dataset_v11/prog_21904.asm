; DESCRIPTION: Places a yellow line segment connecting (110, 156) to (60, 209).
; PLAN: r0=110(x1), r1=156(y1), r2=60(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 156
LDI r2, 60
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
