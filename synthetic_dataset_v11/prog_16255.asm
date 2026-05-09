; DESCRIPTION: Places a purple line segment connecting (90, 205) to (84, 15).
; PLAN: r0=90(x1), r1=205(y1), r2=84(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 205
LDI r2, 84
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
