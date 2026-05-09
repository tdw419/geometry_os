; DESCRIPTION: Places a blue line segment connecting (11, 79) to (499, 151).
; PLAN: r0=11(x1), r1=79(y1), r2=499(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 79
LDI r2, 499
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
