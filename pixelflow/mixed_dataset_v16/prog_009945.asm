; DESCRIPTION: Places a purple line segment connecting (344, 145) to (282, 10).
; PLAN: r0=344(x1), r1=145(y1), r2=282(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 145
LDI r2, 282
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
