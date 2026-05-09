; DESCRIPTION: Places a white line segment connecting (216, 158) to (43, 44).
; PLAN: r0=216(x1), r1=158(y1), r2=43(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 158
LDI r2, 43
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
