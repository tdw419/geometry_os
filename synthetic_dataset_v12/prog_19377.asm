; DESCRIPTION: Places a orange line segment connecting (94, 28) to (507, 251).
; PLAN: r0=94(x1), r1=28(y1), r2=507(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 28
LDI r2, 507
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
