; DESCRIPTION: Draws a blue line from (476, 214) to (427, 72).
; PLAN: r0=476(x1), r1=214(y1), r2=427(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 214
LDI r2, 427
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
