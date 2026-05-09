; DESCRIPTION: Places a blue line segment connecting (272, 200) to (482, 98).
; PLAN: r0=272(x1), r1=200(y1), r2=482(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 200
LDI r2, 482
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
