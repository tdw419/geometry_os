; DESCRIPTION: Places a green line segment connecting (482, 90) to (132, 102).
; PLAN: r0=482(x1), r1=90(y1), r2=132(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 90
LDI r2, 132
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
