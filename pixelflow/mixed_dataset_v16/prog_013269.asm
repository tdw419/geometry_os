; DESCRIPTION: Places a purple line segment connecting (231, 28) to (134, 52).
; PLAN: r0=231(x1), r1=28(y1), r2=134(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 28
LDI r2, 134
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
