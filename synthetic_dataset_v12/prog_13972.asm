; DESCRIPTION: Places a red line segment connecting (290, 119) to (150, 208).
; PLAN: r0=290(x1), r1=119(y1), r2=150(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 119
LDI r2, 150
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
