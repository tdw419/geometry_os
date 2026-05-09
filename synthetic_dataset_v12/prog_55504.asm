; DESCRIPTION: Places a purple line segment connecting (363, 227) to (501, 166).
; PLAN: r0=363(x1), r1=227(y1), r2=501(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 227
LDI r2, 501
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
