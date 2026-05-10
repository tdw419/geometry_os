; DESCRIPTION: Places a purple line segment connecting (192, 14) to (446, 140).
; PLAN: r0=192(x1), r1=14(y1), r2=446(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 14
LDI r2, 446
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
