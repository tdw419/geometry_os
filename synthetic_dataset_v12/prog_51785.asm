; DESCRIPTION: Places a blue line segment connecting (77, 121) to (438, 151).
; PLAN: r0=77(x1), r1=121(y1), r2=438(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 121
LDI r2, 438
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
