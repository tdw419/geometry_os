; DESCRIPTION: Places a purple line segment connecting (63, 119) to (4, 240).
; PLAN: r0=63(x1), r1=119(y1), r2=4(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 119
LDI r2, 4
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
