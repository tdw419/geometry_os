; DESCRIPTION: Places a purple line segment connecting (62, 249) to (160, 98).
; PLAN: r0=62(x1), r1=249(y1), r2=160(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 249
LDI r2, 160
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
