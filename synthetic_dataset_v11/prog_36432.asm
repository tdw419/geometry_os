; DESCRIPTION: Places a red line segment connecting (85, 217) to (73, 91).
; PLAN: r0=85(x1), r1=217(y1), r2=73(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 217
LDI r2, 73
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
