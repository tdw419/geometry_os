; DESCRIPTION: Places a blue line segment connecting (379, 56) to (201, 169).
; PLAN: r0=379(x1), r1=56(y1), r2=201(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 56
LDI r2, 201
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
