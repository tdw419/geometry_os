; DESCRIPTION: Draws a blue line from (179, 122) to (219, 79).
; PLAN: r0=179(x1), r1=122(y1), r2=219(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 122
LDI r2, 219
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
