; DESCRIPTION: Places a blue line segment connecting (326, 171) to (181, 105).
; PLAN: r0=326(x1), r1=171(y1), r2=181(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 171
LDI r2, 181
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
