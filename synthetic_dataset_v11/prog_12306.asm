; DESCRIPTION: Places a purple line segment connecting (3, 86) to (203, 221).
; PLAN: r0=3(x1), r1=86(y1), r2=203(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 86
LDI r2, 203
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
