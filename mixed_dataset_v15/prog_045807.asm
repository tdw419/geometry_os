; DESCRIPTION: Places a magenta line segment connecting (236, 201) to (80, 46).
; PLAN: r0=236(x1), r1=201(y1), r2=80(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 201
LDI r2, 80
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
