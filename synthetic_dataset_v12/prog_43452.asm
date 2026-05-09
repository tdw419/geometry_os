; DESCRIPTION: Places a purple line segment connecting (107, 50) to (86, 232).
; PLAN: r0=107(x1), r1=50(y1), r2=86(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 50
LDI r2, 86
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
