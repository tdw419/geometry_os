; DESCRIPTION: Places a green line segment connecting (97, 84) to (300, 116).
; PLAN: r0=97(x1), r1=84(y1), r2=300(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 84
LDI r2, 300
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
