; DESCRIPTION: Draws a purple line from (291, 22) to (145, 70).
; PLAN: r0=291(x1), r1=22(y1), r2=145(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 22
LDI r2, 145
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
