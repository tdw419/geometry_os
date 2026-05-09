; DESCRIPTION: Places a purple line segment connecting (396, 231) to (260, 64).
; PLAN: r0=396(x1), r1=231(y1), r2=260(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 231
LDI r2, 260
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
