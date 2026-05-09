; DESCRIPTION: Places a purple line segment connecting (12, 107) to (118, 25).
; PLAN: r0=12(x1), r1=107(y1), r2=118(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 107
LDI r2, 118
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
