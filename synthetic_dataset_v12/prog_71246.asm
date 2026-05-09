; DESCRIPTION: Places a blue line segment connecting (500, 207) to (378, 59).
; PLAN: r0=500(x1), r1=207(y1), r2=378(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 207
LDI r2, 378
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
