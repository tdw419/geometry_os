; DESCRIPTION: Places a purple line segment connecting (25, 250) to (50, 145).
; PLAN: r0=25(x1), r1=250(y1), r2=50(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 250
LDI r2, 50
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
