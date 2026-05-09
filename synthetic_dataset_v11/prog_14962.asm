; DESCRIPTION: Places a white line segment connecting (91, 131) to (94, 201).
; PLAN: r0=91(x1), r1=131(y1), r2=94(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 131
LDI r2, 94
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
