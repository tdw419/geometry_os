; DESCRIPTION: Places a magenta line segment connecting (79, 170) to (19, 101).
; PLAN: r0=79(x1), r1=170(y1), r2=19(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 170
LDI r2, 19
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
