; DESCRIPTION: Places a blue line segment connecting (409, 84) to (321, 14).
; PLAN: r0=409(x1), r1=84(y1), r2=321(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 84
LDI r2, 321
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
