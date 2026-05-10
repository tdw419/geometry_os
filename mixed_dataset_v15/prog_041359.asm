; DESCRIPTION: Places a purple line segment connecting (420, 200) to (361, 203).
; PLAN: r0=420(x1), r1=200(y1), r2=361(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 200
LDI r2, 361
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
