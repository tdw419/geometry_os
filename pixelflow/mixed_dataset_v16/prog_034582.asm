; DESCRIPTION: Draws a blue line from (155, 201) to (114, 89).
; PLAN: r0=155(x1), r1=201(y1), r2=114(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 201
LDI r2, 114
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
