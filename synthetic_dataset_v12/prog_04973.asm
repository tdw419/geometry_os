; DESCRIPTION: Draws a magenta line from (457, 122) to (353, 201).
; PLAN: r0=457(x1), r1=122(y1), r2=353(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 122
LDI r2, 353
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
