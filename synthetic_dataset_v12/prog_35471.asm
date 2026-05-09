; DESCRIPTION: Places a blue line segment connecting (369, 123) to (218, 206).
; PLAN: r0=369(x1), r1=123(y1), r2=218(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 123
LDI r2, 218
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
