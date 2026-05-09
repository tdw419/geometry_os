; DESCRIPTION: Places a purple line segment connecting (482, 153) to (445, 188).
; PLAN: r0=482(x1), r1=153(y1), r2=445(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 153
LDI r2, 445
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
