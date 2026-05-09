; DESCRIPTION: Places a red line segment connecting (182, 201) to (70, 200).
; PLAN: r0=182(x1), r1=201(y1), r2=70(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 201
LDI r2, 70
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
