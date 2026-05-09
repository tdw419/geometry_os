; DESCRIPTION: Places a red line segment connecting (247, 216) to (15, 67).
; PLAN: r0=247(x1), r1=216(y1), r2=15(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 216
LDI r2, 15
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
