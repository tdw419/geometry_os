; DESCRIPTION: Places a blue line segment connecting (72, 201) to (427, 60).
; PLAN: r0=72(x1), r1=201(y1), r2=427(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 201
LDI r2, 427
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
