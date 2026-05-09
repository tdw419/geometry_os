; DESCRIPTION: Places a magenta line segment connecting (489, 100) to (49, 150).
; PLAN: r0=489(x1), r1=100(y1), r2=49(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 100
LDI r2, 49
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
