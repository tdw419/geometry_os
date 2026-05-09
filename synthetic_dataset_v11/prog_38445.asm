; DESCRIPTION: Places a purple line segment connecting (227, 231) to (198, 241).
; PLAN: r0=227(x1), r1=231(y1), r2=198(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 231
LDI r2, 198
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
