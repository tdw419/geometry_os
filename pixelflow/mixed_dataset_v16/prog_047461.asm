; DESCRIPTION: Places a red line segment connecting (78, 97) to (216, 207).
; PLAN: r0=78(x1), r1=97(y1), r2=216(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 97
LDI r2, 216
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
