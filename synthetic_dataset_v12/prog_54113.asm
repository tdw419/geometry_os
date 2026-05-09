; DESCRIPTION: Draws a blue line from (36, 232) to (137, 197).
; PLAN: r0=36(x1), r1=232(y1), r2=137(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 232
LDI r2, 137
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
