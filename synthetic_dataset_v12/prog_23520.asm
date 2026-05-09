; DESCRIPTION: Places a red line segment connecting (290, 54) to (489, 144).
; PLAN: r0=290(x1), r1=54(y1), r2=489(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 54
LDI r2, 489
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
