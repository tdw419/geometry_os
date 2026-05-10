; DESCRIPTION: Places a blue line segment connecting (369, 245) to (1, 59).
; PLAN: r0=369(x1), r1=245(y1), r2=1(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 245
LDI r2, 1
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
