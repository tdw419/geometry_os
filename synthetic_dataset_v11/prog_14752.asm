; DESCRIPTION: Places a purple line segment connecting (25, 220) to (140, 62).
; PLAN: r0=25(x1), r1=220(y1), r2=140(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 220
LDI r2, 140
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
