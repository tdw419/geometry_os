; DESCRIPTION: Places a red line segment connecting (9, 177) to (153, 158).
; PLAN: r0=9(x1), r1=177(y1), r2=153(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 177
LDI r2, 153
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
