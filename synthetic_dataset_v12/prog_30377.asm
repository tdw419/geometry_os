; DESCRIPTION: Places a blue line segment connecting (423, 248) to (308, 78).
; PLAN: r0=423(x1), r1=248(y1), r2=308(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 248
LDI r2, 308
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
