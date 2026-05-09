; DESCRIPTION: Places a red line segment connecting (68, 170) to (208, 127).
; PLAN: r0=68(x1), r1=170(y1), r2=208(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 170
LDI r2, 208
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
