; DESCRIPTION: Draws a blue line from (212, 211) to (101, 201).
; PLAN: r0=212(x1), r1=211(y1), r2=101(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 211
LDI r2, 101
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
