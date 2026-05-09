; DESCRIPTION: Places a red line segment connecting (114, 157) to (158, 15).
; PLAN: r0=114(x1), r1=157(y1), r2=158(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 157
LDI r2, 158
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
