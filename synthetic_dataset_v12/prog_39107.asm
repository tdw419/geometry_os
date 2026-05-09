; DESCRIPTION: Places a purple line segment connecting (482, 229) to (408, 16).
; PLAN: r0=482(x1), r1=229(y1), r2=408(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 229
LDI r2, 408
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
