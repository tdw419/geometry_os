; DESCRIPTION: Places a purple line segment connecting (308, 118) to (482, 18).
; PLAN: r0=308(x1), r1=118(y1), r2=482(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 118
LDI r2, 482
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
