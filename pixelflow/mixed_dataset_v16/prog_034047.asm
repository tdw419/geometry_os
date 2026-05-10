; DESCRIPTION: Places a red line segment connecting (44, 254) to (311, 158).
; PLAN: r0=44(x1), r1=254(y1), r2=311(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 254
LDI r2, 311
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
