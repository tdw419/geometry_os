; DESCRIPTION: Places a white line segment connecting (84, 62) to (505, 70).
; PLAN: r0=84(x1), r1=62(y1), r2=505(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 62
LDI r2, 505
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
