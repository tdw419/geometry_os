; DESCRIPTION: Places a red line segment connecting (206, 77) to (201, 22).
; PLAN: r0=206(x1), r1=77(y1), r2=201(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 77
LDI r2, 201
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
