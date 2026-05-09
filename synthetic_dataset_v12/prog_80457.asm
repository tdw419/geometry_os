; DESCRIPTION: Places a magenta line segment connecting (112, 170) to (467, 99).
; PLAN: r0=112(x1), r1=170(y1), r2=467(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 170
LDI r2, 467
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
