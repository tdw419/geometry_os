; DESCRIPTION: Draws a blue line from (101, 201) to (229, 198).
; PLAN: r0=101(x1), r1=201(y1), r2=229(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 201
LDI r2, 229
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
