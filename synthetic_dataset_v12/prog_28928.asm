; DESCRIPTION: Places a red line segment connecting (329, 39) to (323, 106).
; PLAN: r0=329(x1), r1=39(y1), r2=323(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 39
LDI r2, 323
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
