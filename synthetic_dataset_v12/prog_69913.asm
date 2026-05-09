; DESCRIPTION: Places a blue line segment connecting (308, 64) to (162, 201).
; PLAN: r0=308(x1), r1=64(y1), r2=162(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 64
LDI r2, 162
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
