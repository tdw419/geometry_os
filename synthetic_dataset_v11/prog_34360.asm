; DESCRIPTION: Places a purple line segment connecting (10, 155) to (176, 28).
; PLAN: r0=10(x1), r1=155(y1), r2=176(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 155
LDI r2, 176
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
