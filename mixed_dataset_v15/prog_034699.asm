; DESCRIPTION: Places a red line segment connecting (353, 87) to (34, 81).
; PLAN: r0=353(x1), r1=87(y1), r2=34(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 87
LDI r2, 34
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
