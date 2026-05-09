; DESCRIPTION: Places a blue line segment connecting (44, 66) to (379, 13).
; PLAN: r0=44(x1), r1=66(y1), r2=379(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 66
LDI r2, 379
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
