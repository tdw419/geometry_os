; DESCRIPTION: Places a magenta line segment connecting (373, 123) to (149, 79).
; PLAN: r0=373(x1), r1=123(y1), r2=149(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 123
LDI r2, 149
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
