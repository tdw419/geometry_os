; DESCRIPTION: Places a magenta line segment connecting (229, 137) to (163, 244).
; PLAN: r0=229(x1), r1=137(y1), r2=163(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 137
LDI r2, 163
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
