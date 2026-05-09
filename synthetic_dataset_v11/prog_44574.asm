; DESCRIPTION: Places a white line segment connecting (91, 31) to (201, 206).
; PLAN: r0=91(x1), r1=31(y1), r2=201(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 31
LDI r2, 201
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
