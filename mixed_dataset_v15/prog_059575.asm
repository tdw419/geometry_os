; DESCRIPTION: Places a blue line segment connecting (438, 227) to (495, 127).
; PLAN: r0=438(x1), r1=227(y1), r2=495(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 227
LDI r2, 495
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
