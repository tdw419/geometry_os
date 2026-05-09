; DESCRIPTION: Places a purple line segment connecting (147, 59) to (121, 149).
; PLAN: r0=147(x1), r1=59(y1), r2=121(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 59
LDI r2, 121
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
