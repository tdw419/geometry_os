; DESCRIPTION: Places a yellow line segment connecting (350, 38) to (163, 249).
; PLAN: r0=350(x1), r1=38(y1), r2=163(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 38
LDI r2, 163
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
