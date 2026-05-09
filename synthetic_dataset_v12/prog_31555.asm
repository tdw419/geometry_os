; DESCRIPTION: Draws a magenta line from (490, 187) to (377, 100).
; PLAN: r0=490(x1), r1=187(y1), r2=377(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 187
LDI r2, 377
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
