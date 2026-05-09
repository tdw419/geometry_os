; DESCRIPTION: Places a red line segment connecting (18, 204) to (139, 188).
; PLAN: r0=18(x1), r1=204(y1), r2=139(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 204
LDI r2, 139
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
