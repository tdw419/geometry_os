; DESCRIPTION: Places a white line segment connecting (52, 70) to (31, 212).
; PLAN: r0=52(x1), r1=70(y1), r2=31(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 70
LDI r2, 31
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
