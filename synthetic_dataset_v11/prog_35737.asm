; DESCRIPTION: Draws a blue line from (197, 200) to (147, 67).
; PLAN: r0=197(x1), r1=200(y1), r2=147(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 200
LDI r2, 147
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
