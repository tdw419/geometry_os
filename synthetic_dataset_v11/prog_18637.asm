; DESCRIPTION: Places a purple line segment connecting (49, 145) to (218, 46).
; PLAN: r0=49(x1), r1=145(y1), r2=218(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 145
LDI r2, 218
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
