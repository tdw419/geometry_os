; DESCRIPTION: Places a purple line segment connecting (301, 156) to (5, 28).
; PLAN: r0=301(x1), r1=156(y1), r2=5(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 156
LDI r2, 5
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
