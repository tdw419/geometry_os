; DESCRIPTION: Places a blue line segment connecting (34, 71) to (62, 176).
; PLAN: r0=34(x1), r1=71(y1), r2=62(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 71
LDI r2, 62
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
