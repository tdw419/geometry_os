; DESCRIPTION: Places a blue line segment connecting (307, 244) to (451, 102).
; PLAN: r0=307(x1), r1=244(y1), r2=451(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 244
LDI r2, 451
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
