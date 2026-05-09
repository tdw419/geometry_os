; DESCRIPTION: Places a purple line segment connecting (212, 75) to (127, 88).
; PLAN: r0=212(x1), r1=75(y1), r2=127(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 75
LDI r2, 127
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
