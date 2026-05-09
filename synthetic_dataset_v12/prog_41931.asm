; DESCRIPTION: Places a purple line segment connecting (501, 9) to (445, 129).
; PLAN: r0=501(x1), r1=9(y1), r2=445(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 9
LDI r2, 445
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
