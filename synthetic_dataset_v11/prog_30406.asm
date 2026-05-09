; DESCRIPTION: Places a purple line segment connecting (94, 154) to (55, 99).
; PLAN: r0=94(x1), r1=154(y1), r2=55(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 154
LDI r2, 55
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
