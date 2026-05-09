; DESCRIPTION: Places a purple line segment connecting (84, 149) to (144, 61).
; PLAN: r0=84(x1), r1=149(y1), r2=144(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 149
LDI r2, 144
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
