; DESCRIPTION: Places a blue line segment connecting (232, 213) to (369, 46).
; PLAN: r0=232(x1), r1=213(y1), r2=369(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 213
LDI r2, 369
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
