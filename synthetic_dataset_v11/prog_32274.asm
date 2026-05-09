; DESCRIPTION: Draws a blue line from (147, 232) to (209, 229).
; PLAN: r0=147(x1), r1=232(y1), r2=209(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 232
LDI r2, 209
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
