; DESCRIPTION: Places a blue line segment connecting (339, 230) to (183, 54).
; PLAN: r0=339(x1), r1=230(y1), r2=183(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 230
LDI r2, 183
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
