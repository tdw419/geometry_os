; DESCRIPTION: Places a magenta line segment connecting (489, 246) to (13, 140).
; PLAN: r0=489(x1), r1=246(y1), r2=13(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 246
LDI r2, 13
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
