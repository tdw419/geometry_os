; DESCRIPTION: Places a blue line segment connecting (216, 8) to (161, 39).
; PLAN: r0=216(x1), r1=8(y1), r2=161(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 8
LDI r2, 161
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
