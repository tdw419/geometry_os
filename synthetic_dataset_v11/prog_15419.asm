; DESCRIPTION: Places a purple line segment connecting (5, 230) to (99, 90).
; PLAN: r0=5(x1), r1=230(y1), r2=99(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 230
LDI r2, 99
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
