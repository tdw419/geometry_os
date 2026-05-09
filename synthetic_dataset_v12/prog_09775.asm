; DESCRIPTION: Places a red line segment connecting (462, 183) to (451, 207).
; PLAN: r0=462(x1), r1=183(y1), r2=451(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 183
LDI r2, 451
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
