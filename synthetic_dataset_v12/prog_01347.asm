; DESCRIPTION: Places a purple line segment connecting (365, 89) to (381, 203).
; PLAN: r0=365(x1), r1=89(y1), r2=381(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 89
LDI r2, 381
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
