; DESCRIPTION: Places a red line segment connecting (54, 62) to (79, 205).
; PLAN: r0=54(x1), r1=62(y1), r2=79(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 62
LDI r2, 79
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
