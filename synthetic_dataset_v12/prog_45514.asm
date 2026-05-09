; DESCRIPTION: Places a blue line segment connecting (313, 94) to (122, 225).
; PLAN: r0=313(x1), r1=94(y1), r2=122(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 94
LDI r2, 122
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
