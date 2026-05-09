; DESCRIPTION: Places a purple line segment connecting (326, 46) to (46, 22).
; PLAN: r0=326(x1), r1=46(y1), r2=46(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 46
LDI r2, 46
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
