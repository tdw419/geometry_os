; DESCRIPTION: Draws a purple line from (38, 59) to (476, 124).
; PLAN: r0=38(x1), r1=59(y1), r2=476(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 59
LDI r2, 476
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
