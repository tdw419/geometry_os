; DESCRIPTION: Places a red line segment connecting (229, 101) to (231, 205).
; PLAN: r0=229(x1), r1=101(y1), r2=231(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 101
LDI r2, 231
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
