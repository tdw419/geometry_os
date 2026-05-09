; DESCRIPTION: Places a blue line segment connecting (333, 15) to (44, 62).
; PLAN: r0=333(x1), r1=15(y1), r2=44(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 15
LDI r2, 44
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
