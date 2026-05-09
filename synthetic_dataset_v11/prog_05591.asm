; DESCRIPTION: Places a red line segment connecting (223, 60) to (99, 201).
; PLAN: r0=223(x1), r1=60(y1), r2=99(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 60
LDI r2, 99
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
