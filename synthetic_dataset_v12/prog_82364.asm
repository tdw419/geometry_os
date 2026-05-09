; DESCRIPTION: Places a purple line segment connecting (172, 245) to (501, 222).
; PLAN: r0=172(x1), r1=245(y1), r2=501(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 245
LDI r2, 501
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
