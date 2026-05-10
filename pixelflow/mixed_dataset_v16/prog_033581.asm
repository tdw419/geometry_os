; DESCRIPTION: Places a blue line segment connecting (501, 195) to (431, 96).
; PLAN: r0=501(x1), r1=195(y1), r2=431(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 195
LDI r2, 431
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
