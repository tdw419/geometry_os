; DESCRIPTION: Places a purple line segment connecting (481, 108) to (221, 54).
; PLAN: r0=481(x1), r1=108(y1), r2=221(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 108
LDI r2, 221
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
