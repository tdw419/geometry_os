; DESCRIPTION: Places a green line segment connecting (482, 153) to (338, 99).
; PLAN: r0=482(x1), r1=153(y1), r2=338(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 153
LDI r2, 338
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
