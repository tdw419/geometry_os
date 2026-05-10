; DESCRIPTION: Places a black line segment connecting (38, 68) to (311, 188).
; PLAN: r0=38(x1), r1=68(y1), r2=311(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 68
LDI r2, 311
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
