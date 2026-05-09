; DESCRIPTION: Places a magenta line segment connecting (369, 49) to (244, 170).
; PLAN: r0=369(x1), r1=49(y1), r2=244(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 49
LDI r2, 244
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
