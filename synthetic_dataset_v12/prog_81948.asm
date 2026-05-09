; DESCRIPTION: Draws a blue line from (88, 95) to (1, 25).
; PLAN: r0=88(x1), r1=95(y1), r2=1(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 95
LDI r2, 1
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
