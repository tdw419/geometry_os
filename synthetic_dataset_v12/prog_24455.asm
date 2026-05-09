; DESCRIPTION: Draws a blue line from (468, 94) to (472, 7).
; PLAN: r0=468(x1), r1=94(y1), r2=472(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 94
LDI r2, 472
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
