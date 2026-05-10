; DESCRIPTION: Places a blue line segment connecting (210, 192) to (315, 225).
; PLAN: r0=210(x1), r1=192(y1), r2=315(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 192
LDI r2, 315
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
