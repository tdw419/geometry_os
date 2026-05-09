; DESCRIPTION: Places a magenta line segment connecting (482, 231) to (355, 240).
; PLAN: r0=482(x1), r1=231(y1), r2=355(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 231
LDI r2, 355
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
