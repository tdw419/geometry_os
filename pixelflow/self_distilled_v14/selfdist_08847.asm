; DESCRIPTION: Renders a magenta line segment connecting (102, 1) to (339, 97).
; PLAN: r0=102(x1), r1=1(y1), r2=339(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 1
LDI r2, 339
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
