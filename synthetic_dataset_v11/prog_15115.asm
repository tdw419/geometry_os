; DESCRIPTION: Places a magenta line segment connecting (74, 170) to (201, 126).
; PLAN: r0=74(x1), r1=170(y1), r2=201(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 170
LDI r2, 201
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
