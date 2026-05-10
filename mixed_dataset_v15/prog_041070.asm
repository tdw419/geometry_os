; DESCRIPTION: Places a magenta line segment connecting (390, 124) to (312, 13).
; PLAN: r0=390(x1), r1=124(y1), r2=312(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 124
LDI r2, 312
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
