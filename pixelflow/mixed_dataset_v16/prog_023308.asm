; DESCRIPTION: Places a red line segment connecting (379, 18) to (311, 11).
; PLAN: r0=379(x1), r1=18(y1), r2=311(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 18
LDI r2, 311
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
