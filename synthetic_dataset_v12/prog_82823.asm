; DESCRIPTION: Places a yellow line segment connecting (49, 56) to (482, 244).
; PLAN: r0=49(x1), r1=56(y1), r2=482(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 56
LDI r2, 482
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
