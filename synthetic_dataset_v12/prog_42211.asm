; DESCRIPTION: Places a red line segment connecting (238, 156) to (153, 105).
; PLAN: r0=238(x1), r1=156(y1), r2=153(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 156
LDI r2, 153
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
