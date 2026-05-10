; DESCRIPTION: Places a orange line segment connecting (158, 9) to (144, 157).
; PLAN: r0=158(x1), r1=9(y1), r2=144(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 9
LDI r2, 144
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
