; DESCRIPTION: Places a purple line segment connecting (134, 140) to (480, 79).
; PLAN: r0=134(x1), r1=140(y1), r2=480(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 140
LDI r2, 480
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
