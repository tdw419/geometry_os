; DESCRIPTION: Draws a blue line from (458, 110) to (135, 15).
; PLAN: r0=458(x1), r1=110(y1), r2=135(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 110
LDI r2, 135
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
