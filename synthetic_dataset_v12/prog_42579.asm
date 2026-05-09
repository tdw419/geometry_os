; DESCRIPTION: Places a blue line segment connecting (353, 60) to (104, 225).
; PLAN: r0=353(x1), r1=60(y1), r2=104(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 60
LDI r2, 104
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
