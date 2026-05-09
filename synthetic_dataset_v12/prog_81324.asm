; DESCRIPTION: Draws a purple line from (412, 15) to (476, 36).
; PLAN: r0=412(x1), r1=15(y1), r2=476(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 15
LDI r2, 476
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
