; DESCRIPTION: Places a purple line segment connecting (7, 32) to (150, 97).
; PLAN: r0=7(x1), r1=32(y1), r2=150(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 32
LDI r2, 150
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
