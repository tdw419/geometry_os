; DESCRIPTION: Draws a blue line from (476, 161) to (43, 20).
; PLAN: r0=476(x1), r1=161(y1), r2=43(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 161
LDI r2, 43
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
