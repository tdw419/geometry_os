; DESCRIPTION: Places a purple line segment connecting (259, 99) to (252, 46).
; PLAN: r0=259(x1), r1=99(y1), r2=252(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 99
LDI r2, 252
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
