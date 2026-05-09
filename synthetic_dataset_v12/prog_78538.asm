; DESCRIPTION: Places a blue line segment connecting (302, 23) to (67, 102).
; PLAN: r0=302(x1), r1=23(y1), r2=67(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 23
LDI r2, 67
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
