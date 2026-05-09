; DESCRIPTION: Places a magenta line segment connecting (160, 158) to (11, 118).
; PLAN: r0=160(x1), r1=158(y1), r2=11(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 158
LDI r2, 11
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
