; DESCRIPTION: Places a blue line segment connecting (501, 2) to (414, 167).
; PLAN: r0=501(x1), r1=2(y1), r2=414(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 2
LDI r2, 414
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
