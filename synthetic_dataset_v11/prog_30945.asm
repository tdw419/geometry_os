; DESCRIPTION: Draws a magenta line from (170, 119) to (100, 78).
; PLAN: r0=170(x1), r1=119(y1), r2=100(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 119
LDI r2, 100
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
