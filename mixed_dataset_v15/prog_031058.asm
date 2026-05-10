; DESCRIPTION: Places a orange line segment connecting (186, 179) to (62, 141).
; PLAN: r0=186(x1), r1=179(y1), r2=62(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 179
LDI r2, 62
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
