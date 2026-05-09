; DESCRIPTION: Places a white line segment connecting (158, 97) to (68, 89).
; PLAN: r0=158(x1), r1=97(y1), r2=68(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 97
LDI r2, 68
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
