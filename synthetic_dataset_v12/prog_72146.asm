; DESCRIPTION: Places a purple line segment connecting (138, 34) to (308, 244).
; PLAN: r0=138(x1), r1=34(y1), r2=308(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 34
LDI r2, 308
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
