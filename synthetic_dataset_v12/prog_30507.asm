; DESCRIPTION: Places a red line segment connecting (37, 185) to (53, 251).
; PLAN: r0=37(x1), r1=185(y1), r2=53(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 185
LDI r2, 53
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
