; DESCRIPTION: Places a blue line segment connecting (201, 174) to (504, 64).
; PLAN: r0=201(x1), r1=174(y1), r2=504(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 174
LDI r2, 504
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
