; DESCRIPTION: Places a purple line segment connecting (482, 141) to (94, 80).
; PLAN: r0=482(x1), r1=141(y1), r2=94(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 141
LDI r2, 94
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
