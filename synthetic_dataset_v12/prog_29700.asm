; DESCRIPTION: Places a blue line segment connecting (123, 40) to (409, 155).
; PLAN: r0=123(x1), r1=40(y1), r2=409(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 40
LDI r2, 409
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
