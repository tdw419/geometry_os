; DESCRIPTION: Places a purple line segment connecting (469, 231) to (84, 80).
; PLAN: r0=469(x1), r1=231(y1), r2=84(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 231
LDI r2, 84
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
