; DESCRIPTION: Places a magenta line segment connecting (140, 110) to (99, 152).
; PLAN: r0=140(x1), r1=110(y1), r2=99(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 110
LDI r2, 99
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
