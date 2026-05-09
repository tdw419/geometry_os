; DESCRIPTION: Places a blue line segment connecting (232, 174) to (108, 21).
; PLAN: r0=232(x1), r1=174(y1), r2=108(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 174
LDI r2, 108
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
