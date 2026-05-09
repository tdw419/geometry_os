; DESCRIPTION: Places a blue line segment connecting (225, 20) to (68, 217).
; PLAN: r0=225(x1), r1=20(y1), r2=68(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 20
LDI r2, 68
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
