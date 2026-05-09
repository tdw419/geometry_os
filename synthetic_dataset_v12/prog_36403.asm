; DESCRIPTION: Places a red line segment connecting (15, 212) to (457, 142).
; PLAN: r0=15(x1), r1=212(y1), r2=457(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 212
LDI r2, 457
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
