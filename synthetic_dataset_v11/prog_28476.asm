; DESCRIPTION: Places a purple line segment connecting (132, 80) to (128, 29).
; PLAN: r0=132(x1), r1=80(y1), r2=128(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 80
LDI r2, 128
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
