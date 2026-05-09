; DESCRIPTION: Places a magenta line segment connecting (10, 145) to (212, 133).
; PLAN: r0=10(x1), r1=145(y1), r2=212(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 145
LDI r2, 212
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
