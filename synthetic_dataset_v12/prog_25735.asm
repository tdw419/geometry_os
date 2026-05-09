; DESCRIPTION: Draws a orange line from (121, 132) to (476, 216).
; PLAN: r0=121(x1), r1=132(y1), r2=476(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 132
LDI r2, 476
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
