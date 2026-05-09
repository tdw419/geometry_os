; DESCRIPTION: Draws a blue line from (476, 199) to (147, 194).
; PLAN: r0=476(x1), r1=199(y1), r2=147(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 199
LDI r2, 147
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
