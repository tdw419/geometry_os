; DESCRIPTION: Places a purple line segment connecting (231, 30) to (430, 166).
; PLAN: r0=231(x1), r1=30(y1), r2=430(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 30
LDI r2, 430
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
