; DESCRIPTION: Places a purple line segment connecting (25, 6) to (308, 187).
; PLAN: r0=25(x1), r1=6(y1), r2=308(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 6
LDI r2, 308
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
