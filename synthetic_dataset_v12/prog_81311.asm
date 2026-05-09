; DESCRIPTION: Draws a blue line from (88, 212) to (31, 35).
; PLAN: r0=88(x1), r1=212(y1), r2=31(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 212
LDI r2, 31
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
