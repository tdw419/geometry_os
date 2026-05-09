; DESCRIPTION: Places a red line segment connecting (140, 56) to (158, 207).
; PLAN: r0=140(x1), r1=56(y1), r2=158(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 56
LDI r2, 158
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
