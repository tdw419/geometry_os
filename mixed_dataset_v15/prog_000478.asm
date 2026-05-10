; DESCRIPTION: Places a white line segment connecting (326, 22) to (55, 54).
; PLAN: r0=326(x1), r1=22(y1), r2=55(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 22
LDI r2, 55
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
