; DESCRIPTION: Places a purple line segment connecting (384, 161) to (133, 150).
; PLAN: r0=384(x1), r1=161(y1), r2=133(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 161
LDI r2, 133
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
