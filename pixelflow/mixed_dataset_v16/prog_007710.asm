; DESCRIPTION: Places a white line segment connecting (424, 207) to (201, 112).
; PLAN: r0=424(x1), r1=207(y1), r2=201(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 207
LDI r2, 201
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
