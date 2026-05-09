; DESCRIPTION: Places a white line segment connecting (158, 201) to (443, 100).
; PLAN: r0=158(x1), r1=201(y1), r2=443(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 201
LDI r2, 443
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
