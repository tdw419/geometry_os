; DESCRIPTION: Places a purple line segment connecting (175, 95) to (459, 203).
; PLAN: r0=175(x1), r1=95(y1), r2=459(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 95
LDI r2, 459
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
