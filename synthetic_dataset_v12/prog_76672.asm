; DESCRIPTION: Places a purple line segment connecting (451, 99) to (344, 182).
; PLAN: r0=451(x1), r1=99(y1), r2=344(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 99
LDI r2, 344
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
