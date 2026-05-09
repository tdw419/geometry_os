; DESCRIPTION: Places a red line segment connecting (166, 34) to (200, 56).
; PLAN: r0=166(x1), r1=34(y1), r2=200(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 34
LDI r2, 200
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
