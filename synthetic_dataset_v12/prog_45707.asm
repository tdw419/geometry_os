; DESCRIPTION: Places a red line segment connecting (158, 245) to (114, 252).
; PLAN: r0=158(x1), r1=245(y1), r2=114(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 245
LDI r2, 114
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
