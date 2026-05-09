; DESCRIPTION: Places a blue line segment connecting (74, 121) to (34, 147).
; PLAN: r0=74(x1), r1=121(y1), r2=34(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 121
LDI r2, 34
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
