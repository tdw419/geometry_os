; DESCRIPTION: Places a blue line segment connecting (301, 160) to (501, 130).
; PLAN: r0=301(x1), r1=160(y1), r2=501(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 160
LDI r2, 501
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
