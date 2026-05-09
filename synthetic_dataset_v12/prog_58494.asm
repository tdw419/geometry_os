; DESCRIPTION: Draws a purple line from (476, 14) to (388, 8).
; PLAN: r0=476(x1), r1=14(y1), r2=388(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 14
LDI r2, 388
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
